import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/screens/verification_code/verification_code.dart';
import 'package:sassy_mobile/widgets/custom_button.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sassy_mobile/widgets/text_input_field.dart';

class SignInEmail extends StatefulWidget {
  const SignInEmail({Key? key}) : super(key: key);

  @override
  State<SignInEmail> createState() => _SignInEmailState();
}

class _SignInEmailState extends State<SignInEmail> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  bool _isPress = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(flex: 8),
              Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width / 2.5,
                      child: Image.asset('assets/images/enm_events.png'))),
              const Spacer(flex: 4),
              TextInputField(
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      !EmailValidator.validate(value)) {
                    return 'Invalid email';
                  }
                  return null;
                },
                type: 'Email',
                controller: emailController,
              ),
              const Spacer(flex: 1),
              CustomButton(
                color: yellowCardColor,
                text: "Next",
                press: !_isPress
                    ? () {
                        setState(() {
                          _isPress = true;
                        });
                        Timer(Duration(seconds: 1), () {
                          setState(() {
                            _isPress = false;
                          });
                        });
                        next();
                      }
                    : null,
              ),
              const Spacer(
                flex: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> next() async {
    final isValidForm = _formKey.currentState!.validate();
    if (isValidForm) {
      //loading snack bar
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
      //
      final AuthProvider provider =
          Provider.of<AuthProvider>(context, listen: false);

      await provider.loginStep1(emailController.text);
      print(provider.msgLogin1);

      //hide snack bar
      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      //message snack bar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape: StadiumBorder(),
          behavior: SnackBarBehavior.floating,
          backgroundColor: cardColorDark,
          content: Text(
              Provider.of<AuthProvider>(context, listen: false).msgLogin1,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: textColorWhite)),
          duration: Duration(seconds: 2),
        ),
      );
      //

      provider.msgLogin1 == 'Your 2FA has been sent to your email address.'
          ? Navigator.pushReplacementNamed(
              context, VerificationCodePage.routeName)
          : Provider.of<AuthProvider>(context, listen: false).msgLogin1 =
              Provider.of<AuthProvider>(context, listen: false)
                  .mapSignin1['message'];
    }
  }
}
