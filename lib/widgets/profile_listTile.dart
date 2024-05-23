import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileListtile extends StatelessWidget {
  const ProfileListtile({
    Key? key,
    this.title,
    this.subtitle,
    this.icon,
    this.arrowicon,
    this.ontap,
  }) : super(key: key);

  final String? title;
  final String? subtitle;
  final IconData? icon;
  final IconData? arrowicon;
  final VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.blue.withOpacity(0.1),
            border: Border.all(color: Colors.white38),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(child: Icon(icon ?? Icons.add)),
              Text(
                title ?? "",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              SizedBox(),
              SizedBox(),
              SizedBox(),
              Icon(
                arrowicon,
                color: Colors.green,
              )
            ],
          )),
    );
  }
}
