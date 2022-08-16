import 'package:flutter/material.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/screens/sign_in/components/body.dart';

class SignInPage extends StatelessWidget {
  static String routeName = '/sign_in_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backGroundColorBlack,
      body: Container(
        child: SignInEmail(),
      ),
    );
  }
}
