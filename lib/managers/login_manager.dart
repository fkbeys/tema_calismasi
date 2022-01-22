import 'package:tema_calismasi/Managers/url_manager.dart';
import 'package:tema_calismasi/data/api_operations.dart';
import 'package:tema_calismasi/managers/shared_preferences_manager.dart';

Future<bool> loginManager(String company, String username, String pass) async {
  try {
    String loginUrl = UrlManager.loginUrl(company, username, pass);
    var result = await ApiOperations.loadx(company, username, pass, loginUrl);
    if (result.any((element) => true)) {
      await SharedPrefs().saveLoginPrefs(company, username, true, pass);
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}
