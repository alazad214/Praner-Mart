import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/app/profile/views/order_history_screen.dart';
import 'custom_listtile.dart';

class OderHistory extends StatelessWidget {
  const OderHistory({super.key});

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
        child: CustomListtile(
          title: 'Order History',
          leading: Icons.payment,
          ontap: ()=>Get.to(()=>OrderHistoryScreen()),
        ),
      ),
    );
  }
}
