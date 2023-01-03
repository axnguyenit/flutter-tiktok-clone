import 'entity.dart';

class Comment extends Entity {
  final String id;
  final String uid;
  final String username;
  final String message;
  final DateTime createdAt;
  final List likes;
  final String avatar;

  Comment({
    required this.id,
    required this.uid,
    required this.username,
    required this.message,
    required this.createdAt,
    required this.likes,
    required this.avatar,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      uid: json['uid'],
      username: json['username'],
      message: json['message'],
      createdAt: json['createdAt'],
      likes: json['likes'],
      avatar: json['avatar'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'username': username,
      'message': message,
      'createdAt': createdAt,
      'likes': likes,
      'avatar': avatar,
    };
  }

  @override
  List<Object> get props => [id];
}
