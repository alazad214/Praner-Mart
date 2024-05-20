import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:pranermart/auth/login.dart';
import 'package:pranermart/auth/registation.dart';

import '../widgets/text_rich_one.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(color: Colors.white),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Lottie.asset(
                      "assets/animations/ecommerce.json",
                      width: w / 1,
                      height: h / 2,
                    ),
                    const TextRichOne(
                      text1: "স্বাগতম ",
                      text2: "প্রানেরমার্টে",
                    ),
                    const Text(
                        "প্রানেরমার্ট অ্যাপে প্রথম অর্ডারে পাচ্ছেন সম্পুর্ণ ডেলিভারি চার্জ ফ্রি। আপনার কোনো পণ্য সর্বোচ্চ ৫ দিন আর সর্বনিম্ন ১ দিনের মধ্যে ডেলিভারি করে থাকে। আমাদের অ্রাপে",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 14,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              Get.to(() => const LogIn());
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.teal,
                              ),
                              height: 60,
                              alignment: Alignment.center,
                              child: const Text(
                                "লগইন",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                              child: InkWell(
                            onTap: () {
                              Get.to(() =>  Ragistation());
                            },
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.blue,
                              ),
                              height: 60,
                              alignment: Alignment.center,
                              child: const Text(
                                "রেজিস্টার",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          )),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
