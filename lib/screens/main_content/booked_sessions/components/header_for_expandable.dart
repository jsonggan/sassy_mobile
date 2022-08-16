import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/sessions_provider.dart';

class HeaderForExpandable extends StatelessWidget {
  int index;
  HeaderForExpandable({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapUserBookedSessions =
        Provider.of<SessionsProvider>(context, listen: false)
            .mapUserBookedSessions;
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                Provider.of<SessionsProvider>(context, listen: false)
                    .listOfPackageUrl[index],
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                      child: Text(
                          Provider.of<SessionsProvider>(context, listen: false)
                              .listOfPackageDescription[index],
                          style: Theme.of(context).textTheme.bodyLarge)),
                  // Text(
                  //     '1x Ticket, ' +
                  //         Provider.of<SessionsProvider>(context, listen: false)
                  //             .listOfPackageDate[index],
                  //     style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                      '1x Ticket, ' +
                          DateFormat("yyyy-MM-ddTHH:mm:ssZ")
                              .parse(
                                  Provider.of<SessionsProvider>(context,
                                          listen: false)
                                      .listOfPackageDate[index],
                                  true)
                              .toLocal()
                              .toString()
                              .split(' ')[0] +
                          ', ' +
                          DateFormat("yyyy-MM-ddTHH:mm:ssZ")
                              .parse(
                                  Provider.of<SessionsProvider>(context,
                                          listen: false)
                                      .listOfPackageDate[index],
                                  true)
                              .toLocal()
                              .toString()
                              .split(' ')[1]
                              .split('.')[0]
                              .split(':')[0] +
                          ':' +
                          DateFormat("yyyy-MM-ddTHH:mm:ssZ")
                              .parse(
                                  Provider.of<SessionsProvider>(context,
                                          listen: false)
                                      .listOfPackageDate[index],
                                  true)
                              .toLocal()
                              .toString()
                              .split(' ')[1]
                              .split('.')[0]
                              .split(':')[1],
                      style: Theme.of(context).textTheme.bodyMedium),
                  Text(
                    Provider.of<SessionsProvider>(context, listen: false)
                        .listOfPackageLocation[index],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ScrollableText extends StatelessWidget {
  const ScrollableText({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width -
          2 * horizontalPadding -
          50 -
          2 * 18 -
          25,
      child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}

class ScrollableTitle extends StatelessWidget {
  const ScrollableTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width -
          2 * horizontalPadding -
          50 -
          2 * 18 -
          25,
      child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
