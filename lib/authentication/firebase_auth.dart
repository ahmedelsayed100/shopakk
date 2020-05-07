import 'package:firebase_auth/firebase_auth.dart';

class FireBaseAuthentication {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<FirebaseUser> getCurrentUser() async {
    FirebaseUser user = await firebaseAuth.currentUser();
    print(user);
    return user;
  }

  userSignOut() async {
    await firebaseAuth.signOut();
  }

  Future<FirebaseUser> singIn(String email, String password) async {
    AuthResult authResult = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return authResult.user;
  }

  Future<FirebaseUser> register(String email, String password) async {
    AuthResult authResult = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authResult.user;
  }
}
