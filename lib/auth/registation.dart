import 'package:flutter/material.dart';
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
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "রেজিস্টার করুন",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 30),
                        Column(
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
                          ],
                        ),
                        SizedBox(height: 20),
                        CustomButton(),
                        SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [TextRichTwo()],
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
