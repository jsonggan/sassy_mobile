import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/sessions_provider.dart';
import 'package:sassy_mobile/screens/main_content/book_session/book_session.dart';

class Sessions extends StatefulWidget {
  Sessions({
    Key? key,
  }) : super(key: key);

  @override
  State<Sessions> createState() => _SessionsState();
}

class _SessionsState extends State<Sessions> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapSessions =
        Provider.of<SessionsProvider>(context).mapSessions;
    return Provider.of<SessionsProvider>(context).mapSessions.length == 0
        ? SizedBox(
            height: 50, child: Center(child: CircularProgressIndicator()))
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 24),
                    child: Text(
                      'Sessions',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                      itemCount:
                          mapSessions['categories'].length, //don't change
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            mapSessions['categories'][index] == 'Lunch Break'
                                ? Container()
                                : Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 0, 14),
                                    child: Text(
                                      mapSessions['categories'][index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(fontSize: 16),
                                    ),
                                  ),
                            mapSessions['categories'][index] == 'Lunch Break'
                                ? Container()
                                : Container(
                                    height: 166,
                                    child: ListView.builder(
                                        scrollDirection: Axis.horizontal,
                                        itemCount: mapSessions['sub_categories']
                                                [mapSessions['categories']
                                                    [index]]
                                            .length, //don't change
                                        itemBuilder: ((context, idx) {
                                          return Row(
                                            children: [
                                              Container(
                                                width: 128,
                                                child: Column(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () => sessionDetail(
                                                          mapSessions['result'][mapSessions['categories'][index]]
                                                                      [mapSessions['sub_categories'][mapSessions['categories'][index]][idx]][0]
                                                                  ['session_id']
                                                              .toString(),
                                                          mapSessions['result'][mapSessions['categories'][index]]
                                                                      [mapSessions['sub_categories'][mapSessions['categories'][index]][idx]][mapSessions['result'][mapSessions['categories'][index]][mapSessions['sub_categories'][mapSessions['categories'][index]][idx]].length - 1]
                                                                  ['session_id']
                                                              .toString(),
                                                          mapSessions['sub_categories']
                                                                  [mapSessions['categories'][index]]
                                                              [idx],
                                                          mapSessions['categories']
                                                              [index],
                                                          Provider.of<SessionsProvider>(context,
                                                                  listen: false)
                                                              .listOfIsPackageBookable[index][idx]),
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image.network(
                                                          mapSessions['result'][
                                                              mapSessions['categories']
                                                                  [index]][mapSessions[
                                                                      'sub_categories']
                                                                  [
                                                                  mapSessions['categories']
                                                                      [index]]
                                                              [idx]][0]['session_banner_url'],
                                                          fit: BoxFit.fill,
                                                          height: 128.0,
                                                          width: 128.0,
                                                        ),
                                                      ),
                                                    ),
                                                    // SingleChildScrollView(
                                                    //   scrollDirection:
                                                    //       Axis.horizontal,
                                                    //   child: Text(mapSessions[
                                                    //           'sub_categories'][
                                                    //       mapSessions['categories']
                                                    //           [index]][idx]),
                                                    // ),
                                                    Expanded(
                                                      child: Text(
                                                        mapSessions[
                                                                'sub_categories']
                                                            [mapSessions[
                                                                    'categories']
                                                                [index]][idx],
                                                        maxLines: 2,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                width: 14,
                                              )
                                            ],
                                          );
                                        })),
                                  )
                          ],
                        );
                      }),
                ),
              ],
            ),
          );
  }

  Future<void> sessionDetail(String sessionId, String sessionsIdLast,
      String event, String category, String isPackageBookable) async {
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
    providerSessions.initialForBookSession();
    providerSessions.initialForSpeakerImage();
    providerSessions.setIsPackageBookable(isPackageBookable);
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
      providerSessions.setSessionSpeakerImage(mapSession['result']
                  ['speakers'] ==
              'No speaker(s) for selected session.'
          ? 'No speaker(s) for selected session.'
          : mapSession['result']['speakers'][0]['profile_picture_url']);
      print('CHECKKKKKKKKKKKKKKKKKKKK THISSSS');
      print(mapSession['result']
                  ['speakers'] ==
              'No speaker(s) for selected session.'
          ? 'No speaker(s) for selected session.'
          : mapSession['result']['speakers'][0]['profile_picture_url']);
      print(providerSessions.listOfSpeakerImage);
    }
    print('SUCCESSFULLY ADD SPEAKER IMAGE');

    if (providerSessions.mapSession['message'].toString() ==
        "Successfully retrieved session details!") {
      providerSessions.setPackageId(providerSessions.mapSessions['result']
              [Provider.of<SessionsProvider>(context, listen: false).category]
              [Provider.of<SessionsProvider>(context, listen: false).event][0]
              ['package_id']
          .toString());
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      Navigator.pushNamed(context, BookSessionsPage.routeName);
    }
  }
}
