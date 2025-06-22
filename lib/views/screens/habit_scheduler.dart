import 'package:flutter/material.dart';
import 'package:notification_app/utils/colors/app_colors.dart';
import 'package:notification_app/views/widgets/custom_add_task_button.dart';
import 'package:notification_app/views/widgets/custom_app_bar.dart';
import 'package:notification_app/views/widgets/time_scheduler_dialog.dart';

class HabitScheduler extends StatefulWidget {
  const HabitScheduler({super.key});

  @override
  State<HabitScheduler> createState() => _HabitSchedulerState();
}

class _HabitSchedulerState extends State<HabitScheduler> {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: 'HABIT SCHEDULER'),
      backgroundColor: AppColors.myBlack,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.myWhite, AppColors.myBlack],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              spacing: 35,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 0,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .85,
                      child: Center(
                        child: Text(
                          'START A NEW HABIT',
                          style: TextStyle(
                              color: AppColors.myWhite,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * .7,
                      child: Text(
                        textAlign: TextAlign.center,
                        'SMALL TIP :   START SMALL , START WITH 2 MINUTES , 2 MEALS , 2 SETS...',
                        style:
                            TextStyle(color: AppColors.myBlack2, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width * .75,
                  child: TextField(
                    maxLines: null,
                    maxLength: 30,
                    textAlign: TextAlign.center,
                    cursorColor: AppColors.myWhite,
                    decoration: InputDecoration(
                      fillColor: AppColors.myBlack2,
                      filled: true,
                      hintText:
                          'HABIT TO KEEP EXAMPLE :  PHONE DOWN FOR 15 MINS...',
                      hintStyle: TextStyle(
                          color: AppColors.myWhite2.withOpacity(.3),
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 18, horizontal: 12),
                    ),
                    style: TextStyle(
                      color: AppColors.myWhite,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: CustomAddTaskButton(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled:
                true, // Ensures the bottom sheet can expand fully
            backgroundColor:
                Colors.transparent, // Makes the sheet's corners visible
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
