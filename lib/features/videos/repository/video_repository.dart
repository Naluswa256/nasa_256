import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tiktok/core/di/locator.dart';
import 'package:tiktok/core/localStorage/local_storage.dart';
import 'package:tiktok/features/videos/models/comment_model.dart';
import 'package:tiktok/features/videos/models/video_model.dart';
import 'package:video_compress/video_compress.dart';
import 'package:either_dart/either.dart';
import 'package:uuid/uuid.dart';

typedef EitherException<T> = Future<Either<Exception, T>>;

class VideosRepository {
  final FirebaseFirestore _db = locator<FirebaseFirestore>();
  final FirebaseStorage _storage = locator<FirebaseStorage>();
  final FirebaseAuth _firebaseAuth = locator<FirebaseAuth>();
  final localStorage = locator<LocalStorageService>();
  compressVideo(String videoPath) async {
    final compressedVideo = await VideoCompress.compressVideo(videoPath,
        quality: VideoQuality.MediumQuality, includeAudio: true);
    return compressedVideo!.file;
  }

  Future<String> uploadVideoToStorage(String id, String videoPath) async {
    Reference ref = _storage.ref().child(
          "/videos/$id/${DateTime.now().millisecondsSinceEpoch.toString()}",
        );

    UploadTask uploadTask = ref.putFile(await compressVideo(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  Future<String> _uploadImageToStorage(String id, String videoPath) async {
    Reference ref = _storage.ref().child('thumbnails').child(id);
    UploadTask uploadTask = ref.putFile(await getThumbnail(videoPath));
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  getThumbnail(String videoPath) async {
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<void> uploadVideo(String caption, String videoPath) async {
    final uid = localStorage.uid!;
    //final userDoc = await userCollectionRef.doc(uid).get();

    // Get username and profile photo (assuming these exist in userDoc)
    // final username = (userDoc.data()! as Map<String, dynamic>)['username'];
    // final profilePhoto = (userDoc.data()! as Map<String, dynamic>)['profilePhoto'];

    final videoId = const Uuid().v4();
    final videoUrl = await uploadVideoToStorage(videoId, videoPath);
    String thumbnailUrl = await _uploadImageToStorage(videoId, videoPath);

    final video = VideoModel(
      username: '',
      uid: uid,
      id: videoId, // Generate unique ID
      commentCount: 0,
      shareCount: 0,
      caption: caption,
      videoUrl: videoUrl,
      profilePhoto: '',
      thumbnailUrl: thumbnailUrl,
      createdAt: DateTime.now(), likeCount: 0, tags: [], usersBookmarked: [],
      bookmarkCount: 0, comments: [], userLiked: [],
    );

    await _db.collection('videos').doc(video.id).set(video.toJson());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchVideos({
    DateTime? lastItemCreatedAt,
  }) {
    final query = _db
        .collection("videos")
        .orderBy("createdAt", descending: true)
        .limit(2);
    if (lastItemCreatedAt == null) {
      return query.get();
    } else {
      return query.startAfter([lastItemCreatedAt]).get();
    }
  }
  //NOTIFIER SHOULD USE THIS FUNCTION TO LIKE VIDEO AND UPDATE THE VALUE AND UI SHOULD UPDATE AUTOMATICALLY 
  Future<void> likeVideo(String id) async {
    final uid = _firebaseAuth.currentUser!.uid;

    // Perform a transaction to ensure consistency
    return await _db.runTransaction((transaction) async {
      final DocumentSnapshot doc =
          await transaction.get(_db.collection('videos').doc(id));

      bool isLiked = (doc.data()! as dynamic)['userLiked'].contains(uid);

      if (isLiked) {
        transaction.update(doc.reference, {
          'userLiked': FieldValue.arrayRemove([uid]),
          'likeCount': FieldValue.increment(-1), // Decrement likeCount
        });
      } else {
        transaction.update(doc.reference, {
          'userLiked': FieldValue.arrayUnion([uid]),
          'likeCount': FieldValue.increment(1), // Increment likeCount
        });
      }
    });
  }

  Future<bool> isUserLiked(String videoId) async {
    final doc = await _db.collection('videos').doc(videoId).get();
    final data = doc.data()!;
    return data['userLiked'].contains(_firebaseAuth.currentUser!.uid);
  }

  Future<bool> isUserBookmarked(String videoId) async {
    final doc = await _db.collection('videos').doc(videoId).get();
    final data = doc.data()!;
    return data['usersBookmarked'].contains(_firebaseAuth.currentUser!.uid);
  }



   //NOTIFIER SHOULD USE THIS FOR TOGGLING BOOKMARK AND UPDATE UI
  Future<void> toggleBookmark(String videoId) async {
    final uid = _firebaseAuth.currentUser!.uid;

    return await _db.runTransaction((transaction) async {
      // Update video document
      final videoDocRef = _db.collection('videos').doc(videoId);
      final videoSnap = await transaction.get(videoDocRef);
      final bool isBookmarked =
          videoSnap.data()!['usersBookmarked'].contains(uid);

      if (isBookmarked) {
        transaction.update(videoDocRef, {
          'usersBookmarked': FieldValue.arrayRemove([uid]),
          'bookmarkCount': FieldValue.increment(-1), // Decrement bookmarkCount
        });
      } else {
        transaction.update(videoDocRef, {
          'usersBookmarked': FieldValue.arrayUnion([uid]),
          'bookmarkCount': FieldValue.increment(1), // Increment bookmarkCount
        });
      }

      // Update user document (assuming users collection)
      final userDocRef = _db.collection('users').doc(uid);
      transaction.update(userDocRef, {
        'favouriteVideos': isBookmarked
            ? FieldValue.arrayRemove(
                [videoId]) // Remove from favourites if bookmarked
            : FieldValue.arrayUnion([videoId]), // Add to favourites otherwise
      });
    });
  }

  Future<List<VideoModel>> fetchFollowingVideos() async {
    final uid = _firebaseAuth.currentUser!.uid;

    // Fetch the user document to get following list
    final userDoc = await _db.collection('users').doc(uid).get();
    final followingList = userDoc.data()!['following']?.cast<String>() ?? [];

    // If there are no following users, return an empty list
    if (followingList.isEmpty) {
      return [];
    }

    // Query videos based on following list
    final querySnapshot = await _db
        .collection('videos')
        .where('uid', whereIn: followingList)
        .orderBy('createdAt', descending: true)
        .get();

    return querySnapshot.docs.map((doc) => VideoModel.fromSnap(doc)).toList();
  }

  Future<List<VideoModel>> fetchVideosByTags(List<String> tags) async {
    final querySnapshot = await _db
        .collection('videos')
        .where('tags', arrayContainsAny: tags)
        .orderBy('createdAt', descending: true)
        .get();
    return querySnapshot.docs.map((doc) => VideoModel.fromSnap(doc)).toList();
  }

//NOTIFIER SHOULD USE THIS FUNCTION TO ADD COMMENT AND UPDATE UI TO DISPLAY THE NEW COMMENT COUNT 
 Future<void> addComment(String videoId, String commentContent, {String? parentId}) async {
  final uid = _firebaseAuth.currentUser!.uid;
  final timestamp = DateTime.now();

  // Generate a unique ID for the comment
  final commentId = const Uuid().v4();

  // Create a new Comment instance
  final newComment = Comment(
    id: commentId,
    content: commentContent,
    createdAt: timestamp,
    userId: uid,
    parentId: parentId,
    profilePhoto: '', // Add profile photo here
  );

  // Convert Comment instance to JSON
  final commentJson = newComment.toJson();

  // Perform a transaction to ensure consistency
  return await _db.runTransaction((transaction) async {
    // Update video document (assuming videos collection)
    final videoDocRef = _db.collection('videos').doc(videoId);
    
    

    transaction.update(videoDocRef, {
      'commentCount': FieldValue.increment(1), // Increment commentCount
    });

    // Add the comment to the Firestore collection
    transaction.set(_db.collection('videos').doc(videoId).collection('comments').doc(commentId), commentJson);
  });
}


  Future<List<Comment>> fetchComments(String videoId) async {
    QuerySnapshot<Map<String, dynamic>> snapshot = await _db
        .collection('videos')
        .doc(videoId)
        .collection('comments')
        .get();
    return snapshot.docs.map((doc) => Comment.fromSnap(doc)).toList();
  }

  Future<List<Comment>> fetchReplies(String parentCommentId) async {
    final QuerySnapshot<Map<String, dynamic>> snapshot = await _db
        .collection('comments')
        .where('parentId', isEqualTo: parentCommentId)
        .get();

    // Convert QuerySnapshot to a List of Comment objects
    final List<Comment> replies =
        snapshot.docs.map((doc) => Comment.fromSnap(doc)).toList();

    return replies;
  }
}
