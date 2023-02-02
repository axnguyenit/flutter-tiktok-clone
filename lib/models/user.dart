import 'package:tiktok/enums/enums.dart';

import 'entity.dart';

class UserModel extends Entity {
  final String uid;
  final String email;
  final String phone;
  final List<String> following;
  final List<String> follower;
  final int likes;
  final String avatar;
  final String fullName;
  final AuthProvider provider;
  final List<String> deviceTokens;

  UserModel({
    required this.uid,
    required this.email,
    required this.phone,
    required this.following,
    required this.follower,
    required this.likes,
    required this.avatar,
    required this.fullName,
    required this.provider,
    required this.deviceTokens,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      following:
          List<String>.from(json['following'].map((e) => e as String)).toList(),
      follower:
          List<String>.from(json['follower'].map((e) => e as String)).toList(),
      likes: json['likes'] as int,
      avatar: json['avatar'] as String,
      fullName: json['fullName'] as String,
      provider: AuthProvider.fromKey(json['provider']),
      deviceTokens:
          List<String>.from(json['deviceTokens'].map((e) => e as String))
              .toList(),
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
      'avatar': avatar,
      'fullName': fullName,
      'provider': provider.value,
      'deviceTokens': deviceTokens,
    };
  }

  @override
  List<Object> get props => [uid];
}
