import 'package:dio/dio.dart';
import 'package:tema_calismasi/model/KullanicilarModel';

class ApiOperations {
  static Future<List<KullanicilarModel>> loadx(
      String _company, String _username, String password, String link) async {
    Dio _dio = Dio();
    Response _response = await _dio.get(link);

    return (_response.data as List)
        .map((x) => KullanicilarModel.fromJson(x))
        .toList();
  }
}
