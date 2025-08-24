import 'package:flutter/widgets.dart';
import 'package:notification_app/config/app_colors.dart';

class HabitfyThemes {
  static LinearGradient habitfyLinearGradient() {
    return LinearGradient(
        colors: [AppColors.myWhite, AppColors.myBlack],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter);
  }
}
