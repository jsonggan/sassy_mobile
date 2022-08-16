import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/sessions_provider.dart';
import 'expanded_for_expandable.dart';
import 'header_for_expandable.dart';

class BookedSessions extends StatelessWidget {
  BookedSessions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapUserBookedSessions =
        Provider.of<SessionsProvider>(context, listen: false)
            .mapUserBookedSessions;

    return !Provider.of<SessionsProvider>(context).getUserBookedSessionsIsDone
        ? SizedBox(
            height: 50, child: Center(child: CircularProgressIndicator()))
        : mapUserBookedSessions['message'] !=
                'Sucessfully retrieved your booked session(s)!'
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 24),
                      child: Text('Booked Sessions',
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                    Text(mapUserBookedSessions['message']),
                  ],
                ),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 24),
                      child: Text('Booked Sessions',
                          style: Theme.of(context).textTheme.titleLarge),
                    ),
                    expandableList(
                        Provider.of<SessionsProvider>(context, listen: false)
                            .itemCount),
                  ],
                ),
              );
  }

  ExpandableTheme expandableList(int itemCount) {
    return ExpandableTheme(
      data: const ExpandableThemeData(
        hasIcon: false,
        useInkWell: true,
      ),
      child: Expanded(
        child: ListView.builder(
          itemCount: itemCount,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            return ExpandableNotifier(
                child: Card(
              margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
              color: cardColor,
              child: ScrollOnExpand(
                scrollOnExpand: true,
                scrollOnCollapse: false,
                child: ExpandablePanel(
                  theme: const ExpandableThemeData(
                    headerAlignment: ExpandablePanelHeaderAlignment.center,
                    tapBodyToCollapse: true,
                    tapBodyToExpand: true,
                  ),
                  header: HeaderForExpandable(index: index),
                  collapsed: Container(),
                  expanded: ExpandedForExpandable(index: index),
                ),
              ),
            ));
          },
        ),
      ),
    );
  }
}
