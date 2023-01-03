import 'package:tiktok/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthenticationService {
  Future<SMSVerification> signInWithPhone({required String phoneNumber});

  Future<String?> verifySMSCode({
    required String smsCode,
    required String verificationId,
  });

  Future<SMSVerification> resendSMS({required String phoneNumber});

  Future<String?> signInWithFacebook();

  Future<String?> signInWithGoogle();

  Future<void> createNewUser({required UserModel user});

  Future<bool> userAlreadyExisted({required String phoneNumber});

  Future<String?> getCurrentSession();

  Future<User?> getCurrentUser();

  Future<void> signOut();

  Future<bool> authenticated();
}
