import 'package:flutter/material.dart';
import 'package:flutter_layout_grid/flutter_layout_grid.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/sponsors_provider.dart';
import 'package:sassy_mobile/screens/main_content/sponsors/sponsors.dart';
import 'package:sassy_mobile/widgets/custom_appbar.dart';
import 'package:sassy_mobile/widgets/custom_button.dart';
// import 'package:sassy_mobile/models/app_theme.dart';
// import 'package:sassy_mobile/main.dart';

class Sponsors extends StatefulWidget {
  const Sponsors({Key? key}) : super(key: key);

  @override
  State<Sponsors> createState() => _SponsorsState();
}

class _SponsorsState extends State<Sponsors> {
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
  List listOfSponsorLevel = [
    'Platinum Sponsor',
    'Gold Sponsor',
    'Gold Sponsor',
    'Silver Sponsor',
    'Silver Sponsor',
    'Bronze Sponsor',
    'Bronze Sponsor',
    'Bronze Sponsor',
    'Bronze Sponsor',
    'Bronze Sponsor',
    'Bronze Sponsor',
    'Bronze Sponsor',
    'Partner',
    'Partner'
  ];

  //KEEP THIS
  // @override
  // Widget build(BuildContext context) {
  //   Map<String, dynamic> mapSponsors =
  //       Provider.of<SponsorsProvider>(context).mapSponsors;

  //   return Provider.of<SponsorsProvider>(context).mapSponsors.length == 0
  //       ? SizedBox(
  //           height: 50, child: Center(child: CircularProgressIndicator()))
  //       : Container(
  //           child: Padding(
  //             padding:
  //                 const EdgeInsets.symmetric(horizontal: horizontalPadding),
  //             child: Column(
  //               mainAxisAlignment: MainAxisAlignment.start,
  //               crossAxisAlignment: CrossAxisAlignment.stretch,
  //               children: [
  //                 Container(
  //                   child: Padding(
  //                     padding: EdgeInsets.fromLTRB(0, 10, 0, 24),
  //                     child: Text(
  //                       'Sponsors',
  //                       style: Theme.of(context).textTheme.titleLarge,
  //                     ),
  //                   ),
  //                 ),
  //                 Expanded(
  //                   child: GridView.builder(
  //                       gridDelegate:
  //                           const SliverGridDelegateWithFixedCrossAxisCount(
  //                         crossAxisCount: 2,
  //                         mainAxisSpacing: 28,
  //                         crossAxisSpacing: 29,
  //                         childAspectRatio: 4 / 5,
  //                       ),
  //                       itemCount: Provider.of<SponsorsProvider>(context,
  //                               listen: false)
  //                           .mapSponsors['result']
  //                           .length,
  //                       itemBuilder: (BuildContext context, index) {
  //                         return GestureDetector(
  //                           onTap: () => dialog(
  //                               context,
  //                               mapSponsors['result'][index]['name'],
  //                               mapSponsors['result'][index]['asset_url'],
  //                               mapSponsors['result'][index]
  //                                   ['sponsor_website_url']),
  //                           child: MoreFeatureCard(
  //                               imageSource: mapSponsors['result'][index]
  //                                   ['asset_url'],
  //                               title: mapSponsors['result'][index]['name']),
  //                         );
  //                       }),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         );
  // }

  //HARD CODED
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapSponsors =
        Provider.of<SponsorsProvider>(context).mapSponsors;

    return Provider.of<SponsorsProvider>(context).mapSponsors.length == 0
        ? SizedBox(
            height: 50, child: Center(child: CircularProgressIndicator()))
        : Container(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 24),
                      child: Text(
                        'Sponsors',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ),
                  ),
                  SizedBox(height: 5),
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 28,
                          crossAxisSpacing: 29,
                          childAspectRatio: 4 / 5,
                        ),
                        itemCount: 14,
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                            onTap: () => dialog(
                                context,
                                listOfCompanyName[index],
                                listOfImage[index],
                                listOfSponsorLevel[index]),
                            child: MoreFeatureCard(
                                imageSource: listOfImage[index],
                                title: listOfCompanyName[index]),
                          );
                        }),
                  ),
                ],
              ),
            ),
          );
  }

  // KEEP THIS
  //
  // Future<dynamic> dialog(
  //     BuildContext context, String name, String assetUrl, String websiteUrl) {
  //   return showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       titlePadding: EdgeInsets.fromLTRB(28, 20, 28, 9),
  //       contentPadding: EdgeInsets.symmetric(horizontal: 28, vertical: 4),
  //       actionsPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
  //       actionsAlignment: MainAxisAlignment.spaceAround,
  //       title: Center(
  //         child: Text(name,
  //             style: Theme.of(context)
  //                 .textTheme
  //                 .bodyLarge!
  //                 .copyWith(fontSize: 20)),
  //       ),
  //       content: Container(
  //         child: Column(
  //           mainAxisSize: MainAxisSize.min,
  //           children: [
  //             Center(
  //               child: Image.network(
  //                 assetUrl,
  //                 width: MediaQuery.of(context).size.width -
  //                     2 * horizontalPadding -
  //                     2 * 29,
  //                 fit: BoxFit.contain,
  //               ),
  //             ),
  //             SizedBox(
  //               height: 10,
  //             ),
  //             Text(websiteUrl, style: Theme.of(context).textTheme.bodyMedium),
  //             SizedBox(
  //               height: 10,
  //             )
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  //FOR HARD CODED ONLY
  Future<dynamic> dialog(
      BuildContext context, String name, String assetUrl, String sponsorLevel) {
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
            // Align(
            //   alignment: Alignment.topRight,
            //   child: GestureDetector(
            //     onTap: () {
            //       Navigator.pop(context);
            //     },
            //     child: SvgPicture.asset(
            //       'assets/icons/close.svg',
            //     ),
            //   ),
            // ),
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
            Center(
              child: Text(name,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 20)),
            ),
            Center(
              child: Text(sponsorLevel,
                  style: Theme.of(context).textTheme.bodyMedium),
            ),
          ],
        ),
        content: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image.asset(
                  assetUrl,
                  width: MediaQuery.of(context).size.width -
                      2 * horizontalPadding -
                      2 * 29,
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
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
    return Container(
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Center(
          child: Image.asset(
            imageSource,
            // width: MediaQuery.of(context).size.width -
            //     2 * horizontalPadding -
            //     29 -
            //     29,
            // height: 64.0,
            fit: BoxFit.scaleDown,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Text(
            title,
            style:
                Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 14),
          ),
        )
      ]),
    );
  }
}
