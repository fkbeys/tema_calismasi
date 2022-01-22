import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:tema_calismasi/managers/custom_dialogs.dart';
import 'package:tema_calismasi/managers/login_manager.dart';
import 'package:tema_calismasi/managers/permission_manager.dart';
import 'package:tema_calismasi/managers/shared_preferences_manager.dart';
import 'package:tema_calismasi/pages/home_page.dart';
import 'package:tema_calismasi/theme/theme_class.dart';
import 'package:tema_calismasi/view_model/login_vm.dart';
import 'package:tema_calismasi/widgets/custom_elevated_button.dart';
import 'package:tema_calismasi/widgets/custom_label.dart';
import 'package:tema_calismasi/widgets/custom_text_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginVM gelenLoginVm = LoginVM("x", "y", "z", true);

  @override
  Widget build(BuildContext context) {
    requestLocationPermission();
    requestCameraPermission();

    var t = AppLocalizations.of(context)!;
    var _companyController = TextEditingController();
    var _usernameConroller = TextEditingController();
    var _passwordController = TextEditingController();

    void kullaniciBilgileriOku() async {
      gelenLoginVm = await SharedPrefs().readLoginPrefs();
      _companyController.text = gelenLoginVm.company;
      _usernameConroller.text = gelenLoginVm.username;
      _passwordController.text = gelenLoginVm.password;
    }

    kullaniciBilgileriOku();
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
                gelenObsecureText: false,
                gelenfontsize: 15.sp,
              ),
              CustomTextFieldWidget(
                  customhintText: "Kullanici Adi",
                  gelenIcon: Icons.people,
                  gelenController: _usernameConroller,
                  gelenObsecureText: false,
                  gelenfontsize: 15.sp),
              CustomTextFieldWidget(
                customhintText: "Sifre",
                gelenIcon: Icons.password,
                gelenController: _passwordController,
                gelenObsecureText: true,
                gelenfontsize: 15.sp,
              ),
              SizedBox(
                width: 100.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CustomElevatedButton(
                            gelenheight: 10.h,
                            gelenwidth: 30.h,
                            gelenfontsize: 10.sp,
                            buttonText: 'Giriş Yap',
                            gelenIcon: Icons.login,
                            gelenRenk: Colors.redAccent,
                            customOnPressed: () async {
                              // await dialogum.show();
                              await Msg(context).show("Giriş Yapılıyor...");

                              bool result = await loginManager(
                                  _companyController.text,
                                  _usernameConroller.text,
                                  _passwordController.text);

                              if (result) {
                                await Msg(context).hide();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const HomePage()));
                              } else {
                                await Msg(context).hide();
                                await Msg(context).show("Giriş başarısız.");
                              }
                              await Msg(context).hide();
                            }),
                      ],
                    ),
                    CustomElevatedButton(
                        gelenheight: 10.h,
                        gelenwidth: 20.h,
                        gelenfontsize: 10.sp,
                        buttonText: "Demo",
                        gelenIcon: Icons.vpn_key,
                        customOnPressed: () {
                          _companyController.text = "DEMO";
                          _usernameConroller.text = "DEMO";
                          _passwordController.text = "DEMO";
                        },
                        gelenRenk: Colors.blue.shade600),
                    CustomElevatedButton(
                      gelenheight: 10.h,
                      gelenwidth: 7.h,
                      gelenfontsize: 10.sp,
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

  temadegistir(BuildContext context) {
    Provider.of<GenericProviderMethods>(context, listen: false).temadegistir();
  }
}
