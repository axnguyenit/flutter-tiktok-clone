import 'entity.dart';

class User extends Entity {
  final String uid;
  final String email;
  final String phone;

  User({
    required this.uid,
    required this.email,
    required this.phone,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['uid'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'phone': phone,
    };
  }
}
