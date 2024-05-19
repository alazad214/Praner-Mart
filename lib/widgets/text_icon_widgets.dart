import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextIcon extends StatelessWidget {
  const CustomTextIcon({super.key, this.text, this.icon});
  final String? text;
  final icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text ?? "",
          style: TextStyle(
            color: Colors.blueAccent,
          ),
        ),
        IconButton(onPressed: () {}, icon: Icon(icon))
      ],
    );
  }
}
