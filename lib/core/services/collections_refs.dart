import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok/features/authentication/model/user_model.dart';
import 'package:tiktok/features/videos/models/video_model.dart';

final userCollectionRef =
    FirebaseFirestore.instance.collection('users').withConverter<UserModel>(
          fromFirestore: (snapshot, _) => UserModel.fromFirestore(snapshot),
          toFirestore: (user, _) => user.toJson(),
        );

final videosCollectionRef =
    FirebaseFirestore.instance.collection('videos').withConverter<VideoModel>(
          fromFirestore: (snapshot, _) => VideoModel.fromSnap(snapshot),
          toFirestore: (video, _) => video.toJson(),
        );
