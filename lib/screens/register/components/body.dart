import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_country.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_profession.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_salutation.dart';
import 'package:sassy_mobile/providers/speakers_provider.dart';
import 'package:sassy_mobile/providers/sponsors_provider.dart';
import 'package:sassy_mobile/providers/user_provider.dart';
import 'package:sassy_mobile/screens/main_home/main_home.dart';
import 'package:sassy_mobile/widgets/custom_card.dart';
import 'package:sassy_mobile/widgets/dropdown.dart';
import 'package:sassy_mobile/widgets/custom_button.dart';
import 'package:sassy_mobile/widgets/snack_bar.dart';
import 'input_data.dart';
import 'package:sassy_mobile/widgets/text_input_field.dart';
import 'package:image/image.dart' as Img;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();

  final firstNameController = TextEditingController();
  final middleNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final emailController = TextEditingController();
  final confirmEmailController = TextEditingController();
  final countryController = TextEditingController();
  final categoryController = TextEditingController();
  final hospitalInstitutionController = TextEditingController();
  final mcrSnbNumberController = TextEditingController();
  final dietaryRestrictionsController = TextEditingController();

  String errorMassage = '';

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    final errorMsg = '';
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Registration',
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
                      items: ['Prof', 'A/Prof', 'Dr', 'Mr', 'Mrs', 'Ms'],
                      text: 'Salutation',
                      isSelect: Provider.of<SelectSalutation>(context).isSelect,
                      fieldText:
                          Provider.of<SelectSalutation>(context).salutation,
                    ),
                    Provider.of<SelectSalutation>(context, listen: false)
                                    .boolInitialState ==
                                false &&
                            Provider.of<SelectSalutation>(context,
                                        listen: false)
                                    .boolShowErrorMsg ==
                                true
                        ? Text(
                            Provider.of<SelectSalutation>(context,
                                    listen: false)
                                .errorMsg,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.red))
                        : Container(),
                    CustomText(text: 'First Name'),
                    TextInputField(
                      textColor: textColorGrey,
                      color: cardColorLight,
                      type: 'First Name',
                      controller: firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input first name';
                        }
                      },
                    ),

                    CustomText(text: 'Last Name'),
                    TextInputField(
                      textColor: textColorGrey,
                      color: cardColorLight,
                      type: 'Last Name',
                      controller: lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please input last name';
                        }
                      },
                    ),
                    CustomText(text: 'Email'),
                    CustomCard(
                        color: cardColorLight,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 18, horizontal: 12),
                          child: Text(authProvider.email,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: textColorGrey)),
                        )),
                    // Consumer<AuthProvider>(builder: ((context, value, child) {
                    //   return Text(value.email,
                    //       style: Theme.of(context)
                    //           .textTheme
                    //           .bodyLarge!
                    //           .copyWith(color: textColorGrey));
                    // })),

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
                    Provider.of<SelectProfession>(context, listen: false)
                                    .boolInitialState ==
                                false &&
                            Provider.of<SelectProfession>(context,
                                        listen: false)
                                    .boolShowErrorMsg ==
                                true
                        ? Text(
                            Provider.of<SelectProfession>(context,
                                    listen: false)
                                .errorMsg,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.red),
                          )
                        : Container(),

                    CustomText(text: 'Hospital Institution'),
                    TextInputField(
                      textColor: textColorGrey,
                      color: cardColorLight,
                      type: 'Hospital Institution',
                      controller: hospitalInstitutionController,
                      validator: (value) {},
                    ),
                    CustomText(text: 'MCR / SSN / HCN'),
                    TextInputField(
                      textColor: textColorGrey,
                      color: cardColorLight,
                      type: 'MCR / SSN / HCN',
                      controller: mcrSnbNumberController,
                      validator: (value) {},
                    ),
                    CustomText(text: 'Country'),
                    DropDown(
                      items: country,
                      text: 'Country',
                      isSelect: Provider.of<SelectCountry>(context).isSelect,
                      fieldText: Provider.of<SelectCountry>(context).country,
                    ),
                    Provider.of<SelectCountry>(context, listen: false)
                                    .boolInitialState ==
                                false &&
                            Provider.of<SelectCountry>(context, listen: false)
                                    .boolShowErrorMsg ==
                                true
                        ? Text(
                            Provider.of<SelectCountry>(context, listen: false)
                                .errorMsg,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(color: Colors.red))
                        : Container(),
                    CustomText(text: 'Dietery Restrictions'),
                    TextInputField(
                      textColor: textColorGrey,
                      color: cardColorLight,
                      type: 'Dietery Restrictions',
                      controller: dietaryRestrictionsController,
                      validator: (value) {},
                    ),
                    // CustomText(text: 'Profile Picture'),
                    // TextButton(
                    //     onPressed: () =>
                    //         Provider.of<SelectPicture>(context, listen: false)
                    //             .pickImage(),
                    //     child: Text('choose picture')),
                    // Container(
                    //   child: Provider.of<SelectPicture>(context).pickedFile !=
                    //           null
                    //       ? Image.file(File(Provider.of<SelectPicture>(context)
                    //           .pickedFile!
                    //           .path))
                    //       : Container(),
                    // ),
                    Text(
                      Provider.of<UserProvider>(context).emailErrorMsg,
                      style: TextStyle(color: Colors.red),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 15),
                      child: CustomButton(
                        color: blue,
                        text: "Complete Profile",
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
    final UserProvider provider =
        Provider.of<UserProvider>(context, listen: false);
    final isValidForm = _formKey.currentState!.validate();
    Provider.of<SelectCountry>(context, listen: false).updateState();
    Provider.of<SelectProfession>(context, listen: false).updateState();
    Provider.of<SelectSalutation>(context, listen: false).updateState();
    if (isValidForm) {
      if (Provider.of<SelectSalutation>(context, listen: false)
                  .boolShowErrorMsg ==
              false ||
          Provider.of<SelectCountry>(context, listen: false).boolShowErrorMsg ==
              false ||
          Provider.of<SelectProfession>(context, listen: false)
                  .boolShowErrorMsg ==
              false) {
        CustomSnackBar.showLoading(context);
        print('pass through submit function');

        await provider.register(
            Provider.of<SelectSalutation>(context, listen: false).salutation,
            firstNameController.text,
            lastNameController.text,
            Provider.of<AuthProvider>(context, listen: false).email,
            hospitalInstitutionController.text,
            mcrSnbNumberController.text,
            Provider.of<SelectCountry>(context, listen: false).country,
            Provider.of<SelectProfession>(context, listen: false).profession,
            dietaryRestrictionsController.text.isEmpty ||
                    dietaryRestrictionsController.text == null
                ? 'None'
                : dietaryRestrictionsController.text);

        if (provider.mapRegister['message'].toString() ==
            'You have successfully registered for this event!') {
          await Provider.of<UserProvider>(context, listen: false)
              .showParticulars();
          await Provider.of<SponsorsProvider>(context, listen: false)
              .getSponsors();
          //speakers for home page
          await Provider.of<SpeakersProvider>(context, listen: false)
              .getSpeakers();

          Navigator.pushNamed(context, MainHomePage.routeName);
        }
        if (provider.mapRegister['message'].toString() !=
            'You have successfully registered for this event!') {
          if (provider.mapRegister['message']['email'] != null) {
            provider.emailError(provider.mapRegister['message']['email'][0]);
          }
        }
      }
    }
  }

  // Future<File?> saveImageToDisk(String path, Directory directory) async {
  //   try {
  //     String path =
  //         Provider.of<SelectPicture>(context, listen: false).pickedFile!.path;
  //     File tempFile = File(path);
  //     Img.Image? image = Img.decodeImage(tempFile.readAsBytesSync());
  //     String imgType = path.split('.').last;

  //     if (imgType == 'jpg' || imgType == 'jpeg') {
  //       tempFile.writeAsBytesSync(Img.encodeJpg(image!));
  //     } else {
  //       tempFile.writeAsBytesSync(Img.encodePng(image!));
  //     }
  //     return tempFile;
  //   } catch (e) {
  //     return null;
  //   }
  // }
}
