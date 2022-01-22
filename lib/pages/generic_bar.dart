import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  /// you can add more fields that meet your needs

  const BaseAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text(title),
      backgroundColor: Colors.amber,
      actions: <Widget>[Icon(Icons.more_vert)],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(10.h);
}
