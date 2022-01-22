import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final IconData gelenIcon;
  final Function customOnPressed;
  final Color gelenRenk;
  final double gelenheight;
  final double gelenwidth;
  final double gelenfontsize;

  const CustomElevatedButton(
      {Key? key,
      required this.buttonText,
      required this.gelenIcon,
      required this.customOnPressed,
      required this.gelenRenk,
      required this.gelenheight,
      required this.gelenwidth,
      required this.gelenfontsize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: ElevatedButton(
        style: ButtonStyle(
            minimumSize:
                MaterialStateProperty.all(Size(gelenwidth, gelenheight)),
            backgroundColor: MaterialStateProperty.all(gelenRenk),
            textStyle:
                MaterialStateProperty.all(TextStyle(fontSize: gelenfontsize))),
        onPressed: () => customOnPressed(),
        child: Column(children: <Widget>[Text(buttonText), Icon(gelenIcon)]),
      ),
    );
  }
}
