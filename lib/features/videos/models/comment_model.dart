import 'package:cloud_firestore/cloud_firestore.dart';

class Comment {
  final String id; // Unique identifier for the comment
  final String content; // Text content of the comment
  final DateTime createdAt; // Timestamp of comment creation
  final String? userId; // Optional user ID for the comment author
  final String? parentId;
  final String profilePhoto; // Optional parent comment ID for replies

  Comment({
    required this.id,
    required this.content,
    required this.createdAt,
    required this.profilePhoto,
    this.userId,
    this.parentId,
  });

  // Factory constructor for creating replies with a parentId
  factory Comment.reply({
    required String id,
    required String content,
    required DateTime createdAt,
    required String userId,
    required String parentId,
    required String profilePhoto
  }) =>
      Comment(
        id: id,
        content: content,
        createdAt: createdAt,
        userId: userId,
        parentId: parentId, profilePhoto: profilePhoto,
      );

  // Function to check if the comment is a reply
  bool isReply() => parentId != null;

  // Function to convert a Comment to a JSON String
  Map<String, dynamic> toJson() => {
        'id': id,
        'content': content,
        'createdAt':
            createdAt, 
        'userId': userId,
        'parentId': parentId,
        'profilePhoto':profilePhoto
      };
  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
        id: json['id'] as String,
        content: json['content'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        userId: json['userId'] as String?,
        parentId: json['parentId'] as String?,
        profilePhoto: json['profilePhoto'] as String,
      );
  static Comment fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return Comment(
      id: snapshot['id'] as String,
      content: snapshot['content'] as String,
      createdAt:snapshot['createAt'],
      userId: snapshot['userId'] as String?,
      parentId: snapshot['parentId'] as String?, profilePhoto: snapshot['profilePhoto'],
    );
  }
}
