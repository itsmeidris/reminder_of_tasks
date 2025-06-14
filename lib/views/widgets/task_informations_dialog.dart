import 'package:flutter/material.dart';
import 'package:notification_app/core/app_colors.dart';

class TaskInformationsDialog {
  static void addTaskModalBottomSheet(BuildContext context) {
    final TextEditingController taskController = TextEditingController();
    TimeOfDay? selectedTime;

    showModalBottomSheet(
      context: context,
      backgroundColor: AppColors.myBlack2,
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
                  color: AppColors.myWhite,
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: taskController,
                decoration: InputDecoration(
                  hintText: 'Task Name',
                  hintStyle:
                      TextStyle(color: AppColors.myWhite.withOpacity(0.7)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  filled: true,
                  fillColor: AppColors.myBlack,
                ),
                style: TextStyle(color: AppColors.myWhite),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () async {
                  selectedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (selectedTime != null) {
                    // Update UI or handle selected time
                    Future.delayed(Duration(seconds: 1), () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Selected Time: ${selectedTime!.format(context)}',
                          ),
                          duration: Duration(seconds: 5),
                        ),
                      );
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.myBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  'Pick Time',
                  style: TextStyle(color: AppColors.myWhite),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  if (taskController.text.isEmpty || selectedTime == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content:
                            Text('Please enter a task name and pick a time'),
                      ),
                    );
                  } else {
                    // Handle task addition here
                    String taskName = taskController.text;
                    String taskTime = selectedTime!.format(context);

                    debugPrint('Task Added: $taskName at $taskTime');
                    Navigator.pop(context); // Close the modal
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.myGreen,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
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
