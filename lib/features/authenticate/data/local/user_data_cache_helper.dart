
import 'package:shared_preferences/shared_preferences.dart';

class UserDataCacheHelper{

  Future<void> setAuthState() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('auth', true);
  }
  Future<void> setUnAuthState() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool('auth', false);
  }
  Future<bool> getAuthState() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final authState = sharedPreferences.getBool('auth');
    if(authState != null){
      return authState;
    }else{
      return false;
    }
  }

  Future<void> googleUserDataCache(String userName) async {

  }

  Future<void> facebookUserDataCache() async {

  }

}