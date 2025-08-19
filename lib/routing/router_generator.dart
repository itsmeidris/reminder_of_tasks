import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notification_app/config/app_constants.dart';
import 'package:notification_app/views/screens/habit_scheduler.dart';
import 'package:notification_app/views/screens/habits_screen.dart';

class RouterGenerator {
  static final router =
      GoRouter(initialLocation: AppConstants.habitsMainPage, routes: [
    GoRoute(
      path: AppConstants.habitsMainPage,
      name: 'habits',
      builder: (context, state) {
        return HabitsScreen();
      },
    ),
    GoRoute(
        path: AppConstants.habitSchedulerPage,
        name: 'schedule',
        builder: (context, state) {
          return HabitScheduler();
        })
  ]);
}
