import 'dart:async';
import 'package:easybuy/widgets/custom_snack.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
late String verificationID;

Future signUpWithEmail(String email, String password) async {
  try {
    final userCredential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    Get.showSnackbar(customSnack(
        'Successfully Registered', userCredential.user!.email.toString()));
  } on FirebaseAuthException catch (e) {
    if (e.code == 'weak-password') {
      Get.showSnackbar(customSnack(
          'Error Creating Account', 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      Get.showSnackbar(customSnack('Error Creating Account',
          'The account already exists for that email.'));
    } else {
      Get.showSnackbar(customSnack('Error', 'Something went wrong'));
    }
  }
}

Future signInWithEmail(String email, String password) async {
  try {
    final UserCredential userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    Get.showSnackbar(customSnack(
        'Successfully Signed In', userCredential.user!.email.toString()));
    Get.offAllNamed('/account', arguments: email);
  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      Get.showSnackbar(customSnack(null, 'No user found for that email.'));
    } else if (e.code == 'wrong-password') {
      Get.showSnackbar(customSnack(null, 'Wrong password entered.'));
    } else {
      Get.showSnackbar(customSnack('Error', 'Something went wrong'));
    }
  }
}

Future signOut() async {
  await _auth.signOut();
}
