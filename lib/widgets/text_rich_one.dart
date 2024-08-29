import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pranermart/utils/colors.dart';

class TextRichOne extends StatelessWidget {
  const TextRichOne({super.key, this.text1, this.text2});
  final String? text1;
  final String? text2;

  @override
  Widget build(BuildContext context) {
    return Text.rich(TextSpan(children: [
      TextSpan(
          text: text1,
          style: TextStyle(
              color: AppColor.white,
              fontSize: 24,
              fontWeight: FontWeight.w500)),
      TextSpan(
          text: text2,
          style: TextStyle(
              color: AppColor.black,
              fontSize: 24,
              fontWeight: FontWeight.w500)),
    ]));
  }
}
