import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notification_app/utils/colors/app_colors.dart';
import 'package:notification_app/utils/constants/constants.dart';
import 'package:notification_app/utils/validators/time_formatter.dart';
import 'package:notification_app/views/widgets/custom_add_task_button.dart';

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
      height: MediaQuery.of(context).size.height * .55,
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
          spacing: 25,
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
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'SCHEDULE A ROUTINE',
                  style: TextStyle(
                    color: AppColors.myWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                _buildTimeFields(),
              ],
            ),
            Column(
              spacing: 8,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'REPEAT ON DAYS ?',
                  style: TextStyle(
                    color: AppColors.myWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 75,
                  child: ListView.builder(
                    itemCount: 7,
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(0),
                    itemBuilder: (context, index) {
                      final String day = daysLetters[index];
                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: AppColors.myBlack2,
                                borderRadius: BorderRadius.circular(50),
                                border: Border.all(color: AppColors.myWhite)),
                            child: Center(
                              child: Text(
                                day,
                                style: TextStyle(
                                  color: AppColors.myWhite,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CustomAddTaskButton(
                //onAddTaskTap: scheduleNotification
                onTap: () {},
                text: 'SCHEDULE A HABIT',
                icon: Icons.notification_add_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeFields() {
    return Row(
      spacing: 5,
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
            cursorColor: AppColors.myWhite2,
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
