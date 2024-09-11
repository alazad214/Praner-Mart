import 'package:flutter/material.dart';
import 'package:pranermart/utils/colors.dart';

class CustomListtile extends StatelessWidget {
  const CustomListtile({super.key, this.title, this.leading, this.ontap});
  final title;
  final leading;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leading ?? Icons.notifications),
      title: Text(title ?? ""),
      trailing: Icon(Icons.arrow_forward_ios, color: AppColor.primary),
      onTap: ontap,
    );
  }
}
