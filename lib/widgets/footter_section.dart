import 'package:flutter/material.dart';
import 'package:pranermart/utils/images.dart';
import 'package:pranermart/widgets/contact_ui.dart';

class FootterSection extends StatelessWidget {
  const FootterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return   Container(
      decoration: BoxDecoration(color: Colors.blueAccent),
      child: Wrap(
        children: [
          Container(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/applogo.png",
                        height: h / 7,
                      ),
                      Expanded(
                        child: Text(
                          "Welcome to PranerMart - Your Ultimate Shopping Destination in Bangladesh!",
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  "Payment Method",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 15),
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    for (int i = 0; i < AppImagas.length; i++)
                      Image.asset(
                        AppImagas[i],
                        height: 60,
                      )
                  ],
                ),
                Text(
                  "Follow Us",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Contact_mobile()
              ],
            ),
          )
        ],
      ),
    );
  }
}
