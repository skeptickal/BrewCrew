import 'package:brew_crew/models/my_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

//create user obj based on Firebase user

  MyUser? _userFromFirebaseUser(User user) {
    return user != null ? MyUser(uid: user.uid) : null;
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
}
