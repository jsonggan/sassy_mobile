import 'package:flutter/material.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/agenda_provider.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/providers/event_provider.dart';
import 'package:sassy_mobile/providers/map_provider.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_event_name.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_profession.dart';
import 'package:sassy_mobile/providers/sessions_provider.dart';
import 'package:sassy_mobile/providers/speakers_provider.dart';
import 'package:sassy_mobile/providers/sponsors_provider.dart';
import 'package:sassy_mobile/providers/user_provider.dart';
import 'package:sassy_mobile/providers/world_time_provider.dart';
import 'package:sassy_mobile/screens/main_content/agenda/agenda.dart';
import 'package:sassy_mobile/screens/main_content/booked_sessions/booked_sessions.dart';
import 'package:sassy_mobile/screens/main_content/event_home/event_home.dart';
import 'package:sassy_mobile/screens/main_content/sessions/sessions.dart';
import 'package:sassy_mobile/screens/main_content/sponsors/sponsors.dart';
import 'package:sassy_mobile/screens/main_home/main_home.dart';
import 'package:sassy_mobile/screens/register/components/body.dart';
import 'package:sassy_mobile/screens/register/register.dart';
import 'package:sassy_mobile/screens/select_event/select_event.dart';
import 'package:sassy_mobile/screens/sign_in/sign_in.dart';
import 'package:sassy_mobile/routes.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/screens/verification_code/verification_code.dart';
import 'package:shared_preferences/shared_preferences.dart';

// void main() => runApp(const MyApp());

SharedPreferences? sharedPrefs;

Future<void> main() async {
  // make it async

  WidgetsFlutterBinding.ensureInitialized(); // mandatory when awaiting on main

  sharedPrefs = await SharedPreferences.getInstance(); // get the prefs
  // // do whatever you need to do with it

  runApp(MyApp()); // rest of your app code
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future init() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(builder: (context, authProvider, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider<AgendaProvider>(
              create: (context) => AgendaProvider(authProvider),
            ),
            ChangeNotifierProvider<EventProvider>(
              create: (context) => EventProvider(authProvider),
            ),
            ChangeNotifierProvider<SelectEventName>(
              create: (context) => SelectEventName(),
            ),
            ChangeNotifierProvider<MapProvider>(
              create: (context) => MapProvider(authProvider),
            ),
            ChangeNotifierProvider<SponsorsProvider>(
              create: (context) => SponsorsProvider(authProvider),
            ),
            ChangeNotifierProvider<SpeakersProvider>(
              create: (context) => SpeakersProvider(authProvider),
            ),
            ChangeNotifierProvider<SessionsProvider>(
              create: (context) => SessionsProvider(authProvider),
            ),
            ChangeNotifierProvider<SelectProfession>(
              create: (context) => SelectProfession(),
            ),
            ChangeNotifierProvider<UserProvider>(
              create: (context) => UserProvider(authProvider),
            ),
            ChangeNotifierProvider<WorldTimeProvider>(
              create: (context) => WorldTimeProvider(authProvider),
            ),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: TextTheme(
                titleLarge: titleTextStyle,
                titleMedium: countdownTextStyle,
                bodySmall: body2TextStyle,
                bodyMedium: tagTextStyle,
                bodyLarge: body1TextStyle,
              ),
              scaffoldBackgroundColor: backGroundColor,
            ),
            home: SignInPage(),
            initialRoute: SignInPage.routeName,
            routes: routes,
          ),
        );
      }),
    );
  }
}
