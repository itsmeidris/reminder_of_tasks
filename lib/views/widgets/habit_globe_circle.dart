import 'package:flutter/material.dart';
import 'package:notification_app/config/app_colors.dart';
import 'package:notification_app/viewmodels/habits_view_model.dart';
import 'package:provider/provider.dart';
import 'package:vibration/vibration.dart';

class HabitGlobeCircle extends StatefulWidget {
  const HabitGlobeCircle({super.key});

  @override
  State<HabitGlobeCircle> createState() => _HabitGlobeCircleState();
}

class _HabitGlobeCircleState extends State<HabitGlobeCircle> {
  bool _isOverlayVisible = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitsViewModel>(builder: (context, vm, child) {
      return Expanded(
        flex: 5,
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: GestureDetector(
            onLongPress: () async {
              setState(() {
                _isOverlayVisible = true;
              });
              if (await Vibration.hasCustomVibrationsSupport()) {
                Vibration.vibrate(pattern: [0, 200, 100, 300]);
                // 0ms delay, 200ms buzz, 100ms pause, 300ms buzz
              }
            },
            onLongPressUp: () {
              setState(() {
                _isOverlayVisible = false;
              });
              Vibration
                  .cancel(); // stops ongoing vibration (useful for long patterns)
            },
            child: Stack(
              alignment: Alignment.center,
              children: [
                // Base circle
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: AppColors.myBlack2,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.myWhite.withOpacity(0.5),
                        blurRadius: 23,
                        spreadRadius: 3,
                      ),
                    ],
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

                // Overlay expanding circle
                AnimatedContainer(
                  duration: const Duration(milliseconds: 600),
                  width: _isOverlayVisible ? 300 : 0,
                  height: _isOverlayVisible ? 300 : 0,
                  decoration: BoxDecoration(
                    color: AppColors.myYellow,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.myBlack2,
                        blurRadius: 23,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
