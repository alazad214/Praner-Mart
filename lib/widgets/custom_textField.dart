import 'package:flutter/material.dart';

class CustomformField extends StatelessWidget {
  const CustomformField(
      {super.key,
      this.hinttext,
      this.prefixicon,
      this.validation,
      this.obscuretext,
      this.onchanged,
      this.inputType});

  final hinttext;
  final IconData? prefixicon;
  final validation;
  final obscuretext;
  final onchanged;
  final inputType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onchanged,
      validator: validation,
      textInputAction: TextInputAction.next,
      obscureText: obscuretext ?? false,
      keyboardType: inputType,
      decoration: InputDecoration(
        hintText: hinttext,
        prefixIcon: Icon(prefixicon),
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
      ),
    );
  }
}
