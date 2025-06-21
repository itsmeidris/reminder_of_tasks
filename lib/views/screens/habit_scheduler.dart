import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notification_app/utils/colors/app_colors.dart';
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
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 20,
            children: [
              Text(
                'START A NEW HABIT',
                style: TextStyle(color: AppColors.myWhite, fontSize: 28),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .75,
                child: Column(
                  spacing: 5,
                  children: [
                    Text(
                      textAlign: TextAlign.center,
                      'SMALL TIP :   START SMALL , START WITH 2 MINUTES , 2 MEALS , 2 SETS...',
                      style: TextStyle(color: AppColors.myWhite2, fontSize: 12),
                    ),
                    TextField(
                      maxLines: null,
                      maxLength: 30,
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        hintText:
                            'HABIT TO KEEP EXAMPLE :  PHONE DOWN FOR 15 MINS...',
                        hintStyle: TextStyle(
                          color: AppColors.myWhite2.withOpacity(.5),
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                            vertical: 18, horizontal: 12),
                      ),
                      style: TextStyle(
                        color: AppColors.myWhite,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return TimeSchedulerDialog.buildSchedulerDialog(
                                  context);
                            });
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
