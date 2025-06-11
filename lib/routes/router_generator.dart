import 'package:go_router/go_router.dart';
import 'package:notification_app/views/screens/notifications_screen.dart';
import 'package:notification_app/views/screens/splash_screen.dart';

class RouterGenerator {
  static final router = GoRouter(
    initialLocation: '/', 
  routes: [
    GoRoute(
      path: '/',
      name: 'intro',
      builder: (context, state) {
        return SplashScreen();
      },
    ),
    GoRoute(
      path: '/notifications-screen',
      name: 'notifications',
      builder: (context, state) {
        return NotificationsScreen();
      },
    ),
  ]);
}
