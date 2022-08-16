import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/agenda_provider.dart';
import 'package:sassy_mobile/providers/event_provider.dart';
import 'package:sassy_mobile/providers/sessions_provider.dart';
import 'package:sassy_mobile/screens/main_content/agenda/components/date_button.dart';
import 'package:sassy_mobile/screens/main_content/agenda/components/track_button.dart';
import 'package:sassy_mobile/screens/main_content/book_session/book_session.dart';
import 'package:expandable/expandable.dart';
import 'package:sassy_mobile/screens/main_content/sessions/sessions.dart';

class Agenda extends StatefulWidget {
  const Agenda({Key? key}) : super(key: key);

  @override
  State createState() {
    return _AgendaState();
  }
}

class _AgendaState extends State<Agenda> {
  @override
  Widget build(BuildContext context) {
    List<DateTime> getDaysInBeteween(DateTime startDate, DateTime endDate) {
      List<DateTime> days = [];
      for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
        days.add(DateTime(
            startDate.year,
            startDate.month,
            // In Dart you can set more than. 30 days, DateTime will do the trick
            startDate.day + i));
      }
      return days;
    }

    Map<String, dynamic> mapEvent =
        Provider.of<EventProvider>(context).mapEvent;
    List listOfDates = getDaysInBeteween(
        DateTime.parse(mapEvent['result']['datetime_start']),
        DateTime.parse(mapEvent['result']['datetime_end']));
    print(listOfDates);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 18),
            child:
                Text('Agenda', style: Theme.of(context).textTheme.titleLarge),
          ),
          Container(
            height: 50,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 18),
              child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => SizedBox(width: 0),
                  itemCount: listOfDates.length,
                  itemBuilder: (context, index) {
                    return DateButton(listOfDates: listOfDates, index: index);
                  }),
            ),
          ),
          Text(
            'Track',
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 18),
            child: Row(
              children: [
                TrackButton(
                  track: '1',
                ),
                TrackButton(
                  track: '2',
                ),
                TrackButton(
                  track: '3',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18),
            child: Text(
              Provider.of<AgendaProvider>(context).date.isEmpty ||
                      Provider.of<AgendaProvider>(context).track.isEmpty
                  ? ''
                  : Provider.of<AgendaProvider>(context).date +
                      ', Track ' +
                      Provider.of<AgendaProvider>(context).track,
            ),
          ),

          // using consumer
          Consumer<AgendaProvider>(builder: ((context, value, child) {
            return value.mapAgenda.length == 0
                ? Text('Please select date and track')
                : value.mapAgenda['message'] !=
                        'Successfully retrieved list of agenda!'
                    ? Text(value.mapAgenda['message'].toString())
                    : expandableList(
                        value.itemCount,
                        value.listOfCategory,
                        value.listOfSessionName,
                        value.listOfSessionLocation,
                        value.listOfSessionDescription,
                        value.listOfTimeStart,
                        value.listOfSesisonSpeaker,
                        value.listOfSpeakerDescription,
                        value.listOfIsPackageBookable,
                        value.listOfSessionId,
                        value.listOfPackageId,
                        value.listOfTimeStartForBody,
                        value.listOfTimeEndForBody);
          }))
        ],
      ),
    );
  }

  ExpandableTheme expandableList(
      itemCount,
      listOfCategory,
      listOfSessionName,
      listOfSessionLocation,
      listOfSessionDescription,
      listOfTimeStart,
      listOfSesisonSpeaker,
      listOfSpeakerDescription,
      listOfIsPackageBookable,
      listOfSessionId,
      listOfPackageId,
      listOfTimeStartForBody,
      listOfTimeEndForBody) {
    return ExpandableTheme(
      data: const ExpandableThemeData(
        tapHeaderToExpand: true,
        tapBodyToExpand: true,
        tapBodyToCollapse: true,
        hasIcon: false,
      ),
      child: Expanded(
        child: ListView.builder(
          itemCount: listOfCategory.length,
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
                    //
                    //
                    //
                    header: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 6),
                                  child: Text(listOfCategory[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                ),
                                // SizedBox(
                                //   width: 210,
                                //   child: SingleChildScrollView(
                                //     scrollDirection: Axis.horizontal,
                                //     child: Text(listOfSessionName[index],
                                //         style: Theme.of(context)
                                //             .textTheme
                                //             .bodyMedium),
                                //   ),
                                // ),

                                Text(listOfSessionName[index],
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(listOfTimeStart[index],
                                style: Theme.of(context).textTheme.bodyLarge),
                          ),
                        ],
                      ),
                    ),
                    //
                    //
                    collapsed: Container(),
                    expanded: Padding(
                      padding: const EdgeInsets.fromLTRB(14, 0, 14, 14),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          // Text(
                          //   'Name:',
                          //   style:
                          //       Theme.of(context).textTheme.bodyLarge!.copyWith(
                          //             height: 1.5,
                          //           ),
                          // ),
                          // Text(
                          //   listOfSessionName[index],
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodyMedium!
                          //       .copyWith(
                          //         height: 1.5,
                          //       ),
                          // ),
                          Text(
                            'Venue:',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      height: 1.5,
                                    ),
                          ),
                          Text(
                            listOfSessionLocation[index] + '\n',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  height: 1.5,
                                ),
                          ),
                          Text(
                            'Description:',
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      height: 1.5,
                                    ),
                          ),
                          ListView.builder(
                              itemCount: listOfSessionDescription[index].length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, idx) {
                                return Text(
                                  listOfTimeStartForBody[index][idx] +
                                      ' - ' +
                                      listOfTimeEndForBody[index][idx] +
                                      ':' +
                                      '\n'
                                          '- ' +
                                      listOfSessionDescription[index][idx] +
                                      '\n',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        height: 1.5,
                                      ),
                                );
                              }),
                          // Text(
                          //   'Speaker:',
                          //   style:
                          //       Theme.of(context).textTheme.bodyLarge!.copyWith(
                          //             height: 1.5,
                          //           ),
                          // ),
                          // Text(
                          //   listOfSesisonSpeaker[index].toString() == 'null'
                          //       ? 'None'
                          //       : listOfSesisonSpeaker[index].toString(),
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodyMedium!
                          //       .copyWith(
                          //         height: 1.5,
                          //       ),
                          // ),
                          // Text(
                          //   'Speaker Description:',
                          //   style:
                          //       Theme.of(context).textTheme.bodyLarge!.copyWith(
                          //             height: 1.5,
                          //           ),
                          // ),
                          // Text(
                          //   listOfSessionDescription[index].toString() == 'Null'
                          //       ? 'None'
                          //       : listOfSessionDescription[index].toString(),
                          //   style: Theme.of(context)
                          //       .textTheme
                          //       .bodyMedium!
                          //       .copyWith(
                          //         height: 1.5,
                          //       ),
                          // ),
                          listOfIsPackageBookable[index] == '1'
                              ? GestureDetector(
                                  onTap: () => bookSession(
                                    listOfSessionId[index],
                                    listOfSessionName[index],
                                    listOfCategory[index],
                                    listOfPackageId[index].toString(),
                                  ),
                                  child: Text('Book',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              color: blue,
                                              decoration:
                                                  TextDecoration.underline)),
                                )
                              : Container()
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> bookSession(
      List sessionId, String event, String category, String packageId) async {
    // Provider.of<AgendaProvider>(context, listen: false)
    //     .firstLastSessionId(int.parse(sessionId));
    Provider.of<SessionsProvider>(context, listen: false).initialForBookSession;
    sessionDetail(sessionId[0].toString(),
        sessionId[sessionId.length - 1].toString(), event, category);
    Provider.of<SessionsProvider>(context, listen: false)
        .setPackageId(packageId);
    Provider.of<SessionsProvider>(context, listen: false).isPackageBookable =
        '1';
  }

  Future<void> sessionDetail(String sessionId, String sessionsIdLast,
      String event, String category) async {
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
    SessionsProvider providerSessions =
        Provider.of<SessionsProvider>(context, listen: false);
    providerSessions.initialForSessionDescription();
    for (var i = 0;
        i < int.parse(sessionsIdLast) - int.parse(sessionId) + 1;
        i++) {
      int currentSessionsId = int.parse(sessionId) + i;
      await providerSessions.getSession(
          currentSessionsId.toString(), event, category);
      Map<String, dynamic> mapSession = providerSessions.mapSession;
      if (i == 0) {
        providerSessions.setStartTime(mapSession['result']['datetime_start']);
      }
      if (i == int.parse(sessionsIdLast) - int.parse(sessionId)) {
        providerSessions.setEndTime(mapSession['result']['datetime_end']);
      }
      providerSessions
          .setSessionDescription(mapSession['result']['description']);
    }

    if (providerSessions.mapSession['message'].toString() ==
        "Successfully retrieved session details!") {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      Navigator.pushNamed(context, BookSessionsPage.routeName);
    }
  }
}
