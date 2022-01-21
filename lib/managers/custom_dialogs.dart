import 'package:flutter/cupertino.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:progress_dialog/progress_dialog.dart';

class Msg {
  final BuildContext context;
  ProgressDialog? dialogum;

  Msg(this.context) {
    dialogum = ProgressDialog(context);
  }

  Future show(String message) async {
    dialogum!.style(message: message);
    await dialogum!.show();
  }

  Future hide() async {
    await dialogum!.hide();
  }
}
