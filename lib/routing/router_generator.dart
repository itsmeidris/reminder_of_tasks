import 'package:go_router/go_router.dart';
import 'package:notification_app/config/app_constants.dart';
import 'package:notification_app/views/screens/habitfy_user_infos.dart';
import 'package:notification_app/views/screens/habitfy_screen.dart';

class RouterGenerator {
  static final router =
      GoRouter(initialLocation: AppConstants.habitsUserInfoPage, routes: [
    GoRoute(
      path: AppConstants.habitsUserInfoPage,
      name: 'user-infos',
      builder: (context, state) {
        return HabitfyUserInfos();
      },
    ),
    GoRoute(
      path: AppConstants.habitsMainPage,
      name: 'habits',
      builder: (context, state) {
        return HabitfyScreen();
      },
    ),
  ]);
}
