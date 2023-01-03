import 'entity.dart';

class User extends Entity {
  final String uid;
  final String email;
  final String phone;
  final int following;
  final int follower;
  final int likes;

  User({
    required this.uid,
    required this.email,
    required this.phone,
    required this.following,
    required this.follower,
    required this.likes,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      following: json['following'] as int,
      follower: json['follower'] as int,
      likes: json['likes'] as int,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'phone': phone,
      'following': following,
      'follower': follower,
      'likes': likes,
    };
  }
}
