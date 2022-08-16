import 'package:flutter/material.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/screens/main_home/main_home.dart';
import 'package:sassy_mobile/widgets/custom_button.dart';

class InputData extends StatefulWidget {
  const InputData({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  State<InputData> createState() => _InputDataState();
}

class _InputDataState extends State<InputData> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: <Widget>[
          CustomText(text: 'Salutation'),
          // DropDown(items: ['Dr', 'Mr', 'Mrs', 'Ms', 'Mdm'], text: 'Salutation'),
          CustomText(text: 'First Name'),
          // TextInputField(type: 'First Name'),
          // CustomText(text: 'Last Name'),
          // TextInputField(type: 'Last Name'),
          // CustomText(text: 'Hospital / Clinic'),
          // TextInputField(type: 'Hospital / Clinic'),
          // CustomText(text: 'MCR / SSN / HCN'),
          // TextInputField(type: 'MCR / SSN / HCN'),
          // CustomText(text: 'Email Address'),
          // TextInputField(type: 'Email Address'),
          // CustomText(text: 'Country'),
          // TextInputField(type: 'Country'),
          // CustomText(text: 'Profession'),
          // TextInputField(type: 'Profession'),
          // CustomText(text: 'Dietery Restrictions'),
          // TextInputField(type: 'Dietery Restrictions'),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 15),
            child: CustomButton(
              color: yellowCardColor,
              text: "Create Profile",
              press: () {
                if (widget._formKey.currentState!.validate()) {
                  widget._formKey.currentState!.save();
                  // if all are valid then go to success screen
                  Navigator.pushNamed(context, MainHomePage.routeName);
                }
              },
            ),
          ),
        ],
      ),
    );
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
