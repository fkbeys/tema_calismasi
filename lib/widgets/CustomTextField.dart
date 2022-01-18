import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String customhintText;
  final IconData gelenIcon;

  const CustomTextFieldWidget(
      {Key? key, required this.customhintText, required this.gelenIcon})
      : super(key: key);

  @override
  _CustomTextFieldWidgetState createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
            hintText: widget.customhintText.toString(),
            prefixIcon: Icon(widget.gelenIcon)),
      ),
    );
  }
}
