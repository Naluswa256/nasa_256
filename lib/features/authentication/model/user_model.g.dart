// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      uid: json['uid'] as String,
      username: json['username'] as String?,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      bio: json['bio'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String?,
      isAnonymous: json['isAnonymous'] as bool? ?? false,
      likedVideos: (json['likedVideos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      favouriteVideos: (json['favouriteVideos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      createdVideos: (json['createdVideos'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      blockedAccounts: (json['blockedAccounts'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      interests: (json['interests'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      posts:
          (json['posts'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
      followers: json['followers'] as int? ?? 0,
      following: json['following'] as int? ?? 0,
      numberOfLikes: json['numberOfLikes'] as int? ?? 0,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'username': instance.username,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'bio': instance.bio,
      'profilePictureUrl': instance.profilePictureUrl,
      'isAnonymous': instance.isAnonymous,
      'likedVideos': instance.likedVideos,
      'favouriteVideos': instance.favouriteVideos,
      'createdVideos': instance.createdVideos,
      'blockedAccounts': instance.blockedAccounts,
      'interests': instance.interests,
      'posts': instance.posts,
      'followers': instance.followers,
      'following': instance.following,
      'numberOfLikes': instance.numberOfLikes,
    };
