import 'package:flutter/material.dart';
import 'package:notification_app/config/app_colors.dart';
import 'package:notification_app/viewmodels/habits_view_model.dart';
import 'package:provider/provider.dart';

class HabitGlobeCircle extends StatefulWidget {
  const HabitGlobeCircle({super.key});

  @override
  State<HabitGlobeCircle> createState() => _HabitGlobeCircleState();
}

class _HabitGlobeCircleState extends State<HabitGlobeCircle> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HabitsViewModel>(builder: (context, vm, child) {
      return Expanded(
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
                  vm.selectedHabit,
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
      );
    });
  }
}
