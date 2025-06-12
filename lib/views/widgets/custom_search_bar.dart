import 'package:flutter/material.dart';
import 'package:notification_app/core/app_colors.dart';

class CustomActionsBar extends StatelessWidget {
  final VoidCallback onSearchTap;
  final VoidCallback onAddTaskTap;
  const CustomActionsBar(
      {super.key, required this.onSearchTap, required this.onAddTaskTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Expanded(
          flex: 4,
          child: TextField(
            style: TextStyle(
                color: AppColors.myWhite), // Set entered text color to white

            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.myBlack2,
              prefixIcon: Icon(
                Icons.search_rounded,
                color: AppColors.myWhite2,
              ),
              hintText: 'Search',
              hintStyle: TextStyle(
                  color: AppColors.myWhite2, fontWeight: FontWeight.w400),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(width: 0, color: Colors.transparent),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: BorderSide(width: 1, color: AppColors.myGreen),
              ),
            ),
          ),
        ),
        Expanded(
            child: ElevatedButton(
          onPressed: onAddTaskTap,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.myGreen,
              elevation: 1,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 0)),
          child: Icon(
            Icons.notification_add_outlined,
            size: 30,
            color: AppColors.myBlack,
            weight: 2,
          ),
        )),
      ],
    );
  }
}
