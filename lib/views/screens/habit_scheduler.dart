import 'package:flutter/material.dart';
import 'package:notification_app/utils/constants/colors/app_colors.dart';
import 'package:notification_app/views/widgets/custom_add_task_button.dart';
import 'package:notification_app/views/widgets/habitfy_app_bar.dart';
import 'package:notification_app/views/widgets/time_scheduler_dialog.dart';

class HabitScheduler extends StatefulWidget {
  const HabitScheduler({super.key});

  @override
  State<HabitScheduler> createState() => _HabitSchedulerState();
}

class _HabitSchedulerState extends State<HabitScheduler> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HabitfyAppBar(),
      backgroundColor: AppColors.myBlack,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.myWhite, AppColors.myBlack],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .85,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.myBlack2, width: .25),
              color: AppColors.myBlack2,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          'START A NEW HABIT',
                          style: TextStyle(
                            color: AppColors.myWhite,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: controller,
                    onChanged: (value) {
                      controller.value = TextEditingValue(
                          text: value.toUpperCase(),
                          selection: TextSelection.fromPosition(
                              TextPosition(offset: value.length)));
                    },
                    maxLines: 3,
                    maxLength: 30,
                    textAlign: TextAlign.center,
                    cursorColor: AppColors.myWhite,
                    decoration: InputDecoration(
                      fillColor: AppColors.myBlack2,
                      filled: true,
                      hintText:
                          'SMALL TIP: START SMALL, START WITH 2 MINUTES, 2 MEALS, 2 SETS...',
                      hintStyle: TextStyle(
                        color: AppColors.myWhite2.withOpacity(.3),
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 18,
                        horizontal: 12,
                      ),
                    ),
                    style: TextStyle(
                      color: AppColors.myWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: CustomAddTaskButton(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return TimeSchedulerDialog.buildSchedulerDialog(context);
            },
          );
        },
        icon: Icons.timer_sharp,
        text: 'SET A ROUTINE',
      ),
    );
  }
}
