import 'package:flutter/material.dart';
import './components/body.dart';

class MainHomePage extends StatelessWidget {
  static String routeName = '/main_page';
  const MainHomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainHome();
  }
}
