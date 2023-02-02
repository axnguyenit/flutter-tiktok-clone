import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:common/common.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tiktok/constants/constants.dart';
import 'package:tiktok/enums/enums.dart';
import 'package:tiktok/models/models.dart';
import 'package:tiktok/services/services.dart';

class AuthenticationServiceImpl implements AuthenticationService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<SMSVerification> signInWithPhone({required String phoneNumber}) async {
    final completer = Completer<SMSVerification>();

    unawaited(_auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        debugPrint('CREDENTIAL >>>> $credential');
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        debugPrint('userCredential >>>> $userCredential');
      },
      verificationFailed: completer.completeError,
      codeSent: (String verificationId, int? resendToken) {
        debugPrint(
            'AUTH SERVICE CODE SENT >>>> $verificationId >>>> $resendToken');

        if (!completer.isCompleted) {
          completer.complete(
            SMSVerification(
              phoneNumber: phoneNumber,
              verificationId: verificationId,
            ),
          );
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        if (!completer.isCompleted) {
          completer.complete(
            SMSVerification(
              phoneNumber: phoneNumber,
              verificationId: verificationId,
            ),
          );
        }
      },
    ));

    return completer.future;
  }

  @override
  Future<String?> verifySMSCode({
    required String smsCode,
    required String verificationId,
  }) async {
    final authCredential = PhoneAuthProvider.credential(
      smsCode: smsCode,
      verificationId: verificationId,
    );

    final userCredential = await _auth.signInWithCredential(authCredential);
    final token = userCredential.user!.getIdToken();
    // debugPrint('TOKEN >>>> $token');

    return token;
  }

  @override
  Future<SMSVerification> resendSMS({required String phoneNumber}) async {
    return signInWithPhone(phoneNumber: phoneNumber);
  }

  @override
  Future<String?> signInWithFacebook() async {
    final loginResult = await FacebookAuth.instance.login();

    if (loginResult.accessToken == null) {
      return null;
    }

    final facebookAuthCredential = FacebookAuthProvider.credential(
      loginResult.accessToken!.token,
    );

    log.info(
        'facebookAuthCredential >>>> ${facebookAuthCredential.toString()}');

    final userCredential = await _auth.signInWithCredential(
      facebookAuthCredential,
    );

    log.info('userCredential >>>> ${userCredential.toString()}');

    final token = userCredential.user!.getIdToken();

    if (userCredential.additionalUserInfo?.isNewUser ?? false) {
      await createNewUser(
        user: UserModel(
          uid: _auth.currentUser!.uid,
          email: userCredential.user!.email!,
          fullName: userCredential.user!.displayName!,
          phone: '',
          following: const [],
          follower: const [],
          likes: 0,
          avatar: userCredential.additionalUserInfo?.profile?['picture']['data']
              ['url'],
          provider: AuthProvider.facebook,
          deviceTokens: const [],
        ),
      );
    }

    return token;
  }

  @override
  Future<String?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final googleAuthCredential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    log.info('googleAuthCredential >>>> ${googleAuthCredential.toString()}');

    final userCredential = await _auth.signInWithCredential(
      googleAuthCredential,
    );

    log.info('userCredential >>>> ${userCredential.toString()}');

    final token = userCredential.user!.getIdToken();

    if (userCredential.additionalUserInfo?.isNewUser ?? false) {
      await createNewUser(
        user: UserModel(
          uid: _auth.currentUser!.uid,
          email: userCredential.user!.email!,
          fullName: userCredential.user!.displayName!,
          phone: '',
          following: const [],
          follower: const [],
          likes: 0,
          avatar: userCredential.additionalUserInfo?.profile?['picture'],
          provider: AuthProvider.google,
          deviceTokens: const [],
        ),
      );
    }

    return token;
  }

  @override
  Future<bool> userAlreadyExisted({required String phoneNumber}) async {
    try {
      final user = _firestore
          .collection(
            Collections.users,
          )
          .doc(_auth.currentUser!.uid);

      final snapshot = await user.get();

      // get data => snapshot.data()
      if (!snapshot.exists) {
        return false;
      }

      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<void> createNewUser({required UserModel user}) async {
    await _firestore
        .collection(Collections.users)
        .doc(_auth.currentUser!.uid)
        .set(user.toJson());
  }

  @override
  Future<UserModel> getCurrentUser() async {
    final docRef =
        _firestore.collection(Collections.users).doc(_auth.currentUser!.uid);
    final snapshot = await docRef.get();
    final json = snapshot.data();

    return UserModel.fromJson(json!);
  }

  @override
  Future<String?> getCurrentSession() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return null;
    }

    final accessToken = await currentUser.getIdToken();
    return accessToken;
  }

  @override
  Future<bool> isAuthenticated() async {
    return _auth.currentUser != null;
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}
