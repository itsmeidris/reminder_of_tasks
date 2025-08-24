import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notification_app/config/app_colors.dart';
import 'package:notification_app/views/screens/home/components/habitfy_scheduler_.dart';

class HabitfyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HabitfyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final String? currentRoute = GoRouterState.of(context).name;

    return AppBar(
      backgroundColor: AppColors.myWhite,
      centerTitle: true,
      title: Text(
        'F R O G G I F Y',
        style: TextStyle(color: AppColors.myBlack),
      ),
      actions: currentRoute != 'habits'
          ? []
          : [
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) {
                      return HabitfyScheduler.buildSchedulerDialog(context);
                    },
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.myBlack2.withOpacity(.5),
                        blurRadius: 5,
                        spreadRadius: 1,
                        offset: Offset(0, 2),
                      ),
                    ],
                    color: AppColors.myYellow,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child:
                      Icon(Icons.add_alert_outlined, color: AppColors.myBlack2),
                ),
              ),
            ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(65);
}
