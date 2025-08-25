import 'package:flutter/material.dart';
import 'package:notification_app/config/app_colors.dart';
import 'package:notification_app/viewmodels/habits_view_model.dart';
import 'package:provider/provider.dart';

class HabitsList extends StatelessWidget {
  const HabitsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitsViewModel>(builder: (context, vm, child) {
      return Expanded(
        child: vm.habits.isEmpty
            ? Center(
                child: Text(
                  'No habits added yet',
                  style: TextStyle(color: AppColors.myBlack, fontSize: 16),
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(0.0),
                itemCount: vm.habits.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  final habit = vm.habits[index];
                  return GestureDetector(
                    onTap: () {
                      vm.toggleHabitChecked(index);
                      vm.selectedHabit = habit.habitName;
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            habit.habitName.length < 5
                                ? habit.habitName
                                : '${habit.habitName.substring(0, 5)}...',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 20),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 2, horizontal: 8),
                            decoration: BoxDecoration(
                              color: AppColors.myBlack2,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              spacing: 5,
                              children: [
                                Text(habit.habitSchedule,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: AppColors.myWhite,
                                        fontSize: 14)),
                                Icon(
                                  Icons.alarm,
                                  size: 14,
                                  color: AppColors.myWhite,
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 8),
                            width: 50,
                            height: 2.5,
                            decoration: BoxDecoration(
                              color: habit.icChecked
                                  ? AppColors.myYellow
                                  : AppColors.myBlack2,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
      );
    });
  }
}
