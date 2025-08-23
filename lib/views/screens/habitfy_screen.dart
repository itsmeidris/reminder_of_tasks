import 'package:flutter/material.dart';
import 'package:notification_app/config/app_colors.dart';
import 'package:notification_app/views/widgets/habit_globe_circle.dart';
import 'package:notification_app/views/shared/habitfy_app_bar.dart';
import 'package:notification_app/views/screens/habitfy_darwer.dart';
import 'package:notification_app/views/widgets/habits_list.dart';
import 'package:notification_app/views/widgets/habits_week_days.dart';

class HabitfyScreen extends StatelessWidget {
  const HabitfyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBlack,
      appBar: HabitfyAppBar(),
      drawer: HabitfyDarwer(),
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
