import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/providers/event_provider.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_event_name.dart';
import 'package:sassy_mobile/providers/speakers_provider.dart';
import 'package:sassy_mobile/providers/sponsors_provider.dart';
import 'package:sassy_mobile/providers/user_provider.dart';
import 'package:sassy_mobile/screens/main_home/main_home.dart';
import 'package:sassy_mobile/screens/register/register.dart';
import 'package:sassy_mobile/widgets/custom_button.dart';
import 'package:sassy_mobile/widgets/dropdown.dart';
import 'package:sassy_mobile/widgets/snack_bar.dart';
import 'package:sassy_mobile/widgets/text_input_field.dart';

class SelectEvent extends StatefulWidget {
  const SelectEvent({Key? key}) : super(key: key);

  @override
  State<SelectEvent> createState() => _SelectEventState();
}

class _SelectEventState extends State<SelectEvent> {
  final eventCodeController = TextEditingController();
  bool _isPress = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(flex: 6),
            Text(
              'Welcome!',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: textColorWhite),
            ),
            const Spacer(flex: 3),
            Text('Please select an event or enter a unique event code',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: textColorGreyLight)),
            const Spacer(flex: 3),
            DropDown(
              items: Provider.of<EventProvider>(context, listen: false)
                      .listOfEventName
                      .isEmpty
                  ? ['None']
                  : Provider.of<EventProvider>(context, listen: false)
                      .listOfEventName,
              text: 'Event Name',
              isSelect:
                  Provider.of<SelectEventName>(context, listen: false).isSelect,
              fieldText: Provider.of<SelectEventName>(context).eventName,
              color: cardColorDark,
              textColor: textColorGreyLight,
              textColorItem: textColorWhite,
            ),
            const Spacer(flex: 2),
            Center(
              child: Text(
                'OR',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Color(0xFF666666)),
              ),
            ),
            const Spacer(flex: 2),
            TextInputField(
              type: 'Event Code',
              controller: eventCodeController,
              validator: (value) {
                return null;
              },
            ),
            const Spacer(flex: 25),
            CustomButton(
                color: yellowCardColor,
                text: "Continue",
                press: !_isPress
                    ? () {
                        setState(() {
                          _isPress = true;
                        });
                        Timer(const Duration(seconds: 1), () {
                          setState(() {
                            _isPress = false;
                          });
                        });
                        next();
                      }
                    : null),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  Future<void> next() async {
    CustomSnackBar.showLoading(context);
    EventProvider providerEvent =
        Provider.of<EventProvider>(context, listen: false);

    Provider.of<AuthProvider>(context, listen: false);
    await providerEvent.getEvent(
        Provider.of<SelectEventName>(context, listen: false).eventName,
        eventCodeController.text);

    String errorMsg = providerEvent.errorMsg;
    if (errorMsg == 'Successfully retrieved the event!') {
      await Provider.of<UserProvider>(context, listen: false).showParticulars();

      Map<String, dynamic> mapShowParticulars =
          Provider.of<UserProvider>(context, listen: false).mapShowParticulars;

      String eventCodeTemp = '';

      //set correct event code
      for (var i = 0; i < providerEvent.listOfEventName.length; i++) {
        if (providerEvent.mapUserRegisteredEvents['result'][i]['event_name'] ==
            Provider.of<SelectEventName>(context, listen: false).eventName) {
          Provider.of<AuthProvider>(context, listen: false).setEventCode(
              providerEvent.mapUserRegisteredEvents['result'][i]['event_code']);
          eventCodeTemp =
              providerEvent.mapUserRegisteredEvents['result'][i]['event_code'];
          print(
              providerEvent.mapUserRegisteredEvents['result'][i]['event_code']);
          print('STEP 3 NOTTTTTTTTT CORRECT');
        }
      }
      if (Provider.of<SelectEventName>(context, listen: false)
          .eventName!
          .isEmpty) {
        await Provider.of<AuthProvider>(context, listen: false)
            .setEventCode(eventCodeController.text);
        eventCodeTemp = eventCodeController.text;
        print('STEP 3 CORRECT');
      }

      //check if diatery_restrictions is null to determine the need of going through register page
      if (mapShowParticulars['results']['dietary_restrictions'] == null) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        Navigator.pushNamed(context, RegisterPage.routeName);
      } else {
        //get data for home page
        await Provider.of<SponsorsProvider>(context, listen: false)
            .getSponsors();
        await Provider.of<SpeakersProvider>(context, listen: false)
            .getSpeakers();

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        Navigator.pushNamed(context, MainHomePage.routeName);
      }
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      CustomSnackBar.showMessage(context, errorMsg);
    }
  }
}
