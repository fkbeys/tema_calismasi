import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'package:provider/provider.dart';
import 'package:tema_calismasi/data/api_operations.dart';
import 'package:tema_calismasi/Managers/url_manager.dart';
import 'package:tema_calismasi/pages/home_page.dart';
import 'package:tema_calismasi/theme/theme_class.dart';
import 'package:tema_calismasi/widgets/custom_elevated_button.dart';
import 'package:tema_calismasi/widgets/custom_label.dart';
import 'package:tema_calismasi/widgets/custom_text_field.dart';
import 'package:tema_calismasi/widgets/custom_toast_messager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  static String girisYapanKullanici = "";

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var dialogum = ProgressDialog(context);

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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomElevatedButton(
                            buttonText: 'Giriş Yap',
                            gelenIcon: Icons.login,
                            gelenRenk: Colors.redAccent,
                            customOnPressed: () async {
                              {
                                await dialogum.show();
                                bool result = await loginYap(
                                    _companyController.text,
                                    _usernameConroller.text,
                                    _passwordController.text);

                                if (result) {
                                  await dialogum.hide();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const HomePage()));
                                }
                                await dialogum.hide();
                              }
                            }),
                      ],
                    ),
                    CustomElevatedButton(
                        buttonText: "Demo",
                        gelenIcon: Icons.vpn_key,
                        customOnPressed: () {
                          _companyController.text = "DEMO";
                          _usernameConroller.text = "DEMO";
                          _passwordController.text = "DEMO";
                        },
                        gelenRenk: Colors.blue.shade600),
                    CustomElevatedButton(
                      customOnPressed: () => temadegistir(context),
                      buttonText: '',
                      gelenIcon: Icons.light_mode,
                      gelenRenk: Colors.yellow.shade800,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> loginYap(String company, String username, String pass) async {
    customToastMessager("Login tiklandi.");

    String loginUrl = UrlManager.loginUrl(company, username, pass);

    var result = await ApiOperations.loadx(company, username, pass, loginUrl);
    if (result.any((element) => true)) {
      return true;
    }

    return false;
  }

  temadegistir(BuildContext context) {
    Provider.of<ThemeClass>(context, listen: false).temadegistir();
  }
}
