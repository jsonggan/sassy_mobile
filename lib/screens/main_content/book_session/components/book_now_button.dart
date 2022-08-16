import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/sessions_provider.dart';
import 'package:sassy_mobile/screens/main_content/book_session/components/bottom_sheet.dart';
import 'package:sassy_mobile/widgets/custom_button.dart';

class BookNowButton extends StatelessWidget {
  const BookNowButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapSession =
        Provider.of<SessionsProvider>(context, listen: false).mapSession;
    return Positioned(
      top: MediaQuery.of(context).size.height - 66,
      width: MediaQuery.of(context).size.width - 2 * horizontalPadding,
      left: horizontalPadding,
      child: Center(
        child: CustomButton(
          text: "Book Now \$" + mapSession['result']['price'].toString(),
          press: () {
            showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                context: context,
                builder: (context) => CustomBottomSheet());
          },
        ),
      ),
    );
  }
}
