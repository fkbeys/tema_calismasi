import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'generic_bar.dart';

class StoklarPage extends StatelessWidget {
  const StoklarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: "Stoklar",
      ),
    );
  }
}
