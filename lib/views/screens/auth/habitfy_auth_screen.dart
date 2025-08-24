import 'package:flutter/material.dart';
import 'package:notification_app/config/app_colors.dart';
import 'package:notification_app/routing/router_generator.dart';
import 'package:notification_app/views/shared/widgets/habitfy_app_bar.dart';
import 'package:notification_app/views/shared/widgets/habitfy_auth_button.dart';
import 'package:notification_app/views/shared/themes/habitfy_themes.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HabitfyAuthScreen extends StatelessWidget {
  const HabitfyAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: HabitfyAppBar(),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: HabitfyThemes.habitfyLinearGradient(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  spacing: 5,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: AppColors.myYellow,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: []),
                        child: FittedBox(
                            child: Text(
                          'Your time,\nYour habits,\nYour future !',
                          style: TextStyle(),
                        )),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                            color: AppColors.myGreen,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: []),
                        child: FittedBox(
                            child: Text(
                          'Your time,\nYour habits,\nYour future !',
                          style: TextStyle(),
                        )),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      spacing: 8,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        HabitfyAuthButton(
                          icon: 'google',
                          text: 'Continue with Google',
                          onTap: () {},
                        ),
                        HabitfyAuthButton(
                          icon: 'social',
                          text: 'Continue as a guest',
                          onTap: () {
                            RouterGenerator.router.pushNamed('user-infos');
                          },
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
