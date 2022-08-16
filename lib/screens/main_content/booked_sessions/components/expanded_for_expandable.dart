import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/sessions_provider.dart';
import 'package:sassy_mobile/widgets/custom_button.dart';

class ExpandedForExpandable extends StatefulWidget {
  int index;
  ExpandedForExpandable({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<ExpandedForExpandable> createState() => _ExpandedForExpandableState();
}

class _ExpandedForExpandableState extends State<ExpandedForExpandable> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 14, bottom: 10),
          child: TextButton(
            style:
                ButtonStyle(backgroundColor: MaterialStateProperty.all(blue)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text('Unregister',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: textColorWhite)),
            ),
            onPressed: () {
              dialog(context);
            },
          ),
        ),
      ],
    );
  }

  Future<dynamic> dialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        titlePadding: EdgeInsets.fromLTRB(28, 20, 28, 9),
        contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 4),
        actionsPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        actionsAlignment: MainAxisAlignment.spaceAround,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                constraints: BoxConstraints(maxHeight: 15, maxWidth: 15),
                padding: EdgeInsets.zero,
                splashRadius: 15,
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: SvgPicture.asset(
                  'assets/icons/close.svg',
                ),
              ),
            ),
            Text('Are you sure?',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(fontSize: 16)),
          ],
        ),
        content: Text(
            'If you unregister for this session, it will be removed from your bookings and you will have to book the session again if you want to attend it.',
            style: Theme.of(context).textTheme.bodyMedium),
        actions: [
          CustomButton(
              text: 'Keep Session',
              height: 34,
              width: MediaQuery.of(context).size.width / 2 - 70,
              press: () {
                Navigator.pop(context);
              }),
          CustomButton(
              text: 'Unregister',
              color: cardColor,
              textColor: tagTextColor,
              height: 34,
              width: MediaQuery.of(context).size.width / 2 - 70,
              press: () => unregister(widget.index))
        ],
      ),
    );
  }

  Future<void> unregister(int index) async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
        backgroundColor: cardColorDark,
        content: SizedBox(
          height: 25,
          child: SpinKitThreeBounce(
            size: 13,
            color: textColorWhite,
          ),
        ),
        duration: Duration(seconds: 15),
      ),
    );
    Map<String, dynamic> mapUserBookedSessions =
        Provider.of<SessionsProvider>(context, listen: false)
            .mapUserBookedSessions;
    //this package name need to be removed
    String packageName = Provider.of<SessionsProvider>(context, listen: false)
        .listOfPackageDescription[index];
    for (var i = 0; i < mapUserBookedSessions['result'].length; i++) {
      if (packageName ==
          mapUserBookedSessions['result'][i]['package_description']) {
        await Provider.of<SessionsProvider>(context, listen: false)
            .cancelPackageBooking(
                mapUserBookedSessions['result'][i]['package_id'].toString());
        break;
      }
    }
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
        backgroundColor: cardColorDark,
        content: Text(
            Provider.of<SessionsProvider>(context, listen: false)
                .mapcancelPackageBooking['message'],
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: textColorWhite)),
        duration: Duration(seconds: 2),
      ),
    );
    Provider.of<SessionsProvider>(context, listen: false)
        .initialForGetUserBookedSessions();
    Provider.of<SessionsProvider>(context, listen: false)
        .getUserBookedSessions();

    Navigator.pop(context);
  }
}
