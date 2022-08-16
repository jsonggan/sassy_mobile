import 'package:flutter/material.dart';
import 'package:sassy_mobile/widgets/custom_appbar.dart';
import 'components/body.dart';

class SponsorsPage extends StatelessWidget {
  static String routeName = '/sponsors_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(),
      body: Sponsors(),
    );
  }
}
