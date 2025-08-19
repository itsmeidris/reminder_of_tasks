import 'package:flutter/material.dart';
import 'package:notification_app/config/app_colors.dart';
import 'package:notification_app/config/app_constants.dart';
import 'package:notification_app/routing/router_generator.dart';
import 'package:notification_app/services/notifications_service.dart';
import 'package:notification_app/viewmodels/habits_view_model.dart';
import 'package:notification_app/views/widgets/custom_add_task_button.dart';
import 'package:notification_app/views/widgets/habit_globe_circle.dart';
import 'package:notification_app/views/widgets/habitfy_app_bar.dart';
import 'package:notification_app/views/widgets/habits_list.dart';
import 'package:provider/provider.dart';

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
      appBar: HabitfyAppBar(),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.myWhite, AppColors.myBlack],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              HabitsList(),
              /*Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomAddTaskButton(
                      //onAddTaskTap: scheduleNotification
                      onTap: () {
                        //scheduleNotification();
                        RouterGenerator.router.pushNamed('schedule');
                      },
                      text: 'SCHEDULE A HABIT',
                      icon: Icons.notification_add_outlined,
                    ),
                  ],
                ),
              ),*/
              HabitGlobeCircle(),
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: 7,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final String day =
                        AppConstants.daysOfWeek[(currentDayIndex + index) % 7];
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
      ),
      floatingActionButton: ElevatedButton(
          onPressed: () {
            final viewModel = context.read<HabitsViewModel>();
            viewModel.selectedHabit = 'HABIT DETECTED'; // Example action
            viewModel.addHabit(viewModel.selectedHabit);
          },
          child: Text(
            'Change Habit',
          )),
    );
  }
}
