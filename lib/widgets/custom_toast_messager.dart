import 'package:fluttertoast/fluttertoast.dart';

void customToastMessager(String message) {
  Fluttertoast.cancel();
  Fluttertoast.showToast(
      msg: message, fontSize: 18, toastLength: Toast.LENGTH_SHORT);
}
