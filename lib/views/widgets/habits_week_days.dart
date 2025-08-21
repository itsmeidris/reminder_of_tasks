import 'package:flutter/material.dart';
import 'package:notification_app/config/app_colors.dart';
import 'package:notification_app/config/app_constants.dart';

class HabitsWeekDays extends StatelessWidget {
  const HabitsWeekDays({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current date and day of the week
    final DateTime now = DateTime.now();
    final int currentDayIndex = now.weekday % 7; // Weekday (1=Mon ... 7=Sun)
    final int currentDate = now.day;
    return Expanded(
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
                    color: AppColors.myWhite,
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
    );
  }
}
