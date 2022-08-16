import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/providers/agenda_provider.dart';
import './components/body.dart';
import 'package:sassy_mobile/widgets/custom_bottom_nav_bar.dart';

class AgendaPage extends StatelessWidget {
  static String routeName = '/agenda_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Agenda());
  }
}
