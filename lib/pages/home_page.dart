import 'package:flutter/material.dart';
import 'package:tema_calismasi/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Center(
          child: Text("hosgelmisen" + LoginPage.girisYapanKullanici),
        ),
      ),
    );
  }
}
