import 'package:flutter/material.dart';
import 'package:notification_app/core/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.myBlack,
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: AppColors.myBlack2),
          child: Icon(
            Icons.arrow_back_ios_new_outlined,
            color: AppColors.myWhite,
            size: 15,
          ),
        ),
      ),
      title: Text(
        'N O T I F I C A T I O N S',
        style: TextStyle(color: AppColors.myWhite),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
