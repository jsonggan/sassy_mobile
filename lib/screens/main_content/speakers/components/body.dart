import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:expandable/expandable.dart';
import 'package:sassy_mobile/providers/speakers_provider.dart';
import 'package:sassy_mobile/screens/main_content/speaker_profile/speaker_profile.dart';
// import 'package:sassy_mobile/widgets/expandable.dart';
import 'header_for_expandable.dart';
import 'expanded_for_expandable.dart';

class Speakers extends StatefulWidget {
  @override
  State createState() {
    return _SpeakersState();
  }
}

// class _SpeakersState extends State<Speakers> {
//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic> mapSpeakers =
//         Provider.of<SpeakersProvider>(context, listen: false).mapSpeakers;

//     return !Provider.of<SpeakersProvider>(
//       context,
//     ).getSpeakersIsDone
//         ? SizedBox(
//             height: MediaQuery.of(context).size.height,
//             child: Center(
//                 child: SpinKitThreeBounce(
//               size: 13,
//               color: textColorGrey,
//             )))
//         : Container(
//             child: Padding(
//               padding:
//                   const EdgeInsets.symmetric(horizontal: horizontalPadding),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: <Widget>[
//                   Padding(
//                     padding: EdgeInsets.fromLTRB(0, 10, 0, 24),
//                     child: Text('Speakers',
//                         style: Theme.of(context).textTheme.titleLarge),
//                   ),
//                   expandableList(mapSpeakers['result'].length)
//                 ],
//               ),
//             ),
//           );
//   }

//   ExpandableTheme expandableList(int itemCount) {
//     return ExpandableTheme(
//       data: const ExpandableThemeData(
//         hasIcon: false,
//         useInkWell: true,
//       ),
//       child: Expanded(
//         child: ListView.builder(
//           itemCount: itemCount,
//           scrollDirection: Axis.vertical,
//           itemBuilder: (BuildContext context, int index) {
//             return ExpandableNotifier(
//               child: Card(
//                 margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(6),
//                 ),
//                 color: cardColor,
//                 child: ScrollOnExpand(
//                   scrollOnExpand: true,
//                   scrollOnCollapse: false,
//                   child: ExpandablePanel(
//                     theme: const ExpandableThemeData(
//                       headerAlignment: ExpandablePanelHeaderAlignment.center,
//                       tapBodyToCollapse: true,
//                       tapBodyToExpand: true,
//                     ),
//                     //
//                     //
//                     //
//                     header: Padding(
//                       padding: const EdgeInsets.all(18.0),
//                       child: HeaderForExpandable(
//                         index: index,
//                       ),
//                     ),
//                     //
//                     //
//                     collapsed: Container(),
//                     expanded: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 18.0),
//                       child: ExpandedForExpandable(
//                         index: index,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

class _SpeakersState extends State<Speakers> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapSpeakers =
        Provider.of<SpeakersProvider>(context, listen: false).mapSpeakers;

    return !Provider.of<SpeakersProvider>(
      context,
    ).getSpeakersIsDone
        ? SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: SpinKitThreeBounce(
              size: 13,
              color: textColorGrey,
            )))
        : Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 24),
                    child: Text('Speakers',
                        style: Theme.of(context).textTheme.titleLarge),
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: 90,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                Provider.of<SpeakersProvider>(context,
                                        listen: false)
                                    .initialForSpeaker();
                                Provider.of<SpeakersProvider>(context,
                                        listen: false)
                                    .getSpeaker(mapSpeakers['result'][index]
                                            ['id']
                                        .toString());

                                Navigator.pushNamed(
                                    context, SpeakerProfilePage.routeName);
                              },
                              child: Card(
                                margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                color: cardColor,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  child: Row(
                                    children: [
                                      Center(
                                          child: ClipOval(
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          child: Image.network(
                                            mapSpeakers['result'][index]
                                                ['profile_picture_url'],
                                            width: 50.0,
                                            height: 50.0,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      )),
                                      Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              21, 0, 0, 0),
                                          //speakers name and headshot
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                        0, 0, 0, 6),
                                                child: ScrollableTitle(
                                                    title: mapSpeakers['result']
                                                        [index]['name']),
                                              ),

                                              //for headshots
                                              ScrollableText(
                                                title: mapSpeakers['result']
                                                    [index]['job_title'],
                                              ),

                                              ScrollableText(
                                                title: mapSpeakers['result']
                                                                [index]
                                                            ['company_name'] ==
                                                        'N.A.'
                                                    ? ''
                                                    : mapSpeakers['result']
                                                        [index]['company_name'],
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }))
                ],
              ),
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
                    //
                    //
                    //
                    header: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: HeaderForExpandable(
                        index: index,
                      ),
                    ),
                    //
                    //
                    collapsed: Container(),
                    expanded: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: ExpandedForExpandable(
                        index: index,
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
}
