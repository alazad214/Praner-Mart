import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../model/user_profile_model.dart';

class FirestoreService extends GetxController {
  final firestore = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser;

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
