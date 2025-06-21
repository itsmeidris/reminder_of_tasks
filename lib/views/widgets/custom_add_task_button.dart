import 'package:flutter/material.dart';
import 'package:notification_app/utils/colors/app_colors.dart';
import 'package:notification_app/views/widgets/time_scheduler_dialog.dart';

class CustomAddTaskButton extends StatelessWidget {
  final VoidCallback onAddTaskTap;
  const CustomAddTaskButton({super.key, required this.onAddTaskTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onAddTaskTap,
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
            'SCHEDULE A HABIT',
            style: TextStyle(color: AppColors.myBlack),
          ),
          Icon(
            Icons.notification_add_outlined,
            size: 18,
            color: AppColors.myBlack,
            weight: 2,
          ),
        ],
      ),
    );
  }
}
