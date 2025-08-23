import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notification_app/config/app_colors.dart';
import 'package:notification_app/config/app_constants.dart';
import 'package:notification_app/utils/time_formatter.dart';
import 'package:notification_app/viewmodels/habits_view_model.dart';
import 'package:notification_app/views/shared/habitfy_button.dart';
import 'package:provider/provider.dart';

class HabitfyScheduler {
  static Widget buildSchedulerDialog(BuildContext context) {
    return _TimeScheduler();
  }
}

class _TimeScheduler extends StatefulWidget {
  @override
  State<_TimeScheduler> createState() => _TimeSchedulerState();
}

class _TimeSchedulerState extends State<_TimeScheduler> {
  // Controllers for habit, hour and minute input fields
  final TextEditingController habitController = TextEditingController();
  final TextEditingController hourController = TextEditingController();
  final TextEditingController minuteController = TextEditingController();

  @override
  void dispose() {
    // Dispose of controllers to release resources
    habitController.dispose();
    hourController.dispose();
    minuteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        reverse: true,
        child: Padding(
          padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom, top: 40),
          child: Consumer<HabitsViewModel>(builder: (context, vm, child) {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .85,
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
                          'START A NEW HABIT',
                          style: TextStyle(
                            color: AppColors.myWhite,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        TextField(
                          controller: habitController,
                          onChanged: (value) {
                            habitController.value = TextEditingValue(
                                text: value.toUpperCase(),
                                selection: TextSelection.fromPosition(
                                    TextPosition(offset: value.length)));
                          },
                          maxLines: 3,
                          maxLength: 30,
                          style: TextStyle(color: AppColors.myWhite),
                          cursorColor: AppColors.myWhite2,
                          decoration: InputDecoration(
                            hintText:
                                'SMALL TIP: START SMALL, START WITH 2 MINUTES, 2 MEALS, 2 SETS...',
                            hintStyle: TextStyle(
                              color: AppColors.myWhite2.withOpacity(.3),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: AppColors.myBlack,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: AppColors.myWhite2, width: .25),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: AppColors.myWhite2, width: .25),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(
                                  color: AppColors.myWhite2, width: .25),
                            ),
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
                              final String day =
                                  AppConstants.daysLetters[index];
                              return Center(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 4.0),
                                  child: Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: AppColors.myBlack2,
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(
                                            color: AppColors.myWhite)),
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
                      child: HabitfyButton(
                        onTap: () {
                          final String selectedHabit =
                              habitController.text.trim();
                          final String hour = hourController.text;
                          final String minute = minuteController.text;

                          vm.habitSchedule = '$hour:$minute';
                          vm.selectedHabit = selectedHabit;

                          vm.createAndAddHabit(
                            habitName: vm.selectedHabit,
                            habitSchedule: vm.habitSchedule,
                          );
                          Navigator.of(context).pop();
                        },
                        text: 'SCHEDULE A HABIT',
                        icon: Icons.notification_add_outlined,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ));
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
                labelStyle: TextStyle(
                  color: AppColors.myWhite2.withOpacity(.3),
                ),
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
                labelStyle: TextStyle(
                  color: AppColors.myWhite2.withOpacity(.3),
                ),
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
