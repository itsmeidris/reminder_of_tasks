import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:notification_app/core/app_colors.dart';
import 'package:notification_app/views/widgets/custom_app_bar.dart';
import 'package:notification_app/views/widgets/custom_notification.dart';
import 'package:notification_app/views/widgets/custom_search_bar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBlack,
      appBar: CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomSearchBar(),
            SizedBox(
              child: Text(
                'Transactions from the last 10 days',
                style: TextStyle(
                  color: AppColors.myWhite,
                  fontSize: 18,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: CustomNotification(),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
