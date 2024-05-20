import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pranermart/auth/profile_setup.dart';

class AuthController extends GetxController {
  RxString email = RxString("");
  RxString password = RxString("");
  RxString confirmpassword = RxString("");

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
          Get.offAll(ProfileSetUP());
        }
      });
    } on FirebaseAuthException catch (error) {
      Get.snackbar("Error", error.message ?? "Something Wrong");
    }
  }

}
