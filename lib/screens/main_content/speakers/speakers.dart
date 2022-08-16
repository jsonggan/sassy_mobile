import 'package:flutter/material.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/screens/main_content/speakers/components/body.dart';
import 'package:sassy_mobile/screens/sign_in/components/body.dart';
import 'package:sassy_mobile/widgets/custom_appbar.dart';

class SpeakersPage extends StatelessWidget {
  static String routeName = '/speaker_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(),
      body: Container(
        child: Speakers(),
      ),
    );
  }
}
