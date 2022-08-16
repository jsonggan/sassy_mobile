import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/sessions_provider.dart';
import 'package:sassy_mobile/providers/speakers_provider.dart';
import 'package:sassy_mobile/providers/sponsors_provider.dart';
import 'package:sassy_mobile/providers/world_time_provider.dart';
import 'package:sassy_mobile/screens/main_content/sessions/sessions.dart';
import 'package:sassy_mobile/screens/main_content/speakers/components/body.dart';
import 'package:sassy_mobile/screens/main_content/speakers/speakers.dart';
import 'package:sassy_mobile/screens/main_content/sponsors/components/body.dart';
import 'package:sassy_mobile/screens/main_content/sponsors/sponsors.dart';
// import 'package:sassy_mobile/models/app_theme.dart';
// import 'package:sassy_mobile/main.dart';

class MoreFeature extends StatelessWidget {
  const MoreFeature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 24),
              child: Text(
                'Utilities',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
                crossAxisCount: 3,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                children: <Widget>[
                  MoreFeatureCard(
                    title: 'Sessions',
                    svgSource: 'assets/icons/sessions_blue.svg',
                    widget: SessionsPage(),
                    onTap: () {
                      Provider.of<SessionsProvider>(context, listen: false)
                          .getSessions();
                      Navigator.pushNamed(context, SessionsPage.routeName);
                    },
                  ),
                  MoreFeatureCard(
                    title: 'Speakers',
                    svgSource: 'assets/icons/speakers_blue.svg',
                    widget: SpeakersPage(),
                    onTap: () {
                      // Provider.of<SpeakersProvider>(context, listen: false)
                      //     .setSpeakersToActualPage();
                      // Provider.of<SpeakersProvider>(context, listen: false)
                      //     .initial();
                      // Provider.of<SpeakersProvider>(context, listen: false)
                      //     .getSpeakers();
                      Navigator.pushNamed(context, SpeakersPage.routeName);
                    },
                  ),
                  MoreFeatureCard(
                    title: 'Sponsors',
                    svgSource: 'assets/icons/sponsors_blue.svg',
                    widget: SponsorsPage(),
                    onTap: () {
                      // Provider.of<SponsorsProvider>(context, listen: false)
                      //     .getSponsors();
                      Navigator.pushNamed(context, SponsorsPage.routeName);
                    },
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}

class MoreFeatureCard extends StatelessWidget {
  final String svgSource;
  final String title;
  final Widget widget;
  final VoidCallback onTap;
  MoreFeatureCard({
    Key? key,
    required this.svgSource,
    required this.title,
    required this.widget,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(6)),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Spacer(flex: 5),
          SvgPicture.asset(svgSource),
          Spacer(flex: 1),
          Text(
            title,
            style:
                Theme.of(context).textTheme.bodySmall!.copyWith(fontSize: 12),
          ),
          Spacer(flex: 5),
        ]),
      ),
    );
  }
}
