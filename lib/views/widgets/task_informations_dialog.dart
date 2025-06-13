import 'package:flutter/material.dart';
import 'package:notification_app/core/app_colors.dart';

class TaskInformationsDialog {
  static void addTaskModalBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Add a New Task',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.myBlack,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Task Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: AppColors.myBlack2,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  // Handle task addition here
                  Navigator.pop(context); // Close the modal
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.myGreen,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                ),
                child: Text(
                  'Add Task',
                  style: TextStyle(color: AppColors.myWhite),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
