/* import 'package:flutter/material.dart';
import 'package:notification_app/models/user_model.dart';

class UserAuthViewModel extends ChangeNotifier {
  //Auth user infos
  UserModel? _user;

  //Auth user infos
  UserModel? get user => _user;
  //Auth user infos
  
  set user(UserModel? newUser) {
    _user = newUser;
    notifyListeners();
  }

  //Create a user
  void createUser(UserModel user) {
    _user = user;
    notifyListeners();
  }
}
 */