import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class BaseAuth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Future<String?> signIn(String? email, String? password);

  Future<String?> signUp(String? email, String? password);

  Future<String?> signInAnon();

  Future<String> signInWithOTP(smsCode, verId);

  Future<User?> getCurrentUser();

  Future<void> sendEmailVerification();

  Future<void> resetPassword(String? email);

  Future<void> signOut();

  Future<bool> isEmailVerified();

  Future<String?> currentUser() async {
    User? user = _firebaseAuth.currentUser;
    return user?.uid;
  }

  Future<String?> userEmail() async {
    User? user = _firebaseAuth.currentUser;
    //print('USER EMAIL : ' + user.email);
    return user?.email;
  }

  Future<GoogleResult?> signInWithGoogle();

  Future<void> signOutGoogle() async {}
}

class Auth implements BaseAuth {
  @override
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  final GoogleSignIn googleSignIn = GoogleSignIn();

  Stream<String?> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges().map(
            (User? user) => user?.uid,
          );

  @override
  Future<String?> signIn(String? email, String? password) async {
    UserCredential result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email!, password: password!);
    if (result.user!.emailVerified) {
      return result.user!.uid;
    }
    return null;
  }

  Future<String> getCurrentUID() async {
    return _firebaseAuth.currentUser!.uid;
  }

  @override
  Future<User?> getCurrentUser() async {
    User? user = _firebaseAuth.currentUser;
    return user;
  }

  @override
  Future<String?> currentUser() async {
    User? user = _firebaseAuth.currentUser;
    //print('USERID : ' + user.uid);
    return user?.uid;
  }

  @override
  Future<String?> userEmail() async {
    User? user = _firebaseAuth.currentUser;
    //print('USER EMAIL : ' + user.email);
    return user?.email;
  }

  @override
  Future<String?> signUp(String? email, String? password) async {
    UserCredential result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email!, password: password!);
    User user = result.user!;
    try {
      await user.sendEmailVerification();
      return result.user!.uid;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // sign in anon
  @override
  Future<String?> signInAnon() async {
    try {
      UserCredential result = await _firebaseAuth.signInAnonymously();
      User user = result.user!;
      return user.uid;
    } catch (e) {
      // print(e.toString());
      return null;
    }
  }

  @override
  Future<void> resetPassword(String? email) async {
    _firebaseAuth.sendPasswordResetEmail(email: email!);
  }

  Future updateUserName(String name, User currentUser) async {
    await currentUser.updateDisplayName(name);
    await currentUser.reload();
  }

  Future convertUserWithEmail(
      String email, String password, String name) async {
    final currentUser = _firebaseAuth.currentUser!;

    final credential =
        EmailAuthProvider.credential(email: email, password: password);
    await currentUser.linkWithCredential(credential);
    await updateUserName(name, currentUser);
  }

  @override
  Future<void> signOut() async {
    _firebaseAuth.signOut();
  }

  @override
  Future<void> sendEmailVerification() async {
    User user = _firebaseAuth.currentUser!;
    user.sendEmailVerification();
  }

  @override
  Future<bool> isEmailVerified() async {
    User user = _firebaseAuth.currentUser!;
    return user.emailVerified;
  }

  @override
  Future<String> signInWithOTP(smsCode, verId) async {
    AuthCredential authCreds =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: smsCode);
    final User user =
        (await _firebaseAuth.signInWithCredential(authCreds)).user!;
    return user.uid;
  }

  @override
  Future<GoogleResult> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);
    final User user = userCredential.user!;

    assert(!user.isAnonymous);

    final User currentUser = _firebaseAuth.currentUser!;
    assert(user.uid == currentUser.uid);

    return GoogleResult(googleSignInAccount, user);
  }

  @override
  Future<void> signOutGoogle() async {
    try {
      await googleSignIn.signOut().whenComplete(() async {
        await _firebaseAuth.signOut();
      });
    } catch (error) {
      debugPrint(error.toString());
    }
  }
}

class GoogleResult {
  final GoogleSignInAccount? profile;
  final User? user;

  GoogleResult(this.profile, this.user);
}
