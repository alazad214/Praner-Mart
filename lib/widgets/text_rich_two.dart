import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextRichTwo extends StatelessWidget {
  const TextRichTwo({super.key, this.ontap});
  final ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
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
    );
  }
}
