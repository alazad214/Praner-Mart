import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/style/text_style.dart';
import '../../../widgets/app_button.dart';
import '../../nav screen/nav_screen.dart';

class PassChangeScreen2 extends StatelessWidget {
  PassChangeScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(20),
                  child: Icon(
                    Icons.email_outlined,
                    size: 100,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  'Password Reset Link Sent!',
                  textAlign: TextAlign.center,
                  style: head2TextStyle(),
                ),
                SizedBox(height: 10),
                Text(
                  'Please check your email for instructions to reset your password.',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 40),
                AppButton(
                  text: 'Back to Home',
                  onTap: () {
                    Get.offAll(() => NavScreen());
                  },
                ),
                SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Go Back',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
