import 'package:cloud_firestore/cloud_firestore.dart';
import './comment_model.dart';

class VideoModel {
  String username;
  String uid;
  String id;
  int likeCount; // Total number of likes
  int commentCount; // Maintain comment count for efficiency
  int shareCount;
  String caption;
  String videoUrl;
  String thumbnailUrl;
  String profilePhoto;
  DateTime createdAt;
  List<String> tags;
  List<String> usersBookmarked;
  List<String> userLiked; // List of bookmarked video IDs
  int bookmarkCount; // Total number of bookmarks

  // Additional fields for comments
  List<Comment> comments; // List of Comment objects

  VideoModel({
    required this.username,
    required this.uid,
    required this.id,
    required this.likeCount,
    required this.commentCount,
    required this.shareCount,
    required this.caption,
    required this.videoUrl,
    required this.thumbnailUrl,
    required this.profilePhoto,
    required this.createdAt,
    required this.tags,
    required this.usersBookmarked,
    required this.bookmarkCount,
    required this.comments,
    required this.userLiked
  });

  Map<String, dynamic> toJson() => {
        "username": username,
        "uid": uid,
        "id": id,
        "likeCount": likeCount,
        "commentCount": commentCount,
        "shareCount": shareCount,
        "caption": caption,
        "videoUrl": videoUrl,
        "thumbnailUrl": thumbnailUrl,
        "profilePhoto": profilePhoto,
        "createdAt": createdAt,
        "tags": tags,
        "usersBookmarked": usersBookmarked,
        'userLiked':userLiked,
        "bookmarkCount": bookmarkCount,
        "comments": comments.map((comment) => comment.toJson()).toList(),
      };

  static VideoModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return VideoModel(
      username: snapshot['username'],
      uid: snapshot['uid'],
      id: snapshot['id'],
      likeCount: (snapshot['likes'] as List<dynamic>?)?.length ?? 0,
      commentCount: snapshot['commentCount'],
      shareCount: snapshot['shareCount'],
      caption: snapshot['caption'],
      videoUrl: snapshot['videoUrl'],
      profilePhoto: snapshot['profilePhoto'],
      thumbnailUrl: snapshot['thumbnailUrl'],
      createdAt:DateTime.parse(snapshot['createdAt'].toDate().toString()),
      tags: snapshot['tags']?.cast<String>() ?? [],
      usersBookmarked: snapshot['usersBookmarked']?.cast<String>() ?? [],
      userLiked: snapshot['userLiked']?.cast<String>() ?? [],
      bookmarkCount:
          (snapshot['usersBookmarked'] as List<dynamic>?)?.length ?? 0,
      comments: (snapshot['comments'] as List<dynamic>?)
    ?.map<Comment>((comment) => Comment.fromSnap(comment as DocumentSnapshot))
    .toList() ??
    [],
    );
  }

  factory VideoModel.fromJson(Map<String, dynamic> json) => VideoModel(
        username: json['username'] as String,
        uid: json['uid'] as String,
        id: json['id'] as String,
        likeCount: json['likeCount'] as int,
        commentCount: json['commentCount'] as int,
        shareCount: json['shareCount'] as int,
        caption: json['caption'] as String,
        videoUrl: json['videoUrl'] as String,
        profilePhoto: json['profilePhoto'] as String,
        thumbnailUrl: json['thumbnailUrl'] as String,
        createdAt: json['createdAt'] as DateTime,
        tags: json['tags']?.cast<String>() ?? [],
        usersBookmarked: json['usersBookmarked']?.cast<String>() ?? [],
        userLiked: json['userLiked']?.cast<String>() ?? [],
        bookmarkCount: json['bookmarkCount'] as int,
        comments: json.containsKey('comments')
            ? json['comments']
                .map((comment) =>
                    Comment.fromJson(comment as Map<String, dynamic>))
                .toList()
            : [], // Handle potential absence of "comments" key
      );
}
