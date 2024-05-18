import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pranermart/auth/login.dart';
import 'package:pranermart/widgets/custom_button.dart';
import 'package:pranermart/widgets/custom_textField.dart';
import 'package:pranermart/widgets/text_rich_two.dart';

class Ragistation extends StatelessWidget {
  const Ragistation({super.key});

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
                          "রেজিস্টার করুন",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 30),
                        const Column(
                          children: [
                            CustomformField(
                              prefixicon: Icons.email,
                              hinttext: "ইমেইল",
                            ),
                            SizedBox(height: 10),
                            CustomformField(
                              prefixicon: Icons.remove_red_eye_sharp,
                              hinttext: "পাসওয়ার্ড",
                              obscuretext: true,
                            ),
                            SizedBox(height: 10),
                            CustomformField(
                              prefixicon: Icons.remove_red_eye_sharp,
                              hinttext: "আবার পাসওয়ার্ড",
                              obscuretext: true,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        const CustomButton(
                          text: "রেজিস্টার",
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.offAll(() => const LogIn());
                              },
                              child: const Text.rich(TextSpan(children: [
                                TextSpan(
                                    text: "ইতিমধ্যে কোনো অ্যাকাউন্ট আছে? ",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 13,
                                    )),
                                TextSpan(
                                    text: "লগইন",
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
