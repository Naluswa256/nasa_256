// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String get uid => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  String? get profilePictureUrl => throw _privateConstructorUsedError;
  bool get isAnonymous => throw _privateConstructorUsedError;
  List<String>? get likedVideos => throw _privateConstructorUsedError;
  List<String>? get favouriteVideos => throw _privateConstructorUsedError;
  List<String>? get createdVideos => throw _privateConstructorUsedError;
  List<String>? get blockedAccounts => throw _privateConstructorUsedError;
  List<String>? get interests => throw _privateConstructorUsedError;
  List<String>? get posts => throw _privateConstructorUsedError;
  int get followers => throw _privateConstructorUsedError;
  int get following => throw _privateConstructorUsedError;
  int get numberOfLikes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String uid,
      String? username,
      String? email,
      String? phoneNumber,
      String? bio,
      String? profilePictureUrl,
      bool isAnonymous,
      List<String>? likedVideos,
      List<String>? favouriteVideos,
      List<String>? createdVideos,
      List<String>? blockedAccounts,
      List<String>? interests,
      List<String>? posts,
      int followers,
      int following,
      int numberOfLikes});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? username = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? bio = freezed,
    Object? profilePictureUrl = freezed,
    Object? isAnonymous = null,
    Object? likedVideos = freezed,
    Object? favouriteVideos = freezed,
    Object? createdVideos = freezed,
    Object? blockedAccounts = freezed,
    Object? interests = freezed,
    Object? posts = freezed,
    Object? followers = null,
    Object? following = null,
    Object? numberOfLikes = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      likedVideos: freezed == likedVideos
          ? _value.likedVideos
          : likedVideos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      favouriteVideos: freezed == favouriteVideos
          ? _value.favouriteVideos
          : favouriteVideos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdVideos: freezed == createdVideos
          ? _value.createdVideos
          : createdVideos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      blockedAccounts: freezed == blockedAccounts
          ? _value.blockedAccounts
          : blockedAccounts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      interests: freezed == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      posts: freezed == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfLikes: null == numberOfLikes
          ? _value.numberOfLikes
          : numberOfLikes // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String? username,
      String? email,
      String? phoneNumber,
      String? bio,
      String? profilePictureUrl,
      bool isAnonymous,
      List<String>? likedVideos,
      List<String>? favouriteVideos,
      List<String>? createdVideos,
      List<String>? blockedAccounts,
      List<String>? interests,
      List<String>? posts,
      int followers,
      int following,
      int numberOfLikes});
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? username = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? bio = freezed,
    Object? profilePictureUrl = freezed,
    Object? isAnonymous = null,
    Object? likedVideos = freezed,
    Object? favouriteVideos = freezed,
    Object? createdVideos = freezed,
    Object? blockedAccounts = freezed,
    Object? interests = freezed,
    Object? posts = freezed,
    Object? followers = null,
    Object? following = null,
    Object? numberOfLikes = null,
  }) {
    return _then(_$UserModelImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      bio: freezed == bio
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isAnonymous: null == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool,
      likedVideos: freezed == likedVideos
          ? _value._likedVideos
          : likedVideos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      favouriteVideos: freezed == favouriteVideos
          ? _value._favouriteVideos
          : favouriteVideos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdVideos: freezed == createdVideos
          ? _value._createdVideos
          : createdVideos // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      blockedAccounts: freezed == blockedAccounts
          ? _value._blockedAccounts
          : blockedAccounts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      interests: freezed == interests
          ? _value._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      posts: freezed == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      followers: null == followers
          ? _value.followers
          : followers // ignore: cast_nullable_to_non_nullable
              as int,
      following: null == following
          ? _value.following
          : following // ignore: cast_nullable_to_non_nullable
              as int,
      numberOfLikes: null == numberOfLikes
          ? _value.numberOfLikes
          : numberOfLikes // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl implements _UserModel {
  const _$UserModelImpl(
      {required this.uid,
      this.username,
      this.email,
      this.phoneNumber,
      this.bio,
      this.profilePictureUrl,
      this.isAnonymous = false,
      final List<String>? likedVideos = const [],
      final List<String>? favouriteVideos = const [],
      final List<String>? createdVideos = const [],
      final List<String>? blockedAccounts = const [],
      final List<String>? interests = const [],
      final List<String>? posts = const [],
      this.followers = 0,
      this.following = 0,
      this.numberOfLikes = 0})
      : _likedVideos = likedVideos,
        _favouriteVideos = favouriteVideos,
        _createdVideos = createdVideos,
        _blockedAccounts = blockedAccounts,
        _interests = interests,
        _posts = posts;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String uid;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? bio;
  @override
  final String? profilePictureUrl;
  @override
  @JsonKey()
  final bool isAnonymous;
  final List<String>? _likedVideos;
  @override
  @JsonKey()
  List<String>? get likedVideos {
    final value = _likedVideos;
    if (value == null) return null;
    if (_likedVideos is EqualUnmodifiableListView) return _likedVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _favouriteVideos;
  @override
  @JsonKey()
  List<String>? get favouriteVideos {
    final value = _favouriteVideos;
    if (value == null) return null;
    if (_favouriteVideos is EqualUnmodifiableListView) return _favouriteVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _createdVideos;
  @override
  @JsonKey()
  List<String>? get createdVideos {
    final value = _createdVideos;
    if (value == null) return null;
    if (_createdVideos is EqualUnmodifiableListView) return _createdVideos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _blockedAccounts;
  @override
  @JsonKey()
  List<String>? get blockedAccounts {
    final value = _blockedAccounts;
    if (value == null) return null;
    if (_blockedAccounts is EqualUnmodifiableListView) return _blockedAccounts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _interests;
  @override
  @JsonKey()
  List<String>? get interests {
    final value = _interests;
    if (value == null) return null;
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _posts;
  @override
  @JsonKey()
  List<String>? get posts {
    final value = _posts;
    if (value == null) return null;
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final int followers;
  @override
  @JsonKey()
  final int following;
  @override
  @JsonKey()
  final int numberOfLikes;

  @override
  String toString() {
    return 'UserModel(uid: $uid, username: $username, email: $email, phoneNumber: $phoneNumber, bio: $bio, profilePictureUrl: $profilePictureUrl, isAnonymous: $isAnonymous, likedVideos: $likedVideos, favouriteVideos: $favouriteVideos, createdVideos: $createdVideos, blockedAccounts: $blockedAccounts, interests: $interests, posts: $posts, followers: $followers, following: $following, numberOfLikes: $numberOfLikes)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.bio, bio) || other.bio == bio) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                other.profilePictureUrl == profilePictureUrl) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            const DeepCollectionEquality()
                .equals(other._likedVideos, _likedVideos) &&
            const DeepCollectionEquality()
                .equals(other._favouriteVideos, _favouriteVideos) &&
            const DeepCollectionEquality()
                .equals(other._createdVideos, _createdVideos) &&
            const DeepCollectionEquality()
                .equals(other._blockedAccounts, _blockedAccounts) &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests) &&
            const DeepCollectionEquality().equals(other._posts, _posts) &&
            (identical(other.followers, followers) ||
                other.followers == followers) &&
            (identical(other.following, following) ||
                other.following == following) &&
            (identical(other.numberOfLikes, numberOfLikes) ||
                other.numberOfLikes == numberOfLikes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      uid,
      username,
      email,
      phoneNumber,
      bio,
      profilePictureUrl,
      isAnonymous,
      const DeepCollectionEquality().hash(_likedVideos),
      const DeepCollectionEquality().hash(_favouriteVideos),
      const DeepCollectionEquality().hash(_createdVideos),
      const DeepCollectionEquality().hash(_blockedAccounts),
      const DeepCollectionEquality().hash(_interests),
      const DeepCollectionEquality().hash(_posts),
      followers,
      following,
      numberOfLikes);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {required final String uid,
      final String? username,
      final String? email,
      final String? phoneNumber,
      final String? bio,
      final String? profilePictureUrl,
      final bool isAnonymous,
      final List<String>? likedVideos,
      final List<String>? favouriteVideos,
      final List<String>? createdVideos,
      final List<String>? blockedAccounts,
      final List<String>? interests,
      final List<String>? posts,
      final int followers,
      final int following,
      final int numberOfLikes}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String get uid;
  @override
  String? get username;
  @override
  String? get email;
  @override
  String? get phoneNumber;
  @override
  String? get bio;
  @override
  String? get profilePictureUrl;
  @override
  bool get isAnonymous;
  @override
  List<String>? get likedVideos;
  @override
  List<String>? get favouriteVideos;
  @override
  List<String>? get createdVideos;
  @override
  List<String>? get blockedAccounts;
  @override
  List<String>? get interests;
  @override
  List<String>? get posts;
  @override
  int get followers;
  @override
  int get following;
  @override
  int get numberOfLikes;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
