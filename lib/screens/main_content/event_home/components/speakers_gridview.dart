// import 'package:flutter/material.dart';
// import 'package:sassy_mobile/app_theme.dart';
// import 'package:sassy_mobile/screens/main_content/event_home/components/layout_grid_child.dart';
// import 'package:sassy_mobile/screens/main_content/sponsors/components/body.dart';
// import 'package:flutter_layout_grid/flutter_layout_grid.dart';

// class SpeakersGridView extends StatelessWidget {
//   const SpeakersGridView({
//     Key? key,
//     required this.items,
//   }) : super(key: key);

//   final List<SpeakerHomeData> items;

//   @override
//   Widget build(BuildContext context) {
//     return LayoutGrid(
//       // set some flexible track sizes based on the crossAxisCount
//       columnSizes: [1.fr, 1.fr, 1.fr],
//       // set all the row sizes to auto (self-sizing height)
//       rowSizes: const [auto, auto],
//       rowGap: 25, // equivalent to mainAxisSpacing
//       columnGap: 20, // equivalent to crossAxisSpacing

//       children: [
//         for (var i = 0; i < items.length; i++) LayoutGridChild(data: items[i]),
//       ],
//     );
//   }
// }

// class SpeakerHomeData {
//   final String imageSource;
//   final String title;

//   SpeakerHomeData({required this.imageSource, required this.title});

//   static var allSpeakersHomeData = [
//     SpeakerHomeData(imageSource: 'map', title: 'Troy Boltonde'),
//     SpeakerHomeData(imageSource: 'attendees1', title: 'Gabriella Mont'),
//     SpeakerHomeData(imageSource: 'attendees1', title: 'Dula Peep'),
//     SpeakerHomeData(imageSource: 'attendees1', title: 'Troy Boltonde'),
//     SpeakerHomeData(imageSource: 'attendees1', title: 'Gabriella Mont'),
//     SpeakerHomeData(imageSource: 'attendees1', title: 'Dula Peep'),
//   ];
// }

import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/speakers_provider.dart';
import 'package:sassy_mobile/providers/sponsors_provider.dart';

class SpeakersGridView extends StatefulWidget {
  const SpeakersGridView({Key? key}) : super(key: key);

  @override
  State<SpeakersGridView> createState() => _SpeakersGridViewState();
}

class _SpeakersGridViewState extends State<SpeakersGridView> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapSpeakers =
        Provider.of<SpeakersProvider>(context, listen: false).mapSpeakers;

    return Provider.of<SponsorsProvider>(context).mapSponsors.length == 0
        ? SizedBox(
            height: 50, child: Center(child: CircularProgressIndicator()))
        : GridView.builder(
            padding: EdgeInsets.zero,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 28,
              crossAxisSpacing: 29,
            ),
            itemCount: mapSpeakers['result'].length < 7
                ? mapSpeakers['result'].length
                : 6,
            itemBuilder: (BuildContext context, index) {
              return MoreFeatureCard(
                  imageSource: mapSpeakers['result'][index]
                      ['profile_picture_url'],
                  title: mapSpeakers['result'][index]['name']);
            });
  }
}

class MoreFeatureCard extends StatelessWidget {
  final String imageSource;
  final String title;
  const MoreFeatureCard({
    Key? key,
    required this.imageSource,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Center(
          child: ClipOval(
        child: Image.network(
          imageSource,
          width: 64.0,
          height: 64.0,
          fit: BoxFit.contain,
        ),
      )),
      SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
        ),
      )
    ]);
  }
}
