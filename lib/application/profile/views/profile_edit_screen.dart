import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/business%20logic/controllers/profile_controller.dart';

import '../../../utils/colors.dart';
import '../../../widgets/app_button.dart';

class ProfileEditScreen extends StatelessWidget {
  final userProfile;
  ProfileEditScreen({Key? key, this.userProfile}) : super(key: key);

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _addressController = TextEditingController();

  final controller=Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: AppColor.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _phoneController,
              decoration: InputDecoration(
                labelText: 'Phone',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 20),
            TextField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            AppButton(
              text: 'Update Profile',
              onTap: () async {
                try {
                  await controller.updateUserProfile(
                    _nameController.text,
                    _phoneController.text,
                    _addressController.text,
                  );
                  Get.snackbar('Success', 'Profile updated successfully');
                } catch (e) {
                  Get.snackbar('Error', 'Failed to update profile');
                  print(e);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
