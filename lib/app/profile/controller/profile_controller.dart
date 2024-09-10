import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../nav screen/navigation_screen.dart';

class ProfileController extends GetxController {
  RxString email = RxString("");
  RxString name = RxString("");
  RxString address = RxString("");
  RxString phone = RxString("");
  final RxBool isLoading = false.obs;
  final firestore = FirebaseFirestore.instance;

  Profile() async {
    isLoading.value = true;

    await firestore.collection("Users").doc(email.value).set({
      "email": email.value,
      "full_name": name.value,
      "address": address.value,
      "phone_Number": phone.value,
    });
    Get.offAll(() => NavigationScreen());
    isLoading.value = false;
  }
}
