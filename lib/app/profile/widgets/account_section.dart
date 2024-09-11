import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:pranermart/app/settings/notification/notifications_screen.dart';
import 'package:pranermart/app/profile/views/payment_screen.dart';
import 'package:pranermart/app/profile/widgets/custom_listtile.dart';

class AccountSection extends StatelessWidget {
  const AccountSection({super.key});

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
              title: 'Notifications',
              leading: Iconsax.notification,
              ontap: () => Get.to(() => NotificationsScreen()),
            ),
            Divider(height: 1, color: Colors.grey[300]),
            CustomListtile(
              title: 'Payment Methods',
              leading: Iconsax.dollar_circle,
              ontap: () => Get.to(() => PaymentMethodScreen()),
            ),
          ],
        ),
      ),
    );
  }
}
