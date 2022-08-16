import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sassy_mobile/widgets/custom_appbar.dart';
import 'package:sassy_mobile/widgets/custom_bottom_nav_bar.dart';
import './components/body.dart';

class BookSessionsPage extends StatelessWidget {
  static String routeName = '/book_sessions_page';
  const BookSessionsPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomTopAppBar(svgFile: 'assets/icons/button_back_white.svg'),
      body: Container(
        child: BookSessions(),
      ),
    );
  }
}
