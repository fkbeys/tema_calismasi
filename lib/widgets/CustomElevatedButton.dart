import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final IconData gelenIcon;
  final Function customOnPressed;
  final Color gelenRenk;

  const CustomElevatedButton(
      {Key? key,
      required this.buttonText,
      required this.gelenIcon,
      required this.customOnPressed,
      required this.gelenRenk})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(gelenRenk)),
        onPressed: () => customOnPressed(),
        child: Column(children: <Widget>[Text(buttonText), Icon(gelenIcon)]),
      ),
    );
  }
}
