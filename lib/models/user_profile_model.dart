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
        name: data["name"] ?? "Unknown",
        email: data["email"] ?? "No Email",
        uid: data["uid"] ?? "No UID",
        phone: data["phone"] ?? "No Phone",
        address: data["address"] ?? "No Address");
  }

  toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'addrss': address,
      'uid': uid
    };
  }
}
