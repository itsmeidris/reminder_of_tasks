import 'package:flutter/material.dart';
import 'package:notification_app/config/app_colors.dart';

class CustomAddTaskButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final String text;
  const CustomAddTaskButton(
      {super.key, required this.onTap, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      onLongPress: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.myYellow,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 5,
        children: [
          Text(
            text,
            style: TextStyle(color: AppColors.myBlack),
          ),
          Icon(
            icon,
            size: 18,
            color: AppColors.myBlack,
            weight: 2,
          ),
        ],
      ),
    );
  }
}
