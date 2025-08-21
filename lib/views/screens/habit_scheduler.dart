import 'package:flutter/material.dart';
import 'package:notification_app/config/app_colors.dart';
import 'package:notification_app/viewmodels/habits_view_model.dart';
import 'package:notification_app/views/shared/habitfy_button.dart';
import 'package:notification_app/views/shared/habitfy_app_bar.dart';
import 'package:notification_app/views/widgets/habitfy_scheduler_dialog.dart';
import 'package:provider/provider.dart';

class HabitScheduler extends StatefulWidget {
  const HabitScheduler({super.key});

  @override
  State<HabitScheduler> createState() => _HabitSchedulerState();
}

class _HabitSchedulerState extends State<HabitScheduler> {
  final TextEditingController habitController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HabitfyAppBar(),
      backgroundColor: AppColors.myBlack,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.myWhite, AppColors.myBlack],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width * .85,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.myBlack2, width: .25),
              color: AppColors.myBlack2,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Center(
                      child: FittedBox(
                        child: Text(
                          'START A NEW HABIT',
                          style: TextStyle(
                            color: AppColors.myWhite,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Consumer<HabitsViewModel>(builder: (context, vm, child) {
                    return TextField(
                      controller: habitController,
                      onChanged: (value) {
                        habitController.value = TextEditingValue(
                            text: value.toUpperCase(),
                            selection: TextSelection.fromPosition(
                                TextPosition(offset: value.length)));
                      },
                      maxLines: 3,
                      maxLength: 30,
                      textAlign: TextAlign.center,
                      cursorColor: AppColors.myWhite,
                      decoration: InputDecoration(
                        fillColor: AppColors.myBlack2,
                        filled: true,
                        hintText:
                            'SMALL TIP: START SMALL, START WITH 2 MINUTES, 2 MEALS, 2 SETS...',
                        hintStyle: TextStyle(
                          color: AppColors.myWhite2.withOpacity(.3),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 12,
                        ),
                      ),
                      style: TextStyle(
                        color: AppColors.myWhite,
                      ),
                    );
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: HabitfyButton(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (context) {
              return HabitfySchedulerDialog.buildSchedulerDialog(context);
            },
          );
          final viewModel = context.read<HabitsViewModel>();
          viewModel.selectedHabit = habitController.text.trim();
          debugPrint('Selected Habit${habitController.text}');
        },
        icon: Icons.timer_sharp,
        text: 'SET A ROUTINE',
      ),
    );
  }
}
