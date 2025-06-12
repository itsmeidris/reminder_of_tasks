import 'package:flutter/material.dart';
import 'package:notification_app/core/app_colors.dart';
import 'package:notification_app/services/notifications_service.dart';
import 'package:notification_app/views/widgets/custom_app_bar.dart';
import 'package:notification_app/views/widgets/custom_notification.dart';
import 'package:notification_app/views/widgets/custom_search_bar.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), triggerNotification);
  }

  void triggerNotification() {
    // Add your notification logic here
    NotificationsService().showNotification(
        title: 'Hello after 5 seconds',
        body:
            'This is notfication is scheduled to be triggered after 5 seconds.');
  }

  void scheduleNotification() {
    Future.delayed(Duration(seconds: 5), triggerNotification);
  }

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
            CustomActionsBar(
              onSearchTap: () {},
              onAddTaskTap: () {
                scheduleNotification(); // Schedule the notification here
              },
            ),
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
