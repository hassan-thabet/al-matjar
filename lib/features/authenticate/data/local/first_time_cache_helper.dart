import 'package:shared_preferences/shared_preferences.dart';

class FirstTimeCacheHelper {
  Future<void> setFirstTimeState() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('first_time', false);
  }

  Future<bool> getFirstTimeState() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final firstTimeState = sharedPreferences.getBool('first_time');
    if (firstTimeState == false) {
      return false;
    } else {
      return true;
    }
  }
}
