import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notification_app/config/app_providers.dart';
import 'package:notification_app/firebase_options.dart';
import 'package:notification_app/routing/router_generator.dart';
import 'package:notification_app/services/notifications_service.dart';
import 'package:provider/provider.dart'; // Import Google Fonts

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationsService().initNotifications();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.providers, // all your providers here
      child: Builder(
        builder: (context) {
          // Builder gives a new context UNDER MultiProvider
          return MaterialApp.router(
            routerConfig: RouterGenerator.router,
            theme: ThemeData(fontFamily: 'Technor'),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}

