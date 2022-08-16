import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_country.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_profession.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_salutation.dart';
import 'package:sassy_mobile/providers/user_provider.dart';
import 'package:sassy_mobile/screens/sign_in/sign_in.dart';
import 'package:sassy_mobile/widgets/dropdown.dart';
import 'package:sassy_mobile/widgets/custom_button.dart';
import 'package:sassy_mobile/widgets/text_input_field.dart';

class EditProfile extends StatefulWidget {
  String title;
  String first_name;
  String last_name;

  String? hospital_institution;
  String? mcr_snb_number;
  String country;
  String profession;
  String dietary_restrictions;
  EditProfile({
    Key? key,
    required this.title,
    required this.first_name,
    required this.last_name,
    required this.hospital_institution,
    required this.mcr_snb_number,
    required this.country,
    required this.profession,
    required this.dietary_restrictions,
  }) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final countryController = TextEditingController();
  final categoryController = TextEditingController();
  final hospitalInstitutionController = TextEditingController();
  final mcrSnbNumberController = TextEditingController();
  final dietaryRestrictionsController = TextEditingController();

  String errorMassage = '';

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapShowParticulars =
        Provider.of<UserProvider>(context, listen: false).mapShowParticulars;
    final errorMsg = '';
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Edit Profile',
                  style: Theme.of(context).textTheme.titleLarge),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    CustomText(text: 'Salutation'),
                    DropDown(
                      items: ['Prof', 'A\/Prof', 'Dr', 'Mr', 'Mrs', 'Ms'],
                      text: 'Salutation',
                      isSelect: Provider.of<SelectSalutation>(context).isSelect,
                      fieldText:
                          Provider.of<SelectSalutation>(context).salutation,
                    ),
                    CustomText(text: 'First Name'),
                    TextInputField(
                      textColor: textColorGrey,
                      color: cardColorLight,
                      type: 'First Name',
                      controller: firstNameController,
                      validator: (value) {
                        return null;
                      },
                    ),
                    CustomText(text: 'Last Name'),
                    TextInputField(
                      textColor: textColorGrey,
                      color: cardColorLight,
                      type: 'Last Name',
                      controller: lastNameController,
                      validator: (value) {
                        return null;
                      },
                    ),
                    CustomText(text: 'Profession'),
                    DropDown(
                      items: [
                        'Nurse',
                        'Radiographer',
                        'Physician',
                        'Radiologist',
                        'Resident',
                        'Others'
                      ],
                      text: 'Profession',
                      isSelect: Provider.of<SelectProfession>(context).isSelect,
                      fieldText:
                          Provider.of<SelectProfession>(context).profession,
                    ),
                    CustomText(text: 'Hospital Institution'),
                    TextInputField(
                      textColor: textColorGrey,
                      color: cardColorLight,
                      type: 'Hospital Institution',
                      controller: hospitalInstitutionController,
                      validator: (value) {
                        return null;
                      },
                    ),
                    CustomText(text: 'MCR / SSN / HCN'),
                    TextInputField(
                      textColor: textColorGrey,
                      color: cardColorLight,
                      type: 'MCR / SSN / HCN',
                      controller: mcrSnbNumberController,
                      validator: (value) {
                        return null;
                      },
                    ),
                    CustomText(text: 'Country'),
                    DropDown(
                      items: country,
                      text: 'Country',
                      isSelect: Provider.of<SelectCountry>(context).isSelect,
                      fieldText: Provider.of<SelectCountry>(context).country,
                    ),
                    CustomText(text: 'Dietery Restrictions'),
                    TextInputField(
                      textColor: textColorGrey,
                      color: cardColorLight,
                      type: 'Dietery Restrictions',
                      controller: dietaryRestrictionsController,
                      validator: (value) {
                        return null;
                      },
                    ),
                    Text(errorMsg),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 15),
                      child: CustomButton(
                        color: blue,
                        text: "Complete",
                        press: () => submit(),
                        // press: () => Navigator.pushNamed(
                        //     context, MainHomePage.routeName),
                      ),
                    ),
                  ],
                )),
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> submit() async {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
        backgroundColor: cardColorDark,
        content: SizedBox(
          height: 25,
          child: SpinKitThreeBounce(
            size: 13,
            color: textColorWhite,
          ),
        ),
        duration: Duration(seconds: 15),
      ),
    );

    final UserProvider provider =
        Provider.of<UserProvider>(context, listen: false);

    Map<String, dynamic> mapShowParticulars =
        Provider.of<UserProvider>(context, listen: false).mapShowParticulars;

    print(Provider.of<SelectProfession>(context, listen: false).profession);
    Provider.of<SelectProfession>(context, listen: false).profession == ''
        ? print('it is empty')
        : print('it is not empty');
    try {
      print('pass through submit function');

      await provider.updateParticulars(
          Provider.of<SelectSalutation>(context, listen: false)
                  .salutation
                  .isEmpty
              ? mapShowParticulars['results']['title']
              : Provider.of<SelectSalutation>(context, listen: false)
                  .salutation,
          firstNameController.text.isEmpty
              ? mapShowParticulars['results']['first_name']
              : firstNameController.text,
          lastNameController.text.isEmpty
              ? mapShowParticulars['results']['last_name']
              : lastNameController.text,
          hospitalInstitutionController.text.isEmpty
              ? mapShowParticulars['results']['hospital_instituition'] ?? ''
              : hospitalInstitutionController.text,
          mcrSnbNumberController.text,
          Provider.of<SelectCountry>(context, listen: false).country.isEmpty
              ? mapShowParticulars['results']['country']
              : Provider.of<SelectCountry>(context, listen: false).country,
          Provider.of<SelectProfession>(context, listen: false)
                  .profession
                  .isEmpty
              ? mapShowParticulars['results']['profession']
              : Provider.of<SelectProfession>(context, listen: false)
                  .profession,
          dietaryRestrictionsController.text.isEmpty
              ? mapShowParticulars['results']['dietary_restrictions']
              : dietaryRestrictionsController.text);

      print('pass through submit function2');
    } catch (Exception) {
      // errorMassage = Exception.toString().replaceAll('Exception: ', '');
      print('Have error in submit function');
      print(Exception);
    }
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    Provider.of<UserProvider>(context, listen: false).initial();
    Provider.of<UserProvider>(context, listen: false).showParticulars();

    ScaffoldMessenger.of(context)
        .showSnackBar(
          SnackBar(
            shape: StadiumBorder(),
            behavior: SnackBarBehavior.floating,
            backgroundColor: cardColorDark,
            content: Text(
                Provider.of<UserProvider>(context, listen: false)
                    .mapUpdateParticulars['message'],
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: textColorWhite)),
            duration: Duration(seconds: 1),
          ),
        )
        .closed
        .then((SnackBarClosedReason reason) {
      Navigator.of(context).pop();
    });
  }
}

class CustomText extends StatelessWidget {
  String text;
  CustomText({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Text(text, style: Theme.of(context).textTheme.bodyMedium),
    );
  }
}
