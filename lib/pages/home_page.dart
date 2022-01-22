import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:tema_calismasi/pages/stoklar_page.dart';
import 'package:tema_calismasi/widgets/custom_elevated_button.dart';

import 'generic_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Ana Menü",
      ),
      // ignore: avoid_unnecessary_containers
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                      buttonText: "Stoklar",
                      gelenIcon: Icons.book,
                      customOnPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StoklarPage()));
                      },
                      gelenRenk: Colors.blue,
                      gelenheight: 20.h,
                      gelenwidth: 48.w,
                      gelenfontsize: 10.sp),
                  CustomElevatedButton(
                      buttonText: "Cariler",
                      gelenIcon: Icons.people,
                      customOnPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StoklarPage()));
                      },
                      gelenRenk: Colors.red,
                      gelenheight: 20.h,
                      gelenwidth: 48.w,
                      gelenfontsize: 10.sp),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomElevatedButton(
                      buttonText: "Satış",
                      gelenIcon: Icons.book,
                      customOnPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StoklarPage()));
                      },
                      gelenRenk: Colors.blue,
                      gelenheight: 20.h,
                      gelenwidth: 48.w,
                      gelenfontsize: 10.sp),
                  CustomElevatedButton(
                      buttonText: "Alış",
                      gelenIcon: Icons.people,
                      customOnPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const StoklarPage()));
                      },
                      gelenRenk: Colors.red,
                      gelenheight: 20.h,
                      gelenwidth: 48.w,
                      gelenfontsize: 10.sp),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
