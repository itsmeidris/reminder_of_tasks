import 'package:flutter/foundation.dart';
import 'package:notification_app/config/app_constants.dart';
import 'package:notification_app/models/habit_model.dart';
import 'package:notification_app/services/notifications_service.dart';

class HabitsViewModel extends ChangeNotifier {
  String _selectedHabit = 'Did you eat the frog ?';
  String _habitSchedule = '';
  bool _isHabitScheduled = false;
  List<HabitModel> _habits = [];

  //Notification related properties
  NotificationsService notificationsService = NotificationsService();

  String get selectedHabit => _selectedHabit;
  String get habitSchedule => _habitSchedule;
  bool get isHabitScheduled => _isHabitScheduled;
  List<HabitModel> get habits => _habits;

  set selectedHabit(String value) {
    _selectedHabit = value;
    notifyListeners();
  }

  set habitSchedule(String value) {
    _habitSchedule = value;
    notifyListeners();
  }

  set habits(List<HabitModel> value) {
    _habits = value;
    notifyListeners();
  }

  set isHabitScheduled(bool value) {
    _isHabitScheduled = value;
    notifyListeners();
  }

  //ADD - REMOVE - CLEAR HABITS
  void createAndAddHabit(
      {required String habitName, required String habitSchedule}) {
    final newHabit = HabitModel(
      habitId: _habits.length + 1, // Simple ID generation
      habitName: habitName,
      habitSchedule: habitSchedule,
    );
    _habits.add(newHabit);
    _isHabitScheduled = true; // Set to true when a habit is added

    //Schedule the notification
    notificationsService.scheduleNotification(
      id: newHabit.habitId,
      title: newHabit.habitName,
      body: AppConstants.notificationMessage,
      scheduledDate: newHabit.scheduleAsDateTime,
    );
    notifyListeners();
  }

  void removeHabit(HabitModel habit) {
    _habits.remove(habit);
    notifyListeners();
  }

  void clearHabits() {
    _habits.clear();
    notifyListeners();
  }
}
