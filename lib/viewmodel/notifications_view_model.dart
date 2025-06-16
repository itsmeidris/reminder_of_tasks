import 'package:flutter/foundation.dart';

class NotificationsViewModel extends ChangeNotifier {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  /// Sets the loading state and notifies listeners if there's a change
  void setIsLoading(bool value) {
    if (_isLoading != value) {
      _isLoading = value;
      notifyListeners();
      debugPrint('Loading state changed to: $_isLoading');
    }
  }

  /// Example function to simulate a state change and notify listeners
  void changeColor() {
    try {
      debugPrint('Attempting to change state...');
      setIsLoading(true);

      // Simulating some processing logic
      Future.delayed(Duration(seconds: 1), () {
        setIsLoading(false);
        debugPrint('State successfully updated.');
      });
    } catch (e) {
      debugPrint('Error occurred while changing state: $e');
    }
  }

}
