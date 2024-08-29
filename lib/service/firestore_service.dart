import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';


import '../model/user_profile_model.dart';

class FireStoreService extends GetxController {

  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!.email;

  Future<UserProfile> getuserProfile() async {
    final snapshot = await firestore
        .collection("Users")
        .where("email", isEqualTo: user)
        .get();
    final UserData =
        snapshot.docs.map((e) => UserProfile.fromSnapshot(e)).single;
    return UserData;
  }
}
