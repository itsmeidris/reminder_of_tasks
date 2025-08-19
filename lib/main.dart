import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:notification_app/config/app_providers.dart';
import 'package:notification_app/routing/router_generator.dart';
import 'package:notification_app/services/notifications_service.dart';
import 'package:provider/provider.dart'; // Import Google Fonts

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //INIT NOTIFIATIONS
  NotificationsService().initNotifications();

  //runApp(
  //DevicePreview(
  //enabled: !kReleaseMode,
  //builder: (context) => MainApp(),
  //));

  runApp(MultiProvider(providers: AppProviders.providers, child: MainApp()));
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
