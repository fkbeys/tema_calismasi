import 'package:shared_preferences/shared_preferences.dart';
import 'package:tema_calismasi/view_model/login_vm.dart';

class SharedPrefs {
  Future saveLoginPrefs(
      String company, String username, bool rememeberPass, String pass) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString("company", company);
    await prefs.setString("username", username);
    await prefs.setBool("remember_pass", rememeberPass);
    if (rememeberPass) {
      await prefs.setString("pass", pass);
    }
  }

  Future<LoginVM> readLoginPrefs() async {
    var obj = LoginVM("", "", "", false);
    try {
      final prefs = await SharedPreferences.getInstance();

      var company = prefs.getString("company");
      var username = prefs.getString("username");
      var pass = prefs.getString("pass");
      var rememberPass = prefs.getBool("remember_pass");

      obj = LoginVM(company!, username!, pass!, rememberPass!);
      // notifyListeners();
      return obj;
    } catch (e) {
      return obj;
    }
  }
}
