import 'package:provider/provider.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/providers/event_provider.dart';
import 'package:sassy_mobile/providers/speakers_provider.dart';
import 'package:sassy_mobile/providers/sponsors_provider.dart';
import 'package:sassy_mobile/providers/user_provider.dart';
import 'package:sassy_mobile/screens/main_content/agenda/agenda.dart';
import 'package:sassy_mobile/screens/main_content/book_session/book_session.dart';
import 'package:sassy_mobile/screens/main_content/booked_sessions/booked_sessions.dart';
import 'package:sassy_mobile/screens/main_content/edit_profile/edit_profile.dart';
import 'package:sassy_mobile/screens/main_content/profile/profile.dart';
import 'package:sassy_mobile/screens/main_content/qr_code/qr_code.dart';
import 'package:sassy_mobile/screens/main_content/speaker_profile/speaker_profile.dart';
import 'package:sassy_mobile/screens/main_content/speakers/speakers.dart';
import 'package:sassy_mobile/screens/main_content/sponsors/sponsors.dart';
import 'package:sassy_mobile/screens/register/register.dart';
import 'package:sassy_mobile/screens/main_content/event_home/event_home.dart';
import 'package:sassy_mobile/screens/main_content/crafts_ticket/crafts_ticket.dart';
import 'package:sassy_mobile/screens/main_home/main_home.dart';
import 'package:sassy_mobile/screens/main_content/map/map.dart';
import 'package:sassy_mobile/screens/main_content/more_feature/more_feature.dart';
import 'package:sassy_mobile/screens/select_event/select_event.dart';
import 'package:sassy_mobile/screens/main_content/sessions/sessions.dart';
import 'package:sassy_mobile/screens/sign_in/sign_in.dart';
import 'package:flutter/widgets.dart';
import 'package:sassy_mobile/screens/verification_code/verification_code.dart';

final Map<String, WidgetBuilder> routes = {
  SignInPage.routeName: (context) {
    final authProvider = Provider.of<AuthProvider>(context);
    if (authProvider.isAuthenticated) {
      Provider.of<SpeakersProvider>(context, listen: false).initial();
      Provider.of<EventProvider>(context, listen: false)
          .getEvent('', authProvider.eventCode);
      Provider.of<UserProvider>(context, listen: false).showParticulars();

      //sponsors for home page
      Provider.of<SponsorsProvider>(context, listen: false).getSponsors();
      // speakers for home page
      Provider.of<SpeakersProvider>(context, listen: false).getSpeakers();
      return MainHomePage();
    } else {
      return SignInPage();
    }
  },
  RegisterPage.routeName: (context) => RegisterPage(),
  VerificationCodePage.routeName: (context) => VerificationCodePage(),
  SelectEventPage.routeName: (context) => SelectEventPage(),
  EventHomePage.routeName: (context) => EventHomePage(),
  AgendaPage.routeName: (context) => AgendaPage(),
  MapPage.routeName: (context) => MapPage(),
  ProfilePage.routeName: (context) => ProfilePage(),
  EditProfilePage.routeName: (context) => EditProfilePage(),
  SessionsPage.routeName: (context) => SessionsPage(),
  MoreFeaturePage.routeName: (context) => MoreFeaturePage(),
  MainHomePage.routeName: (context) => MainHomePage(),
  BookedSessionsPage.routeName: (context) => BookedSessionsPage(),
  CraftsTicketPage.routeName: (context) => CraftsTicketPage(),
  BookSessionsPage.routeName: (context) => BookSessionsPage(),
  SpeakersPage.routeName: (context) => SpeakersPage(),
  SponsorsPage.routeName: (context) => SponsorsPage(),
  QrCodePage.routeName: (context) => QrCodePage(),
  SpeakerProfilePage.routeName: (context) => SpeakerProfilePage(),
};
