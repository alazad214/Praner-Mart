import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../settings/change password/pass_change_screen.dart';
import '../../settings/settings/settings_screen.dart';
import 'custom_listtile.dart';

class SettingSection extends StatelessWidget {
  const SettingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              offset: Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            CustomListtile(
              title: 'Change Password',
              leading: Iconsax.edit,
              ontap: () => Get.to(() => PassChangeScreen()),
            ),
            Divider(height: 1, color: Colors.grey[300]),
            CustomListtile(
              title: 'Settings',
              leading: Iconsax.setting,
              ontap: () => Get.to(() => SettingsScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
