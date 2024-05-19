import 'package:flutter/material.dart';


class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Center(
                  child: Container(
            decoration:
                const BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
            child: Image.asset("assets/image/logo.png"),
            clipBehavior: Clip.antiAlias,
          ))),
          const SizedBox(height: 10),
          customListtile(
            Icons.home,
            "H O M E",
            () {
              Navigator.pop(context);
            },
          ),
          customListtile(Icons.settings, "S E T T I N G S", () {}),
          customListtile(Icons.logout, "L O G  O U T", () {}),
        ],
      ),
    );
  }
}

Widget customListtile(icon, text, ontap) {
  return InkWell(
    onTap: ontap,
    child: ListTile(
      leading: IconButton(
          onPressed: () {},
          icon: Icon(
            icon,
            color: Colors.blueGrey,
          )),
      title: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w500),
      ),
    ),
  );
}
