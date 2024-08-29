import 'package:flutter/material.dart';

import '../utils/colors.dart';

class Button1 extends StatelessWidget {
  final text;
  final textColor;
  final bgColor;
  final fontSize;
  final borderRadius;
  final ontap;

  const Button1(
      {super.key,
      this.text,
      this.textColor,
      this.bgColor,
      this.fontSize,
      this.borderRadius,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: bgColor ?? AppColor.yaleBlue,
            borderRadius: borderRadius ?? BorderRadius.circular(20.0)),
        height: 60,
        alignment: Alignment.center,
        child: Text(
          text ?? '',
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: fontSize ?? 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    ));
  }
}
