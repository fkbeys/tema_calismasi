import 'package:tema_calismasi/Managers/url_manager.dart';
import 'package:tema_calismasi/data/api_operations.dart';

Future<bool> loginManager(String company, String username, String pass) async {
  try {
    String loginUrl = UrlManager.loginUrl(company, username, pass);
    var result = await ApiOperations.loadx(company, username, pass, loginUrl);
    if (result.any((element) => true)) {
      return true;
    }
    return false;
  } catch (e) {
    return false;
  }
}
