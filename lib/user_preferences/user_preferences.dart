import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  static final UserPreferences _instancia = UserPreferences._internal();

  factory UserPreferences() {
    return _instancia;
  }

  UserPreferences._internal();

  late SharedPreferences _prefs;

  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del tema
  bool get dark {
    return _prefs.getBool('dark') ?? false;
  }

  set dark(bool value) {
    _prefs.setBool('dark', value);
  }
}
