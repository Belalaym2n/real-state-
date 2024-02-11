import 'package:firebase_auth/firebase_auth.dart';

class OperationForUser {
  static createUserWithEmailAndPassword(String emailAddress, String password,
      Function onSuccess, Function onError) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      if (credential.user?.uid != null) {
        credential.user?.sendEmailVerification();
        onSuccess();
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      onError(e.toString());
      print(e);
    }
  }

  static signInWithEmailAndPassword(String emailAddress, String password,
      Function onSuccess, Function onError) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      if (credential.user?.uid != null) {
        if (credential.user!.emailVerified) {
          onSuccess();
        } else {
          onError("please verify your mail");
        }
      }
    } on FirebaseAuthException catch (e) {
      onError(e.message);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
