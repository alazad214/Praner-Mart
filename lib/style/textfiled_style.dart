import 'package:flutter/material.dart';

InputDecoration appInputDecoretion(hinttext, prefixIcon) {
  return InputDecoration(
    hintText: hinttext ?? " ",
    prefixIcon: Icon(prefixIcon ?? Icons.email_outlined),
    filled: true,
    fillColor: Colors.white,

    //enable-->
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(14.0),
      borderSide: const BorderSide(color: Colors.blue, width: 1),
    ),
    //focus-->
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(14.0),
    ),
    //focus-->
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.red,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(14.0),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(
        color: Colors.blue,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(14.0),
    ),
  );
}
