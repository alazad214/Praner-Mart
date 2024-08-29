import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pranermart/auth/login.dart';
import 'package:pranermart/auth/registation.dart';
import 'package:pranermart/utils/colors.dart';
import 'package:pranermart/widgets/button1.dart';
import '../../widgets/text_rich_one.dart';

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
                Text(
                    "First order on Pranermart app will get complete delivery charge free. Any of your products will be delivered within a maximum of 5 days and a minimum of 1 day. in our",
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
                      Button1(
                        text: 'LOG IN',
                        borderRadius: BorderRadius.circular(0),
                        ontap: () => Get.to(() => LogInScreen()),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Button1(
                        text: 'SIGN UP',
                        borderRadius: BorderRadius.circular(0),
                        bgColor: AppColor.moonstone,
                        ontap: () => Get.to(() => Ragistation()),
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
