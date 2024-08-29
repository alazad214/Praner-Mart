import 'package:flutter/material.dart';

import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  final text;
  final textColor;
  final bgColor;
  final fontSize;
  final borderRadius;
  final ontap;

  const CustomButton(
      {super.key,
      this.text,
      this.textColor,
      this.bgColor,
      this.fontSize,
      this.borderRadius,
      this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
            color: bgColor ?? AppColor.yaleBlue,
            borderRadius: borderRadius ?? BorderRadius.circular(40.0)),
        height: 50,
        alignment: Alignment.center,
        child: Text(
          text ?? '',
          style: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: fontSize ?? 16,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
