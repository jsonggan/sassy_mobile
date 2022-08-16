import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/user_provider.dart';
import 'package:sassy_mobile/screens/main_content/qr_code/qr_code.dart';
import 'package:sassy_mobile/widgets/custom_button.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapShowParticulars =
        Provider.of<UserProvider>(context, listen: false).mapShowParticulars;
    return !Provider.of<UserProvider>(context).showParticularsIsDone
        ? SizedBox(
            height: 50, child: Center(child: CircularProgressIndicator()))
        : Container(
            child: Stack(
              children: [
                DraggableScrollableSheet(
                  initialChildSize: 0.9,
                  minChildSize: 0.9,
                  maxChildSize: 1,
                  builder: (context, controller) => Container(
                    child: Card(
                      margin: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20)),
                      ),
                      child: ListView(
                        padding: EdgeInsets.only(
                            top: 20,
                            bottom: 100,
                            left: horizontalPadding,
                            right: horizontalPadding),
                        controller: controller,
                        children: <Widget>[
                          Center(
                              child: ClipOval(
                            child: Container(
                              height: 100,
                              width: 100,
                              child: Image.asset(
                                'assets/images/placeholder.png',
                                width: 100.0,
                                height: 100.0,
                                fit: BoxFit.contain,
                              ),
                            ),
                          )),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Center(
                                child: Text(
                                    mapShowParticulars['results']['title'] +
                                        '. ' +
                                        mapShowParticulars['results']
                                            ['last_name'] +
                                        ' ' +
                                        mapShowParticulars['results']
                                            ['first_name'],
                                    textAlign: TextAlign.center,
                                    style:
                                        Theme.of(context).textTheme.bodyLarge)),
                          ),
                          Center(
                              child: GreyTitle(
                                  text: mapShowParticulars['results']
                                          ['hospital_institution'] ??
                                      '')),
                          SizedBox(
                            height: 20,
                          ),
                          GreyTitle(text: 'Email Address'),
                          BlackText(
                              text: mapShowParticulars['results']['email']),
                          Divider(thickness: 1),
                          GreyTitle(text: 'Country'),
                          BlackText(
                              text: mapShowParticulars['results']['country']),
                          Divider(thickness: 1),
                          GreyTitle(text: 'Profession'),
                          BlackText(
                              text: mapShowParticulars['results']
                                  ['profession']),
                          Divider(thickness: 1),
                          GreyTitle(text: 'Dietary Restrictions'),
                          BlackText(
                              text: mapShowParticulars['results']
                                  ['dietary_restrictions']),
                          Divider(thickness: 1),
                          GreyTitle(text: 'MCR / SSN / HCN'),
                          BlackText(
                              text: mapShowParticulars['results']
                                      ['mcr_snb_number'] ??
                                  ''),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}

class GreyTitle extends StatelessWidget {
  const GreyTitle({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Text(text,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                height: 1.5,
              )),
    );
  }
}

class BlackText extends StatelessWidget {
  const BlackText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Text(text, style: Theme.of(context).textTheme.bodyLarge),
    );
  }
}
