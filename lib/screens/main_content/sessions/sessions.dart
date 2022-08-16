import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/providers/sessions_provider.dart';
import 'package:sassy_mobile/screens/main_content/booked_sessions/booked_sessions.dart';
import 'package:sassy_mobile/screens/main_content/sessions/components/body.dart';
import 'package:flutter_svg/svg.dart';

class SessionsPage extends StatelessWidget {
  static String routeName = '/sessions_page';
  const SessionsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBarSessions(),
      body: Container(
        child: Sessions(),
      ),
    );
  }
}

class CustomTopAppBarSessions extends StatefulWidget
    implements PreferredSizeWidget {
  const CustomTopAppBarSessions({
    Key? key,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  @override
  State<CustomTopAppBarSessions> createState() =>
      _CustomTopAppBarSessionsState();
}

class _CustomTopAppBarSessionsState extends State<CustomTopAppBarSessions> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/button_back.svg'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      actions: <Widget>[
        IconButton(
          icon: SvgPicture.asset('assets/icons/sessions_black.svg'),
          onPressed: () => bookedSession(),
        )
      ],
    );
  }

  Future<void> bookedSession() async {
    {
      Provider.of<SessionsProvider>(context, listen: false)
          .initialForGetUserBookedSessions();
      await Provider.of<SessionsProvider>(context, listen: false)
          .getUserBookedSessions();
      Navigator.pushNamed(context, BookedSessionsPage.routeName);
      // do something
    }
  }
}
