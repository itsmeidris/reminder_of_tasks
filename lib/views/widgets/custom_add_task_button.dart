import 'package:flutter/material.dart';
import 'package:notification_app/core/app_colors.dart';
import 'package:notification_app/views/widgets/task_informations_dialog.dart';

class CustomAddTaskButton extends StatelessWidget {
  final VoidCallback onAddTaskTap;
  const CustomAddTaskButton({super.key, required this.onAddTaskTap});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onAddTaskTap,
      onLongPress: () {
        TaskInformationsDialog.addTaskModalBottomSheet(context);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.myGreen,
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0),
      ),
      child: Icon(
        Icons.notification_add_outlined,
        size: 30,
        color: AppColors.myBlack,
        weight: 2,
      ),
    );
  }
}
