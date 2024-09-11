import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../../Application/nav screen/nav_screen.dart';
import '../../models/user_profile_model.dart';

class ProfileController extends GetxController {
  ///Variable and Instances
  RxString email = RxString("");
  RxString name = RxString("");
  RxString address = RxString("");
  RxString phone = RxString("");
  final RxBool isLoading = false.obs;
  final firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

  ///Set Profile Data in Firestore Database
  Profile() async {
    isLoading.value = true;
    await firestore.collection("Users").doc(email.value).set({
      "email": email.value,
      "name": name.value,
      "address": address.value,
      "phone": phone.value,
    });
    Get.offAll(() => NavScreen());
    isLoading.value = false;
  }

  /// Get Current User
  Future<UserProfile> getUser() async {
    if (user == null) {
      throw Exception('No user logged in');
    }
    final snapshot = await firestore
        .collection('Users')
        .where('email', isEqualTo: user!.email)
        .get();
    final userData = snapshot.docs.first;
    return UserProfile.fromSnapshot(userData);
  }

  /// Update Profile
  Future<void> updateUserProfile(
      String name, String phone, String address) async {
    if (user == null) {
      throw Exception('No user logged in');
    }
    await firestore.collection('Users').doc(user!.uid).update({
      'name': name,
      'phone': phone,
      'address': address,
    });
  }
}
