import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/sessions_provider.dart';
import 'package:sassy_mobile/widgets/custom_button.dart';
import 'package:sassy_mobile/widgets/custom_card.dart';
import 'card_with_info.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapSession =
        Provider.of<SessionsProvider>(context, listen: false).mapSession;
    Map<String, dynamic> mapSessions =
        Provider.of<SessionsProvider>(context, listen: false).mapSessions;
    return Container(
        height: MediaQuery.of(context).copyWith().size.height * 0.4,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(flex: 1),
                Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.82),
                  child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: SvgPicture.asset('assets/icons/close.svg')),
                ),
                Spacer(flex: 1),
                CardWithInfo(
                    title: Provider.of<SessionsProvider>(context).event,
                    imageUrl:
                        Provider.of<SessionsProvider>(context).bookingImageUrl,
                    availableTicket:
                        mapSession['result']['remaining_capacity'].toString()),
                Spacer(flex: 1),
                Text(
                  'Date:',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16),
                ),
                // Spacer(flex: 2),
                Text(mapSession['result']['datetime_start'].split('T')[0],
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontSize: 16)),

                Spacer(flex: 4),
                CustomButton(
                  text: 'Book Now \$0',
                  press: showSnackBar,
                  // press: () {},
                ),
                Spacer(flex: 2),
              ],
            ),
          ),
        ));
  }

  Future<void> showSnackBar() async {
    Map<String, dynamic> mapSessions =
        Provider.of<SessionsProvider>(context, listen: false).mapSessions;

    await Provider.of<SessionsProvider>(context, listen: false).bookPackage(
        Provider.of<SessionsProvider>(context, listen: false).packageId);
    Map<String, dynamic> mapBookPackage =
        Provider.of<SessionsProvider>(context, listen: false).mapBookPackage;
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
        backgroundColor: cardColorDark,
        content: Text(mapBookPackage['message'],
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: textColorWhite)),
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.pop(context);
  }
}
