import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pranermart/auth/registation.dart';
import 'package:pranermart/controllers/auth_controller.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_textField.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  final controller = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "লগইন করুন",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        Column(
                          children: [
                            CustomformField(
                              prefixicon: Icons.email,
                              hinttext: "ইমেইল",
                              onchanged: (value) {
                                controller.email.value = value;
                              },
                            ),
                            SizedBox(height: 10),
                            CustomformField(
                              prefixicon: Icons.remove_red_eye_sharp,
                              hinttext: "পাসওয়ার্ড",
                              obscuretext: true,
                              onchanged: (value) {
                                controller.password.value = value;
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        CustomButton(
                          text: "লগইন",
                          ontap: () {
                            controller.LogIn();
                          },
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.offAll(() => Ragistation());
                              },
                              child: const Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "নতুন অ্যাকাউন্ট তৈরি করুন? ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    )),
                                TextSpan(
                                    text: "রেজিস্টার",
                                    style: TextStyle(
                                      color: Colors.blueAccent,
                                      fontSize: 14,
                                    )),
                              ])),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
