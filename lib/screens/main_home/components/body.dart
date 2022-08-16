import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/providers/event_provider.dart';
import 'package:sassy_mobile/providers/map_provider.dart';
import 'package:sassy_mobile/providers/sessions_provider.dart';
import 'package:sassy_mobile/providers/speakers_provider.dart';
import 'package:sassy_mobile/providers/sponsors_provider.dart';
import 'package:sassy_mobile/providers/user_provider.dart';
import 'package:sassy_mobile/screens/main_content/agenda/components/body.dart';
import 'package:sassy_mobile/screens/main_content/book_session/book_session.dart';
import 'package:sassy_mobile/screens/main_content/event_home/event_home.dart';
import 'package:sassy_mobile/screens/main_content/map/map.dart';
import 'package:sassy_mobile/screens/main_content/event_home/components/body.dart';
import 'package:sassy_mobile/screens/main_content/more_feature/components/body.dart';
import 'package:sassy_mobile/screens/main_content/profile/profile.dart';
import 'package:sassy_mobile/screens/main_content/sessions/components/body.dart';
import 'package:sassy_mobile/screens/main_content/sessions/sessions.dart';
import 'package:sassy_mobile/screens/sign_in/sign_in.dart';

class MainHome extends StatefulWidget {
  const MainHome({Key? key}) : super(key: key);

  @override
  MainHomeState createState() => MainHomeState();
}

class MainHomeState extends State<MainHome> {
  int currentIndex = 0;

  final screens = [
    EventHomePage(),
    Agenda(),
    MapPage(),
    ProfilePage(),
    MoreFeature(),
  ];

  @override
  Widget build(BuildContext context) {
    return !Provider.of<EventProvider>(context).getEventIsDone
        ? SizedBox(
            height: 50,
            child: Center(
                child: SpinKitThreeBounce(
              size: 13,
              color: textColorWhite,
            )))
        : !Provider.of<UserProvider>(context).showParticularsIsDoneForFirstTime
            ? SizedBox(
                height: 50,
                child: Center(
                    child: SpinKitThreeBounce(
                  size: 13,
                  color: textColorWhite,
                )))
            : Provider.of<EventProvider>(context).errorMsg == 'Unauthenticated.'
                ? SignInPage()
                : Provider.of<UserProvider>(context)
                                .mapShowParticulars['results']
                            ['dietary_restrictions'] ==
                        null
                    ? SignInPage()
                    : ScaffoldMessenger(
                        child: Scaffold(
                          backgroundColor:
                              !Provider.of<SpeakersProvider>(context)
                                      .getSpeakersIsDoneForFirstTime
                                  ? backGroundColorBlack
                                  : backGroundColor,
                          body: !Provider.of<SpeakersProvider>(context,
                                      listen: false)
                                  .getSpeakersIsDoneForFirstTime
                              ? SizedBox(
                                  height: MediaQuery.of(context).size.height,
                                  child: Center(
                                      child: SpinKitThreeBounce(
                                    size: 13,
                                    color: textColorWhite,
                                  )))
                              : currentIndex == 0 || currentIndex == 3
                                  ? screens[currentIndex]
                                  : SafeArea(child: screens[currentIndex]),

                          // backgroundColor: backGroundColor,
                          bottomNavigationBar: !Provider.of<SpeakersProvider>(
                                      context,
                                      listen: false)
                                  .getSpeakersIsDoneForFirstTime
                              ? null
                              : bottomAppBar(),
                        ),
                      );
  }

  //control bottom app bar
  BottomNavigationBar bottomAppBar() {
    return BottomNavigationBar(
      onTap: (index) => setState(() {
        if (index == 2) {
          Provider.of<MapProvider>(context, listen: false).getMap();
        }
        if (index == 3) {
          Provider.of<UserProvider>(context, listen: false).initial();
          Provider.of<UserProvider>(context, listen: false).showParticulars();
        }
        currentIndex = index;
      }),
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      backgroundColor: bottomNavBarColor,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/home.svg'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/list.svg'),
          label: 'List',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/location.svg'),
          label: 'Map',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/profile.svg'),
          label: 'Sessions',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/more.svg'),
          label: 'More',
        ),
      ],
    );
  }
}
