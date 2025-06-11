import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notification_app/routes/router_generator.dart'; // Import Google Fonts

void main() {
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
        textTheme: GoogleFonts.latoTextTheme(), // Use Lato for all text
      ),
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
    );
  }
}
