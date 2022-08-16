import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/providers/event_provider.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_event_name.dart';
import 'package:sassy_mobile/providers/speakers_provider.dart';
import 'package:sassy_mobile/providers/sponsors_provider.dart';
import 'package:sassy_mobile/screens/main_content/event_home/components/speakers_gridview.dart';
import 'package:sassy_mobile/screens/main_content/event_home/components/sponsors_gridview.dart';
import 'package:sassy_mobile/screens/main_content/speakers/speakers.dart';
import 'package:sassy_mobile/screens/main_content/sponsors/sponsors.dart';
import 'countdown.dart';

class EventHome extends StatefulWidget {
  const EventHome({Key? key}) : super(key: key);

  @override
  State<EventHome> createState() => _EventHomeState();
}

class _EventHomeState extends State<EventHome> {
  @override
  Widget build(BuildContext context) {
    // Future<void> didChangeDependencies() async {
    //   AuthProvider providerAuth =
    //       Provider.of<AuthProvider>(context, listen: false);
    //   await Provider.of<EventProvider>(context, listen: false)
    //       .getEvent('', providerAuth.eventCode);
    //   //sponsors for home page
    //   await Provider.of<SponsorsProvider>(context, listen: false).getSponsors();
    //   //speakers for home page
    //   await Provider.of<SpeakersProvider>(context, listen: false).getSpeakers();
    //   super.didChangeDependencies();
    // }

    Map<String, dynamic> mapEvent =
        Provider.of<EventProvider>(context, listen: false).mapEvent;
    return !Provider.of<SpeakersProvider>(context, listen: false)
            .getSpeakersIsDone
        ? SafeArea(
            child: SizedBox(
                height: 50, child: Center(child: CircularProgressIndicator())),
          )
        : Stack(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.network(
                  mapEvent['result']['event_banner_urls'][0],
                  fit: BoxFit.contain,
                ),
              ),
              DraggableScrollableSheet(
                initialChildSize: 0.70,
                minChildSize: 0.70,
                maxChildSize: 1,
                builder: (context, controller) => Container(
                  child: Card(
                    margin: EdgeInsets.zero,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                    child: ListView(
                      physics: BouncingScrollPhysics(),
                      padding: EdgeInsets.only(
                          top: 35,
                          left: horizontalPadding,
                          right: horizontalPadding),
                      controller: controller,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 25, vertical: 18),
                          child: Image.network(
                            mapEvent['result']['event_logo_url'],
                            fit: BoxFit.fill,
                            // height: 128.0,
                            // width: 128.0,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 33),
                          child: Center(
                              child: Text(mapEvent['result']['description'],
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                        height: 1.5,
                                      ))),
                        ),
                        Countdown(),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 30, bottom: 23),
                        //   child: Text('Key Speakers',
                        //       style: Theme.of(context).textTheme.titleLarge),
                        // ),
                        // HomePageGestureDetector(
                        //     routeName: SpeakersPage.routeName,
                        //     child: SpeakersGridView()),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 23),
                          child: Text('Key Sponsors',
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        HomePageGestureDetector(
                            routeName: SponsorsPage.routeName,
                            child: SponsorsGridView()),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 23),
                          child: Text('Organised By',
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        SizedBox(
                          height: 300,
                          child: Row(
                            children: [
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      horizontalPadding,
                                  child: Image.asset('assets/images/SRS.png')),
                              SizedBox(
                                  width: MediaQuery.of(context).size.width / 2 -
                                      horizontalPadding,
                                  child: Image.asset('assets/images/CRS.png')),
                            ],
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 23),
                          child: Text('Held In',
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        Image.asset('assets/images/SG.png'),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 23),
                          child: Text('Supported By',
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        Image.asset('assets/images/SECB.png'),
                        Padding(
                          padding: const EdgeInsets.only(top: 30, bottom: 23),
                          child: Text('Official Airline',
                              style: Theme.of(context).textTheme.titleLarge),
                        ),
                        Image.asset('assets/images/SQ.png'),
                        SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}

class HomePageGestureDetector extends StatefulWidget {
  final Widget child;
  final String routeName;
  const HomePageGestureDetector({
    Key? key,
    required this.child,
    required this.routeName,
  }) : super(key: key);

  @override
  State<HomePageGestureDetector> createState() =>
      _HomePageGestureDetectorState();
}

class _HomePageGestureDetectorState extends State<HomePageGestureDetector> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => next(),
      child: Container(
        color: backGroundColor,
        width: MediaQuery.of(context).size.width,
        child: widget.child,
      ),
    );
  }

  Future<void> next() async {
    if (widget.routeName == SpeakersPage.routeName) {
      // Provider.of<SpeakersProvider>(context, listen: false)
      //     .setSpeakersToActualPage();
      // Provider.of<SpeakersProvider>(context, listen: false).initial();
      // Provider.of<SpeakersProvider>(context, listen: false).getSpeakers();
      Navigator.pushNamed(context, SpeakersPage.routeName);
    }
    if (widget.routeName == SponsorsPage.routeName) {
      // Provider.of<SponsorsProvider>(context, listen: false).getSponsors();
      Navigator.pushNamed(context, SponsorsPage.routeName);
    }
  }
}
