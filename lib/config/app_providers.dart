import 'package:notification_app/viewmodels/habits_view_model.dart';
import 'package:provider/provider.dart';

class AppProviders {
  static final providers = [
    //ChangeNotifierProvider(create: (_) => UserAuthViewModel()),
    ChangeNotifierProvider(create: (_) => HabitsViewModel()),
  ];
}
