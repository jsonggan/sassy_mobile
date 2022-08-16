import 'package:flutter/material.dart';
import 'package:sassy_mobile/widgets/custom_bottom_nav_bar.dart';
import './components/body.dart';

class MapPage extends StatelessWidget {
  static String routeName = '/map_page';
  const MapPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Map(),
      ),
    );
  }
}
