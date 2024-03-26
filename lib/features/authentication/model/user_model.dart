import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String uid,
    String? username,
    String? bio,
    @Default('https://www.woolha.com/media/2020/03/eevee.png') String profilePictureUrl, 
    @Default(false) bool isAnonymous,
    @Default([]) List<String> likedVideos,
    @Default([]) List<String> favouriteVideos,
    @Default([]) List<String> createdVideos,
    @Default([]) List<String> blockedAccounts,
     @Default([]) List<String>? interests,
    @Default([]) List<String> posts,
    @Default(0) int followers,
    @Default(0) int following,
    @Default(0) int numberOfLikes,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  factory UserModel.fromFirestore(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return UserModel(
      uid: snapshot.id,
      username: data['username'] as String?,
      bio: data['bio'] as String?,
      profilePictureUrl: data['profilePictureUrl'],
      likedVideos: (data['likedVideos'])?.cast<String>(),
      favouriteVideos: (data['favouriteVideos'])?.cast<String>(),
      createdVideos: (data['createdVideos'])?.cast<String>(),
      blockedAccounts: (data['blockedAccounts'])?.cast<String>(),
      posts: (data['posts'])?.cast<String>(),
      followers: data['followers'],
      numberOfLikes: data['numberOfLikes'],
      interests: data['interest']?.cast<String>(),
    );
  }
}

// Run `flutter pub run build_runner build` to generate the .g.dart file
