import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pranermart/utils/colors.dart';

class TextRichOne extends StatelessWidget {
  const TextRichOne(
      {super.key,
      this.text1,
      this.text2,
      this.textSize1,
      this.textSize2,
      this.ontap});
  final String? text1;
  final String? text2;
  final textSize1;
  final textSize2;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Text.rich(TextSpan(children: [
        TextSpan(
            text: text1,
            style: TextStyle(
                color: AppColor.white,
                fontSize: textSize1 ?? 24,
                fontWeight: FontWeight.w500)),
        TextSpan(
            text: text2,
            style: TextStyle(
                color: AppColor.black,
                fontSize: textSize2 ?? 24,
                fontWeight: FontWeight.w500)),
      ])),
    );
  }
}
