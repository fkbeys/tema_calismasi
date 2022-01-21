import 'package:flutter/material.dart';

class CustomStringWidget extends StatefulWidget {
  final String gelenText;
  final TextStyle? gelenStyle;

  const CustomStringWidget(
      {Key? key, required this.gelenText, required this.gelenStyle})
      : super(key: key);

  @override
  _CustomStringWidgetState createState() => _CustomStringWidgetState();
}

class _CustomStringWidgetState extends State<CustomStringWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.gelenText,
      style: widget.gelenStyle,
    );
  }
}
