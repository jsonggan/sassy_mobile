import 'package:flutter/material.dart';
import 'components/body.dart';

class EventHomePage extends StatelessWidget {
  static String routeName = '/event_home_page';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: EventHome(),
    );
  }
}
