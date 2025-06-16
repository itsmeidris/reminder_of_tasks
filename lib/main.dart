import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notification_app/routes/router_generator.dart';
import 'package:notification_app/services/notifications_service.dart'; // Import Google Fonts

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //INIT NOTIFIATIONS
  NotificationsService().initNotifications();

  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterGenerator.router,
      theme: ThemeData(
        fontFamily: 'Technor',
      ),
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
