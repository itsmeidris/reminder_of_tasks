import 'package:flutter/material.dart';
import 'package:notification_app/config/app_colors.dart';

class HabitfyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HabitfyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.myWhite,
      centerTitle: true,
      title: Text(
        'H A B I T F Y',
        style: TextStyle(color: AppColors.myBlack),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65);
}
