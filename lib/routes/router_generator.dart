import 'package:go_router/go_router.dart';
import 'package:notification_app/views/screens/notifications_screen.dart';

class RouterGenerator {
  static final router = GoRouter(initialLocation: '/', routes: [
    GoRoute(
      path: '/',
      name: 'notifications',
      builder: (context, state) {
        return NotificationsScreen();
      },
    ),
  ]);
}
