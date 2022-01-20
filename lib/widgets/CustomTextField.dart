import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatefulWidget {
  final String customhintText;
  final IconData gelenIcon;
  final TextEditingController gelenController;

  const CustomTextFieldWidget(
      {Key? key,
      required this.customhintText,
      required this.gelenIcon,
      required this.gelenController})
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
        controller: widget.gelenController,
        decoration: InputDecoration(
            hintText: widget.customhintText.toString(),
            prefixIcon: Icon(widget.gelenIcon)),
      ),
    );
  }
}
