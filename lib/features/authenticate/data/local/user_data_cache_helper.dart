
import 'package:shared_preferences/shared_preferences.dart';

class UserDataCacheHelper{

  Future<void> setAuthState({required String userUid}) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('auth', true);
    sharedPreferences.setString('uid', userUid);
  }
  Future<void> setUnAuthState() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('auth', false);
    sharedPreferences.remove('uid');
  }
  Future<String?> getAuthState() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final authState = sharedPreferences.getBool('auth');
    final userUid = sharedPreferences.getString('uid');
    if(authState == true){
      return userUid;
    }else{
      return null;
    }
  }

}