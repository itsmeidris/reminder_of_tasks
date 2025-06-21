import 'package:flutter/material.dart';
import 'package:notification_app/utils/colors/app_colors.dart';
import 'package:notification_app/utils/constants/constants.dart';
import 'package:notification_app/routes/router_generator.dart';
import 'package:notification_app/services/notifications_service.dart';
import 'package:notification_app/views/widgets/custom_add_task_button.dart';
import 'package:notification_app/views/widgets/custom_app_bar.dart';

class HabitsScreen extends StatefulWidget {
  const HabitsScreen({super.key});

  @override
  State<HabitsScreen> createState() => _HabitsScreenState();
}

class _HabitsScreenState extends State<HabitsScreen> {
  @override
  void initState() {
    super.initState();
  }

  void triggerNotification() {
    NotificationsService().showNotification(
      title: 'Hello after 3 seconds',
      body: 'This notification is scheduled to be triggered after 3 seconds.',
    );
  }

  void scheduleNotification() {
    Future.delayed(const Duration(seconds: 3), triggerNotification);
  }

  @override
  Widget build(BuildContext context) {
    // Get current date and day of the week
    final DateTime now = DateTime.now();
    final int currentDayIndex = now.weekday % 7; // Weekday (1=Mon ... 7=Sun)
    final int currentDate = now.day;

    return Scaffold(
      backgroundColor: AppColors.myBlack,
      appBar: CustomAppBar(
        text: 'HABITS REMINDER',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomAddTaskButton(
                    //onAddTaskTap: scheduleNotification
                    onAddTaskTap: () {
                      RouterGenerator.router.pushNamed('schedule');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: AppColors.myBlack2,
                    shape: BoxShape.circle,
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'PHONE DOWN FOR 15 MINS',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.myWhite,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemCount: 7,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final String day = daysOfWeek[(currentDayIndex + index) % 7];
                  final int date = currentDate + index;

                  final bool isToday = index == 0;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: AppColors.myBlack2,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              '$date',
                              style: TextStyle(
                                color: AppColors.myWhite,
                              ),
                            ),
                          ),
                        ),
                        Text(
                          day,
                          style: TextStyle(
                            color: AppColors.myWhite2,
                          ),
                        ),
                        isToday
                            ? Container(
                                margin: const EdgeInsets.only(top: 4),
                                width: 25,
                                height: 3,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: AppColors.myYellow),
                              )
                            : SizedBox.shrink()
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
