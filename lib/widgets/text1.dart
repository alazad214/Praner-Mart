import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Text1 extends StatelessWidget {
  const Text1({super.key, this.color});
  final color;
  @override
  Widget build(BuildContext context) {
    return Text(".",
        style: TextStyle(
            color: color ?? Colors.grey,
            fontSize: 70,
            fontWeight: FontWeight.bold));
  }
}
