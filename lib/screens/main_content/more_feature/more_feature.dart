import 'package:flutter/material.dart';
import 'package:sassy_mobile/widgets/custom_bottom_nav_bar.dart';
import './components/body.dart';

class MoreFeaturePage extends StatelessWidget {
  static String routeName = '/more_feature_page';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MoreFeature(),
    );
  }
}
