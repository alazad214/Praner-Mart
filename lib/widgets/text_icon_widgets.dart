import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pranermart/utils/colors.dart';

class CustomTextIcon extends StatelessWidget {
  const CustomTextIcon({super.key, this.text, this.ontap, this.text2});
  final String? text;
  final String? text2;

  final ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text ?? "",
            style: TextStyle(
                color: AppColor.yaleBlue,
                fontSize: 16.0,
                fontWeight: FontWeight.bold),
          ),
          InkWell(
            onTap: ontap,
            child: Text(
              text2 ?? "",
              style: TextStyle(
                  color: AppColor.yaleBlue,
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
