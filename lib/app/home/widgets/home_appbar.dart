import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import '../../../utils/app_config.dart';
import '../../../utils/colors.dart';

class HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppbar({super.key, this.onPressed});
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColor.berkeleyBlue,
      toolbarHeight: 65.0,
      titleSpacing: 0,
      title: Text(
        AppConfig.appName,
        style: TextStyle(color: AppColor.white),
      ),
      leading: IconButton(
          icon: Icon(
            Icons.sort,
            color: Colors.white,
            size: 32.0,
          ),
          onPressed: onPressed),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
