import 'package:cloud_firestore/cloud_firestore.dart';

class UserProfile {
  final String name;
  final String email;
  final String uid;
  final String phone;
  final String address;
  const UserProfile({
    required this.name,
    required this.email,
    required this.uid,
    required this.phone,
    required this.address,
  });

  factory UserProfile.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    final data = snapshot.data()!;
    return UserProfile(
        name: data["name"],
        email: data["email"],
        uid: data["uid"],
        phone: data["phone"],
        address: data["address"]);
  }
}
