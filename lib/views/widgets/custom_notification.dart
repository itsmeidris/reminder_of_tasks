import 'package:flutter/material.dart';
import 'package:notification_app/core/app_colors.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                '15 Jan - 11:59 AM',
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.myBlack2,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align date to start
            children: [
              Row(
                children: [
                  // First Expanded: Person Icon
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey[300],
                        child: Icon(
                          Icons.person,
                          size: 40,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ),
                  // Second Expanded: Name, Email, Transaction ID
                  Expanded(
                    flex: 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'john.doe@email.com',
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Transaction ID: *********447',
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Third Expanded: Transaction Price
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Text(
                        '\$1245',
                        style: TextStyle(
                          color: AppColors.myGreen,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
