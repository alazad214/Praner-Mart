import 'package:flutter/material.dart';
import 'package:pranermart/utils/colors.dart';
import 'package:pranermart/widgets/small_button.dart';

class BottonSheet extends StatelessWidget {
  const BottonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(top: 10, left: 20.0, right: 20.0),
      decoration: BoxDecoration(
          color: AppColor.primary,
          border: Border(top: BorderSide(width: 0.1)),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmallButton(
                text: 'Add To Cart',
                bgcolor: AppColor.red,
              ),
              SmallButton(
                text: 'Add To Cart',
                bgcolor: AppColor.red,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
