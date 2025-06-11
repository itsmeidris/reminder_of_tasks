import 'package:flutter/material.dart';
import 'package:notification_app/core/app_colors.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
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
        hintStyle:
            TextStyle(color: AppColors.myWhite2, fontWeight: FontWeight.w400),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(width: 0, color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(width: 1, color: AppColors.myGreen),
        ),
      ),
    );
  }
}
