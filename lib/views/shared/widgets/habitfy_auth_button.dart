import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notification_app/config/app_colors.dart';

class HabitfyAuthButton extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;
  const HabitfyAuthButton(
      {super.key, required this.icon, required this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
            elevation: 2,
            backgroundColor: AppColors.myWhite,
            padding: const EdgeInsets.all(16),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 8,
          children: [
            SvgPicture.asset(
              'assets/$icon.svg',
              width: 25,
              height: 25,
              fit: BoxFit.scaleDown,
            ),
            Text(
              text,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: AppColors.myBlack),
            ),
          ],
        ));
  }
}
