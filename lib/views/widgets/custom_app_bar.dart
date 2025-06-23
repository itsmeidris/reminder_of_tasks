import 'package:flutter/material.dart';
import 'package:notification_app/utils/colors/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.myWhite,
      centerTitle: true,
      title: Text(
        'JUST  HABIT  IT',
        style: TextStyle(color: AppColors.myBlack),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65);
}
