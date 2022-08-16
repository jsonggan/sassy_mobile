import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:sassy_mobile/main.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/screens/verification_code/components/body.dart';
import 'package:sassy_mobile/widgets/custom_appbar.dart';

class VerificationCodePage extends StatelessWidget {
  const VerificationCodePage({Key? key}) : super(key: key);
  static String routeName = '/verification_code';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColorBlack,
      appBar: CustomTopAppBarWhiteIcon(),
      body: Container(
        child: VerificationCode(),
      ),
    );
  }
}
