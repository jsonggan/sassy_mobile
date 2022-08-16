import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/sponsors_provider.dart';

// class SponsorsGridView extends StatefulWidget {
//   const SponsorsGridView({Key? key}) : super(key: key);

//   @override
//   State<SponsorsGridView> createState() => _SponsorsGridViewState();
// }

// class _SponsorsGridViewState extends State<SponsorsGridView> {
//   @override
//   Widget build(BuildContext context) {
//     Map<String, dynamic> mapSponsors =
//         Provider.of<SponsorsProvider>(context).mapSponsors;

//     return Provider.of<SponsorsProvider>(context).mapSponsors.length == 0
//         ? SizedBox(
//             height: 50, child: Center(child: CircularProgressIndicator()))
//         : GridView.builder(
//             padding: EdgeInsets.zero,
//             physics: NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               mainAxisSpacing: 28,
//               crossAxisSpacing: 29,
//             ),
//             itemCount: Provider.of<SponsorsProvider>(context, listen: false)
//                         .mapSponsors['result']
//                         .length <
//                     7
//                 ? Provider.of<SponsorsProvider>(context, listen: false)
//                     .mapSponsors['result']
//                     .length
//                 : 6,
//             itemBuilder: (BuildContext context, index) {
//               return MoreFeatureCard(
//                   imageSource: mapSponsors['result'][index]['asset_url'],
//                   title: mapSponsors['result'][index]['name']);
//             });
//   }
// }

// class MoreFeatureCard extends StatelessWidget {
//   final String imageSource;
//   final String title;
//   const MoreFeatureCard({
//     Key? key,
//     required this.imageSource,
//     required this.title,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
//       Center(
//           child: ClipOval(
//         child: Image.network(
//           imageSource,
//           width: 64.0,
//           height: 64.0,
//           fit: BoxFit.contain,
//         ),
//       )),
//       SingleChildScrollView(
//         physics: NeverScrollableScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         child: Text(
//           title,
//           style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
//         ),
//       )
//     ]);
//   }
// }

//HARD CODED
class SponsorsGridView extends StatefulWidget {
  const SponsorsGridView({Key? key}) : super(key: key);

  @override
  State<SponsorsGridView> createState() => _SponsorsGridViewState();
}

class _SponsorsGridViewState extends State<SponsorsGridView> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapSponsors =
        Provider.of<SponsorsProvider>(context).mapSponsors;
    List listOfImage = [
      'assets/images/Lunit.png',
      'assets/images/Canon.png',
      'assets/images/Siemens-Healthineers.png',
      'assets/images/BD.png',
      'assets/images/Terumo.png',
      'assets/images/Astrazeneca.png',
      'assets/images/Bayer.png',
      'assets/images/Boston-Scientific.png',
      'assets/images/Cordis.png',
      'assets/images/GE.png',
      'assets/images/Mdetronic.png',
      'assets/images/Philips.png',
      'assets/images/Carestream.png',
      'assets/images/Penumbra.png',
    ];
    List listOfCompanyName = [
      'Lunit',
      'Canon',
      'Siemens-Healthineers',
      'BD',
      'Terumo',
      'Astrazeneca',
      'Bayer',
      'Boston-Scientific',
      'Cordis',
      'GE',
      'Metronic',
      'Philips',
      'Carestream',
      'Penumbra',
    ];

    return GridView.builder(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 4 / 5,
          crossAxisCount: 2,
          mainAxisSpacing: 28,
          crossAxisSpacing: 29,
        ),
        itemCount: 14,
        itemBuilder: (BuildContext context, index) {
          return MoreFeatureCard(
              imageSource: listOfImage[index], title: listOfCompanyName[index]);
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
        child: Image.asset(
          imageSource,
          fit: BoxFit.scaleDown,
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
