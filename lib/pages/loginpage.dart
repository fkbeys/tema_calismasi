import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tema_calismasi/data/ApiOperations.dart';
import 'package:tema_calismasi/data/UrlHelper.dart';
import 'package:tema_calismasi/pages/HomePage.dart';
import 'package:tema_calismasi/theme/ThemeClass.dart';
import 'package:tema_calismasi/widgets/CustomElevatedButton.dart';
import 'package:tema_calismasi/widgets/CustomLabel.dart';
import 'package:tema_calismasi/widgets/CustomTextField.dart';
import 'package:tema_calismasi/widgets/CustomToastMessage.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  static String girisYapanKullanici = "";
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var t = AppLocalizations.of(context)!;
    final _companyController = TextEditingController();
    final _usernameConroller = TextEditingController();
    final _passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
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
              CustomTextFieldWidget(
                customhintText: "Sirket",
                gelenIcon: Icons.home,
                gelenController: _companyController,
              ),
              CustomTextFieldWidget(
                customhintText: "Kullanici Adi",
                gelenIcon: Icons.people,
                gelenController: _usernameConroller,
              ),
              CustomTextFieldWidget(
                customhintText: "Sifre",
                gelenIcon: Icons.password,
                gelenController: _passwordController,
              ),
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
                      customOnPressed: () async {
                        {
                          bool result = await loginYap(
                              _companyController.text,
                              _usernameConroller.text,
                              _passwordController.text);

                          if (result) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }
                        }
                      }),
                  CustomElevatedButton(
                      buttonText: "Demo",
                      gelenIcon: Icons.vpn_key,
                      customOnPressed: () {
                        _companyController.text = "DEMO";
                        _usernameConroller.text = "DEMO";
                        _passwordController.text = "DEMO";
                      },
                      gelenRenk: Colors.blue.shade600)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> loginYap(String company, String username, String pass) async {
    customToastMessager("Login tiklandi.");

    String loginUrl = UrlHelper.loginUrl(company, username, pass);

    var result = await ApiOperations.loadx(company, username, pass, loginUrl);
    var ss = result.first.kullaniciName;

    return true;
  }

  temadegistir(BuildContext context) {
    Provider.of<ThemeClass>(context, listen: false).temadegistir();
  }
}
