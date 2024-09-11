import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:pranermart/style/toast_style.dart';
import '../../views/auth/logIn_screen.dart';
import '../../views/auth/profile_setup.dart';
import '../../views/nav screen/nav_screen.dart';


class AuthController extends GetxController {
  ///VAriables...
  RxString email = RxString("");
  RxString password = RxString("");
  RxString confirmpassword = RxString("");
  var isObscure = true.obs;
  final RxBool isLoading = false.obs;

  ///Instance...
  final auth = FirebaseAuth.instance;
  final users = FirebaseAuth.instance.currentUser;

  ///Password Toggle Function...
  void toggleObscureText() {
    isObscure.value = !isObscure.value;
  }

  ///Firebase Register Funtionality...
  Register() async {
    isLoading.value = true;
    if (password.value != confirmpassword.value) {
      ErrorToast("Password doesn't matched");
      isLoading.value = false;
      return;
    }
    try {
      await auth
          .createUserWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          Get.offAll(ProfileSetup());
          SuccessToast('Successfully Register');
        }
      });
    } on FirebaseAuthException catch (error) {
      ErrorToast("Something Wrong");
    } finally {
      isLoading.value = false;
    }
  }

  ///Firebase Login Funtionality...
  LogIn() async {
    isLoading.value = true;
    try {
      await auth
          .signInWithEmailAndPassword(
              email: email.value, password: password.value)
          .then((value) {
        if (value.user != null) {
          Get.offAll(NavScreen());
          SuccessToast('Successfully Login');
        }
      });
    } on FirebaseAuthException catch (error) {
      ErrorToast("Something Wrong");
    } finally {
      isLoading.value = false;
    }
  }

  ///Firebase SignOut Funtionality...
  signOut() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      isLoading.value = true;
      await _auth.signOut().then((value) {
        Get.offAll(LogInScreen());
        SuccessToast('Successfully Logout');
        isLoading.value = false;
      });
    } on FirebaseAuthException catch (e) {
      ErrorToast("Something Wrong");
      print(e);
    }
  }

  ///Firebase ForgetPass Functionality...
  forgetPassword() async {
    try {
      isLoading.value = true;
      await auth.sendPasswordResetEmail(email: email.value);
      isLoading.value = false;
    } on FirebaseAuthException catch (e) {
      ErrorToast('Something Wrong');
    }
  }
}
