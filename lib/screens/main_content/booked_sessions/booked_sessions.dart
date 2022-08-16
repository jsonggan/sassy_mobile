import 'package:flutter/material.dart';
import 'package:sassy_mobile/widgets/custom_appbar.dart';
import './components/body.dart';

class BookedSessionsPage extends StatelessWidget {
  static String routeName = '/booked_sessions_page';
  const BookedSessionsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(),
      body: Container(
        child: BookedSessions(),
      ),
    );
  }
}
