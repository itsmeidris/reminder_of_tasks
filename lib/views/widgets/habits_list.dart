import 'package:flutter/widgets.dart';
import 'package:notification_app/config/app_colors.dart';
import 'package:notification_app/viewmodels/habits_view_model.dart';
import 'package:provider/provider.dart';

class HabitsList extends StatelessWidget {
  const HabitsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HabitsViewModel>(builder: (context, vm, child) {
      return Expanded(
        flex: 1,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.myRed, width: 1),
            borderRadius: BorderRadius.circular(15),
          ),
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
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(vm.habits[index]),
                    );
                  },
                ),
        ),
      );
    });
  }
}
