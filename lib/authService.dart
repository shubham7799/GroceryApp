import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class AuthenticationService {
  final FirebaseAuth _firebaseAuth;

  static String UID;

  AuthenticationService(this._firebaseAuth);

  Stream<User> get authStateChanges => _firebaseAuth.idTokenChanges();

  Future<String> login({String email, String password}) async {
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return "Signed in";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<String> signup(
      {String email, String password, String number, String name}) async {
    try {
      UserCredential uc = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);

      Map<String, String> user = {
        'name': name,
        'number': '+91 ' + number,
        'email': email,
      };
      UID = uc.user.uid;
      DatabaseReference _ref =
          FirebaseDatabase.instance.reference().child('users').child(UID);
      await _ref.set(user);
      return "Account Created Successfully";
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }

  static Future<DataSnapshot> getData() {
    DatabaseReference _ref =
        FirebaseDatabase.instance.reference().child('users').child(UID);
    return _ref.child(UID).once();
  }
}
