import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pranermart/widgets/text1.dart';
import 'package:pranermart/widgets/text_rich_one.dart';

class WelcomeContainer extends StatelessWidget {
  const WelcomeContainer(
      {super.key,
      required this.subtitle,
      this.image,
      this.dotcolor1,
      this.dotcolor2,
      this.dotcolor3});
  final String subtitle;
  final image;
  final dotcolor1;
  final dotcolor2;
  final dotcolor3;

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () {}, child: const Text("Skip")),
                ],
              ),
              Lottie.asset(
                image,
                width: w / 1,
                height: h / 2,
              ),
              const TextRichOne(
                text1: "স্বাগতম ",
                text2: "প্রানেরমার্টে..",
              ),
              const SizedBox(
                height: 15,
              ),
              Text(subtitle,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 14,
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text1(
                    color: dotcolor1,
                  ),
                  Text1(
                    color: dotcolor2,
                  ),
                  Text1(
                    color: dotcolor3,
                  ),
                ],
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blueAccent.withOpacity(0.7),
                  onPrimary: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 3,
                  shadowColor: Colors.grey,
                ),
                onPressed: () {},
                child: const Text('পরবর্তী'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
