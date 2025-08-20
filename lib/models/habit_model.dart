class HabitModel {
  final int habitId;
  final String habitName;
  final String habitSchedule;

  HabitModel({
    required this.habitId,
    required this.habitName,
    required this.habitSchedule,
  });

  @override
  String toString() {
    return 'HabitModel(habitId: $habitId, habitName: $habitName, habitSchedule: $habitSchedule)';
  }

  /// ✅ Converts the "HH:mm" string to a DateTime object (today or tomorrow)
  DateTime get scheduleAsDateTime {
    final now = DateTime.now();
    final parts = habitSchedule.split(':');
    final int hour = int.parse(parts[0]);
    final int minute = int.parse(parts[1]);

    DateTime scheduledDate = DateTime(
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );

    // If the time has already passed today, schedule for tomorrow
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }

    return scheduledDate;
  }
}
