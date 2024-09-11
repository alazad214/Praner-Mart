import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  const SmallButton(
      {super.key,
      this.text,
      this.bgcolor,
      this.color,
      this.fontWeight,
      this.ontap});
  final text;
  final bgcolor;
  final color;
  final fontWeight;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          height: 40,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
              color: bgcolor ?? Colors.white54,
              borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            text ?? ' ',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w500),
          )),
    );
  }
}
