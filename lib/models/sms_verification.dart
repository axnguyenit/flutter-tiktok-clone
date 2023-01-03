import 'entity.dart';

class SMSVerification extends Entity {
  final String phoneNumber;
  final String? verificationId;

  SMSVerification({
    required this.phoneNumber,
    this.verificationId,
  });

  @override
  Map<String, dynamic> toJson() {
    return {
      'phoneNumber': phoneNumber,
      'verificationId': verificationId,
    };
  }

  @override
  List<Object> get props => [phoneNumber];
}
