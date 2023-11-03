// ignore_for_file: avoid_print

import 'package:brew_crew/models/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//create user obj based on Firebase user

  MyUser? _userFromFirebaseUser(User user) {
    // ignore: unnecessary_null_comparison
    return user != null ? MyUser(uid: user.uid) : null;
  }

//auth change user stream
  Stream<MyUser?> get user {
    return _auth.authStateChanges().map((User? user) {
      return _userFromFirebaseUser(user!);
    });
  }

//sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User? user = result.user;
      return _userFromFirebaseUser(user!);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email and password

// register with email & password

// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
