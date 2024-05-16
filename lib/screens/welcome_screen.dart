import 'package:flutter/material.dart';

import '../widgets/welcome_screen_container.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: PageView(
        scrollDirection: Axis.horizontal,
        children: const [
          WelcomeContainer(
            image: "assets/animations/ecommerce.json",
            subtitle:
                "প্রানেরমার্ট অ্যাপে প্রথম অর্ডারে পাচ্ছেন সম্পুর্ণ ডেলিভারি চার্জ ফ্রি। আপনার কোনো পণ্য সর্বোচ্চ ৫ দিন আর সর্বনিম্ন ১ দিনের মধ্যে ডেলিভারি করে থাকে। আমাদের অ্রাপে",
            dotcolor1: Colors.blueAccent,
          ),
          WelcomeContainer(
            image: "assets/animations/ecommerce2.json",
            subtitle:
                "প্রানেরমার্ট অ্যাপে প্রথম অর্ডারে পাচ্ছেন সম্পুর্ণ ডেলিভারি চার্জ ফ্রি। আপনার কোনো পণ্য সর্বোচ্চ ৫ দিন আর সর্বনিম্ন ১ দিনের মধ্যে ডেলিভারি করে থাকে। আমাদের অ্রাপে",
            dotcolor2: Colors.blueAccent,
          ),
          WelcomeContainer(
            image: "assets/animations/ecommerce2.json",
            subtitle:
                "প্রানেরমার্ট অ্যাপে প্রথম অর্ডারে পাচ্ছেন সম্পুর্ণ ডেলিভারি চার্জ ফ্রি। আপনার কোনো পণ্য সর্বোচ্চ ৫ দিন আর সর্বনিম্ন ১ দিনের মধ্যে ডেলিভারি করে থাকে। আমাদের অ্রাপে",
            dotcolor3: Colors.blueAccent,
          ),
        ],
      )),
    );
  }
}
