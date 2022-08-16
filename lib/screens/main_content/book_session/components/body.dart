import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/sessions_provider.dart';
import 'package:sassy_mobile/screens/main_content/book_session/components/book_now_button.dart';
import 'package:sassy_mobile/widgets/custom_button.dart';
import 'bottom_sheet.dart';
import 'draggable_card.dart';

class BookSessions extends StatelessWidget {
  const BookSessions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapSession =
        Provider.of<SessionsProvider>(context, listen: false).mapSession;
    return Container(
      child: Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Image.network(
                mapSession['result']['session_banner_url'].toString(),
                fit: BoxFit.fill),
          ),
          DraggableCard(),
          Provider.of<SessionsProvider>(context, listen: false)
                      .isPackageBookable ==
                  '1'
              ? BookNowButton()
              : Container(),
        ],
      ),
    );
  }
}
