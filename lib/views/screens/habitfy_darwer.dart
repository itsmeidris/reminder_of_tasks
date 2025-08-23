import 'package:flutter/material.dart';
import 'package:notification_app/config/app_colors.dart';
import 'package:notification_app/viewmodels/habits_view_model.dart';
import 'package:provider/provider.dart';

class HabitfyDarwer extends StatelessWidget {
  const HabitfyDarwer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      //backgroundColor: AppColors.myBlack2,
      child: Container(
        color: AppColors.myBlack2,
        child: Column(
          spacing: 15,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
              child: Text(
                'HELLO ${context.read<HabitsViewModel>().user!.userName}',
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
                      'My list of habits ?',
                      style: TextStyle(color: AppColors.myBlack, fontSize: 21),
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
                      'What is my progress state ?',
                      style: TextStyle(color: AppColors.myBlack, fontSize: 21),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
