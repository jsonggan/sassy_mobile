import 'package:flutter/material.dart';
import 'package:sassy_mobile/widgets/custom_appbar.dart';
import 'package:sassy_mobile/widgets/custom_bottom_nav_bar.dart';
import './components/body.dart';

class QrCodePage extends StatelessWidget {
  static String routeName = '/qr_code_page';
  const QrCodePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(),
      body: Container(
        child: QrCode(),
      ),
    );
  }
}
