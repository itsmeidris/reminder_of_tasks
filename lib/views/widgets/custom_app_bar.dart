import 'package:flutter/material.dart';
import 'package:notification_app/utils/colors/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String text;
  const CustomAppBar({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.myWhite,
      centerTitle: true,
      title: Text(
        text,
        style: TextStyle(color: AppColors.myBlack),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65);
}
