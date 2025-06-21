import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notification_app/views/screens/habit_scheduler.dart';
import 'package:notification_app/views/screens/habits_screen.dart';

class RouterGenerator {
  static final router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      name: 'habits',
      builder: (context, state) {
        return HabitsScreen();
      },
    ),
    GoRoute(
        path: '/schedule-habit',
        name: 'schedule',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1, 0), // Start just off-screen right
                  end: Offset.zero,
                ).animate(animation),
                child: child,
              );
            },
            child: const HabitScheduler(),
          );
        })
  ]);
}
