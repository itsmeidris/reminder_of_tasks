import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:notification_app/core/app_colors.dart';

class TaskInformationsDialog {
  static void addTaskModalBottomSheet(BuildContext context) {
    final TextEditingController taskController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    TimeOfDay? selectedTime;

    showModalBottomSheet(
      context: context,
      isScrollControlled:
          true, // Allows the modal to expand when keyboard appears
      backgroundColor: AppColors.myBlack2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            top: 16.0,
            bottom:
                MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
          ),
          child: SingleChildScrollView(
            child: Column(
              spacing: 8,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.close,
                      color: AppColors.myWhite,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8,
                  children: [
                    SvgPicture.asset(
                      'assets/task2.svg',
                      fit: BoxFit.scaleDown,
                      width: 30,
                      height: 30,
                      colorFilter:
                          ColorFilter.mode(AppColors.myWhite, BlendMode.srcIn),
                    ),
                    Text(
                      'Add a New Task',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.myWhite,
                      ),
                    ),
                  ],
                ),
                AnimatedLabelTextField(
                  label: 'Task Title',
                  hintText: 'Enter the task title',
                  controller: taskController,
                ),
                AnimatedLabelTextField(
                  label: 'Task Description',
                  hintText: 'Enter the task description',
                  controller: descriptionController,
                ),
                ElevatedButton(
                  onPressed: () async {
                    selectedTime = await showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.now(),
                    );
                    if (selectedTime != null) {
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
          ),
        );
      },
    );
  }
}

class AnimatedLabelTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String label;

  const AnimatedLabelTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.label,
  });

  @override
  _AnimatedLabelTextFieldState createState() => _AnimatedLabelTextFieldState();
}

class _AnimatedLabelTextFieldState extends State<AnimatedLabelTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isFocusedOrFilled = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        _isFocusedOrFilled =
            _focusNode.hasFocus || widget.controller.text.isNotEmpty;
      });
    });

    widget.controller.addListener(() {
      setState(() {
        _isFocusedOrFilled =
            _focusNode.hasFocus || widget.controller.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          top: _isFocusedOrFilled ? 0 : 14,
          left: 10,
          child: AnimatedOpacity(
            duration: Duration(milliseconds: 300),
            opacity: _isFocusedOrFilled ? 1.0 : 0.0,
            child: Text(
              widget.label,
              style: TextStyle(
                fontSize: 12,
                color: AppColors.myWhite.withOpacity(0.7),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        TextFormField(
          controller: widget.controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            labelText: widget.label,
            hintText: widget.hintText,
            hintStyle: TextStyle(color: AppColors.myWhite.withOpacity(0.7)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            filled: true,
            fillColor: AppColors.myBlack,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
          ),
          style: TextStyle(color: AppColors.myWhite),
        ),
      ],
    );
  }
}
