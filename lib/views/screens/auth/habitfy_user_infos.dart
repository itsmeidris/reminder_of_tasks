import 'package:flutter/material.dart';
import 'package:notification_app/config/app_colors.dart';
import 'package:notification_app/models/user_model.dart';
import 'package:notification_app/routing/router_generator.dart';
import 'package:notification_app/viewmodels/habits_view_model.dart';
import 'package:notification_app/views/shared/widgets/habitfy_app_bar.dart';
import 'package:notification_app/views/shared/habitfy_button.dart';
import 'package:provider/provider.dart';

class HabitfyUserInfos extends StatefulWidget {
  const HabitfyUserInfos({super.key});

  @override
  State<HabitfyUserInfos> createState() => _HabitfyUserInfosState();
}

class _HabitfyUserInfosState extends State<HabitfyUserInfos> {
  final TextEditingController _nameController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Open keyboard automatically
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.myBlack2,
      appBar: HabitfyAppBar(),
      body: Consumer<HabitsViewModel>(builder: (context, vm, child) {
        return Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.myWhite, AppColors.myBlack],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      //border: Border.all(color: AppColors.myYellow)
                      ),
                  child: TextField(
                    controller: _nameController,
                    focusNode: _focusNode,
                    textAlign: TextAlign.center, // center text and cursor
                    textAlignVertical:
                        TextAlignVertical.center, // vertical alignment
                    onChanged: (value) {
                      _nameController.value = TextEditingValue(
                        text: value.toUpperCase(),
                        selection: TextSelection.fromPosition(
                          TextPosition(offset: value.length),
                        ),
                      );
                    },
                    maxLines: 3,
                    style: TextStyle(color: AppColors.myBlack, fontSize: 27),
                    cursorColor: AppColors.myYellow, // yellow cursor
                    decoration: InputDecoration(
                      hintText: 'WHAT WOULD YOU LIKE TO BE CALLED ?',
                      hintStyle: TextStyle(
                        color: AppColors.myBlack.withOpacity(.5),
                        fontSize: 27,
                        fontWeight: FontWeight.w400,
                      ),
                      filled: true,
                      fillColor: Colors.transparent, // transparent background
                      border: InputBorder.none, // remove border
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                    ),
                  ),
                ),
                HabitfyButton(
                    onTap: () {
                      final newUser =
                          UserModel(userId: 1, userName: _nameController.text);
                      vm.createUser(newUser);
                      RouterGenerator.router.goNamed('habits');
                    },
                    icon: Icons.arrow_right_outlined,
                    text: 'START !')
              ],
            ),
          ),
        );
      }),
    );
  }
}
