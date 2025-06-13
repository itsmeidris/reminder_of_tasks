import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: AppColors.myBlack),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SvgPicture.asset(
                          'assets/hobby.svg',
                          fit: BoxFit.scaleDown,
                          colorFilter: ColorFilter.mode(
                              AppColors.myRed, BlendMode.srcIn),
                        ),
                      ),
                    ),
                  ),
                  // Second Expanded: Name, Email, Transaction ID
                  Expanded(
                    flex: 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        spacing: 4,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Task title',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            'Task small description max 2 lines, just a quick idea about the task',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // Third Expanded: Transaction Price
                  Expanded(
                    flex: 1,
                    child: Center(
                        child: GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 10),
                        decoration: BoxDecoration(
                            color: AppColors.myYellow,
                            borderRadius: BorderRadius.circular(5)),
                        child: FittedBox(
                          child: Text(
                            'Done ?',
                            style: TextStyle(
                                color: AppColors.myBlack,
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                      ),
                    )),
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
