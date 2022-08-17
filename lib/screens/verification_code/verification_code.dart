import 'package:flutter/material.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/screens/verification_code/components/body.dart';
import 'package:sassy_mobile/widgets/custom_appbar.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({Key? key}) : super(key: key);
  static String routeName = '/verification_code';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: backGroundColorBlack,
      appBar: CustomTopAppBarWhiteIcon(),
      body: VerificationCode(),
    );
  }
}
