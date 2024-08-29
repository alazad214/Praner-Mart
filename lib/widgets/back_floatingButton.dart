
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../utils/colors.dart';

class BackFloatingbutton extends StatelessWidget {
  const BackFloatingbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.back();
      },
      child: Icon(
        Iconsax.back_square,
        color: Colors.white,
      ),
      backgroundColor: AppColor.berkeleyBlue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 10.0,
    );
  }
}
