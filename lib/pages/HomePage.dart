import 'package:flutter/material.dart';
import 'package:tema_calismasi/pages/loginpage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("hosgelmisen" + LoginPage.girisYapanKullanici),
        ),
      ),
    );
  }
}
