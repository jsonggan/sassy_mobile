import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/providers/event_provider.dart';
import 'package:sassy_mobile/screens/select_event/select_event.dart';

import 'package:sassy_mobile/widgets/custom_button.dart';
import 'package:sassy_mobile/widgets/snack_bar.dart';
import 'package:sassy_mobile/widgets/text_input_field.dart';

class VerificationCode extends StatefulWidget {
  const VerificationCode({Key? key}) : super(key: key);
  static String routeName = '/verification_code';

  @override
  State<VerificationCode> createState() => _VerificationCodeState();
}

class _VerificationCodeState extends State<VerificationCode> {
  final _formKey = GlobalKey<FormState>();
  final verificationCodeController = TextEditingController();
  bool _resendOTPEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: ((context, value, child) {
      return SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        child: Form(
          key: _formKey,
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Spacer(flex: 2),
                Text('Verification Code',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: textColorWhite)),
                Spacer(flex: 1),
                Text(
                    'Please enter the 6-digit verification code we sent to ' +
                        value.email,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: textColorGrey1)),
                Spacer(flex: 2),
                TextInputField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter verification code';
                    }
                    return null;
                  },
                  type: 'Verification Code',
                  controller: verificationCodeController,
                  keyboard: TextInputType.number,
                ),
                Spacer(flex: 9),
                Center(
                  child: Text('''Didn’t receive an OTP?''',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: textColorGrey1)),
                ),
                Center(
                  child: GestureDetector(
                    onTap: _resendOTPEnabled
                        ? () {
                            setState(() {
                              _resendOTPEnabled = false;
                            });
                            Timer(Duration(seconds: 30), () {
                              setState(() {
                                _resendOTPEnabled = true;
                              });
                            });
                            resendOtp();
                          }
                        : null,
                    child: Text('Resend OTP',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: textColorWhite,
                            decoration: TextDecoration.underline)),
                  ),
                ),
                Spacer(flex: 1),
                CustomButton(
                  color: yellowCardColor,
                  text: "Submit",
                  press: () => submit(),
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ));
    }));
  }

  Future<void> submit() async {
    print('go into veri code submit function');
    final isValidForm = _formKey.currentState!.validate();
    if (isValidForm) {
      CustomSnackBar.showLoading(context);

      final AuthProvider provider =
          Provider.of<AuthProvider>(context, listen: false);

      await provider.loginStep2(
          provider.email, verificationCodeController.text);
      Map<String, dynamic> mapUserDetail = provider.mapUserDetail;

      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      CustomSnackBar.showMessage(context, mapUserDetail['message']);

      if (mapUserDetail['message'] == 'Successfully logged in!') {
        await Provider.of<EventProvider>(context, listen: false)
            .getUserRegisteredEvents();
        Navigator.pushNamed(context, SelectEventPage.routeName);
      }
    }
  }

  Future<void> resendOtp() async {
    CustomSnackBar.showLoading(context);

    final AuthProvider provider =
        Provider.of<AuthProvider>(context, listen: false);
    await provider.loginResendMFA(provider.email);
    Map<String, dynamic> mapResendMFA = provider.mapResendMFA;
    await Future.delayed(const Duration(seconds: 1));

    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    CustomSnackBar.showMessage(context, mapResendMFA['message'].toString());
  }
}
