import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notification_app/utils/colors/app_colors.dart';
import 'package:notification_app/utils/validators/time_formatter.dart';

class TimeSchedulerDialog {
  static Widget buildSchedulerDialog(BuildContext context) {
    return _TimeScheduler();
  }
}

class _TimeScheduler extends StatefulWidget {
  @override
  State<_TimeScheduler> createState() => _TimeSchedulerState();
}

class _TimeSchedulerState extends State<_TimeScheduler> {
  final TextEditingController hourController = TextEditingController();
  final TextEditingController minuteController = TextEditingController();

  @override
  void dispose() {
    // Dispose of controllers to release resources
    hourController.dispose();
    minuteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        color: AppColors.myBlack2,
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(
                    Icons.cancel,
                    color: AppColors.myWhite,
                  ),
                )
              ],
            ),
            Text(
              'SCHEDULE A ROUTINE',
              style: TextStyle(
                color: AppColors.myWhite,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 16),
            _buildTimeFields(),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                final hour = hourController.text;
                final minute = minuteController.text;
                print('Selected Time: $hour:$minute');
                // Handle scheduling logic here
                Navigator.of(context)
                    .pop(); // Close the dialog after confirmation
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.myBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Text(
                'CONFIRM',
                style: TextStyle(color: AppColors.myWhite),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeFields() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            controller: hourController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
              HourInputFormatter(), // Custom formatter for hour validation
            ],
            style: TextStyle(color: AppColors.myWhite),
            decoration: InputDecoration(
                labelText: 'Hour',
                labelStyle: TextStyle(color: AppColors.myWhite2),
                filled: true,
                focusColor: AppColors.myWhite2,
                fillColor: AppColors.myBlack,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: AppColors.myWhite2, width: .25)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: AppColors.myWhite2, width: .25)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: AppColors.myWhite2, width: .25))),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: TextField(
            controller: minuteController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2),
              MinuteInputFormatter(), // Custom formatter for minute validation
            ],
            style: TextStyle(color: AppColors.myWhite),
            decoration: InputDecoration(
                labelText: 'Minute',
                labelStyle: TextStyle(color: AppColors.myWhite2),
                filled: true,
                focusColor: AppColors.myWhite2,
                fillColor: AppColors.myBlack,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: AppColors.myWhite2, width: .25)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: AppColors.myWhite2, width: .25)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide:
                        BorderSide(color: AppColors.myWhite2, width: .25))),
          ),
        ),
      ],
    );
  }
}

