import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pranermart/utils/app_config.dart';
import 'package:pranermart/utils/app_string.dart';
import 'package:pranermart/utils/colors.dart';
import 'package:pranermart/widgets/custom_button.dart';
import '../../widgets/text_rich_one.dart';
import '../auth/logIn_screen.dart';
import '../auth/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ///Lottie Animation...
                Lottie.asset(
                  "assets/animations/ecommerce.json",
                  width: w / 1,
                ),

                ///Welcome Title...
                const TextRichOne(
                  text1: "Welcome",
                  text2: " PranerMart",
                ),

                ///Welcome Description...
                Text(AppString.welcomeDescription,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.5),
                      fontSize: 14,
                    )),
                SizedBox(height: 30),

                ///Authentication Button...
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'LOG IN',
                          borderRadius: BorderRadius.circular(0),
                          ontap: () => Get.to(() => LogInScreen()),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomButton(
                          text: 'SIGN UP',
                          borderRadius: BorderRadius.circular(0),
                          bgColor: AppColor.moonstone,
                          ontap: () => Get.to(() => SignUpScreen()),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),

                ///App Version...
                Text('v 3.25.2', style: TextStyle(color: AppColor.mintCream))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
