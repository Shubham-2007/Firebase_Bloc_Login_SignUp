import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  FirebaseAuth firebaseAuth;

  UserRepository() {
    this.firebaseAuth = FirebaseAuth.instance;
  }

  Future<FirebaseUser> createuser(String email, String password) async {
    try {
      var result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("----------------");
      print(result.user);
      return result.user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<FirebaseUser> signInUsser(String email, String password) async {
    var result = await firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return result.user;
  }

  Future<void> signOut() async {
    await firebaseAuth.signOut();
  }

  Future<bool> isSignedIn() async {
    var currentuser = await firebaseAuth.currentUser();
    return currentuser != null;
  }

  Future<FirebaseUser> getCurrentUser() async {
    return await firebaseAuth.currentUser();
  }
}
