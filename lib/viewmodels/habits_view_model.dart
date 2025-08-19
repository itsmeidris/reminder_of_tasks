import 'package:flutter/foundation.dart';

class HabitsViewModel extends ChangeNotifier {
  String _selectedHabit = 'Did you eat the frog ?';
  List<String> _habits = [];

  List<String> get habits => _habits;
  String get selectedHabit => _selectedHabit;

  set selectedHabit(String value) {
    _selectedHabit = value;
    notifyListeners();
  }

  //ADD - REMOVE - CLEAR HABITS
  void addHabit(String newHabit) {
    _habits.add(newHabit);
    notifyListeners();
  }

  void removeHabit(String habit) {
    _habits.remove(habit);
    notifyListeners();
  }

  void clearHabits() {
    _habits.clear();
    notifyListeners();
  }
}
