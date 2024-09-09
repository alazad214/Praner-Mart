import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import 'package:pranermart/app/nav%20screen/navigation_screen.dart';

import '../views/logIn_screen.dart';
import '../views/profile_setup.dart';

class AuthController extends GetxController {
  RxString email = RxString("");
  RxString password = RxString("");
  RxString confirmpassword = RxString("");
  var isObscure = true.obs;

  void toggleObscureText() {
    isObscure.value = !isObscure.value;
  }

  final auth = FirebaseAuth.instance;
  final users = FirebaseAuth.instance.currentUser;

  Register() async {
    if (password.value != confirmpassword.value) {
      Get.snackbar("Invalid password", "Password doesn't matched");
      return;
    }

    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          Get.offAll(ProfileSetup());
        }
      });
    } on FirebaseAuthException catch (error) {
      Get.snackbar("Error", error.message ?? "Something Wrong");
    }
  }

  LogIn() async {
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          Get.offAll(NavigationScreen());
          Get.snackbar("Seccess", "Login Successfully");
        }
      });
    } on FirebaseAuthException catch (error) {
      Get.snackbar("Error", error.message ?? "Something Wrong");
    }
  }

  Future signOut() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      await _auth.signOut().then((value) {
        Get.offAll(LogInScreen());
      });
    } on FirebaseAuthException catch (e) {
      Get.snackbar("Error", e.message ?? "something wrong");
    }
  }
}
