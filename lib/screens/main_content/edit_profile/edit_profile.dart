import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_country.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_gender.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_salutation.dart';
import 'package:sassy_mobile/providers/user_provider.dart';
import 'package:sassy_mobile/screens/main_content/edit_profile/components/body.dart';
import 'package:sassy_mobile/widgets/custom_appbar.dart';

class EditProfilePage extends StatelessWidget {
  static String routeName = '/edit_profile_page';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapShowParticulars =
        Provider.of<UserProvider>(context, listen: false).mapShowParticulars;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SelectSalutation(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => SelectGender(),
        // ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SelectCountry(),
        ),
      ],
      builder: (context, child) {
        return Scaffold(
          appBar: CustomTopAppBar(),
          body: Container(
            child: EditProfile(
              title: mapShowParticulars['results']['title'],
              first_name: mapShowParticulars['results']['first_name'],
              last_name: mapShowParticulars['results']['last_name'],
              hospital_institution: mapShowParticulars['results']
                  ['hospital_institution'],
              mcr_snb_number: mapShowParticulars['results']['mcr_snb_number'],
              country: mapShowParticulars['results']['country'],
              profession: mapShowParticulars['results']['profession'],
              dietary_restrictions: mapShowParticulars['results']
                  ['dietary_restrictions'],
            ),
          ),
        );
      },
    );
  }
}
