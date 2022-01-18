import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tema_calismasi/theme/ThemeClass.dart';
import 'package:tema_calismasi/widgets/CustomElevatedButton.dart';
import 'package:tema_calismasi/widgets/CustomLabel.dart';
import 'package:tema_calismasi/widgets/CustomTextField.dart';
import 'package:tema_calismasi/widgets/CustomToastMessage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;

    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Icon(
              Icons.ac_unit_sharp,
              color: Colors.amber,
              size: 120,
            ),
            CustomStringWidget(
              /*  gelenText: "RSFSOFT.NET".toString(),*/
              gelenText: t.helloWorld,
              gelenStyle: Theme.of(context).textTheme.headline4,
            ),
            CustomStringWidget(
              gelenText: "The future of ERP...".toString(),
              gelenStyle: Theme.of(context).textTheme.headline6,
            ),
            const CustomTextFieldWidget(
                customhintText: "Sirket", gelenIcon: Icons.home),
            const CustomTextFieldWidget(
                customhintText: "Kullanici Adi", gelenIcon: Icons.people),
            const CustomTextFieldWidget(
                customhintText: "Sifre", gelenIcon: Icons.password),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () => temadegistir(context),
                  child: const Text('Tema Değiştir'),
                ),
                CustomElevatedButton(
                    buttonText: 'Giriş Yap',
                    gelenIcon: Icons.login,
                    gelenRenk: Colors.redAccent,
                    customOnPressed: () => {loginYap()})
              ],
            )
          ],
        ),
      ),
    );
  }
}

loginYap() {
  customToastMessager("Login tiklandi.");
}

temadegistir(BuildContext context) {
  Provider.of<ThemeClass>(context, listen: false).temadegistir();
}
