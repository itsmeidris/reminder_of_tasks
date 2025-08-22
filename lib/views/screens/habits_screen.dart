import 'package:flutter/material.dart';
import 'package:notification_app/config/app_colors.dart';
import 'package:notification_app/views/widgets/habit_globe_circle.dart';
import 'package:notification_app/views/shared/habitfy_app_bar.dart';
import 'package:notification_app/views/widgets/habits_list.dart';
import 'package:notification_app/views/widgets/habits_week_days.dart';

class HabitsScreen extends StatelessWidget {
  const HabitsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBlack,
      appBar: HabitfyAppBar(),
      drawer: Drawer(
        backgroundColor: AppColors.myBlack2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 15,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(
                child: Text(
                  'HELLO EDRIS',
                  style: TextStyle(color: AppColors.myWhite, fontSize: 21),
                ),
              ),
              Column(
                spacing: 15,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: AppColors.myWhite2,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.myWhite
                                .withOpacity(.5), // very light shadow
                            spreadRadius: .25,
                            blurRadius: 15,
                            offset: const Offset(2, 4), // X, Y
                          ),
                        ]),
                    child: FittedBox(
                      child: Text(
                        'H A B I T S  T R A C K I N G',
                        style:
                            TextStyle(color: AppColors.myBlack, fontSize: 21),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    decoration: BoxDecoration(
                        color: AppColors.myWhite2,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.myWhite
                                .withOpacity(.5), // very light shadow
                            spreadRadius: .25,
                            blurRadius: 15,
                            offset: const Offset(2, 4), // X, Y
                          ),
                        ]),
                    child: FittedBox(
                      child: Text(
                        'H I S T O R Y  T R A C K I N G',
                        style:
                            TextStyle(color: AppColors.myBlack, fontSize: 21),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
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
            children: [HabitsList(), HabitGlobeCircle(), HabitsWeekDays()],
          ),
        ),
      ),
    );
  }
}
