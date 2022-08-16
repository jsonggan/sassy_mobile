import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sassy_mobile/app_theme.dart';

class NumInputField extends StatefulWidget {
  const NumInputField({Key? key}) : super(key: key);

  @override
  State<NumInputField> createState() => _NumInputFieldState();
}

class _NumInputFieldState extends State<NumInputField> {
  FocusNode? pin2FocusNode;
  FocusNode? pin3FocusNode;
  FocusNode? pin4FocusNode;
  FocusNode? pin5FocusNode;
  FocusNode? pin6FocusNode;

  final code1controller = TextEditingController();
  final code2controller = TextEditingController();
  final code3controller = TextEditingController();
  final code4controller = TextEditingController();
  final code5controller = TextEditingController();

  final code6controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    pin2FocusNode = FocusNode();
    pin3FocusNode = FocusNode();
    pin4FocusNode = FocusNode();
    pin5FocusNode = FocusNode();
    pin6FocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    pin2FocusNode!.dispose();
    pin3FocusNode!.dispose();
    pin4FocusNode!.dispose();
    pin5FocusNode!.dispose();
    pin6FocusNode!.dispose();
  }

  void nextField(String value, FocusNode? focusNode) {
    if (value.length == 1) {
      focusNode!.requestFocus();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        children: [
          Spacer(flex: 3),
          CustomSizedBox(
            child: TextFormField(
              controller: code1controller,
              autofocus: true,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16, color: textColorWhite),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: customInputDecoration(),
              onChanged: (value) {
                nextField(value, pin2FocusNode);
              },
            ),
          ),
          Spacer(flex: 1),
          CustomSizedBox(
            child: TextFormField(
              controller: code2controller,
              focusNode: pin2FocusNode,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16, color: textColorWhite),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: customInputDecoration(),
              onChanged: (value) => nextField(value, pin3FocusNode),
            ),
          ),
          Spacer(flex: 1),
          CustomSizedBox(
            child: TextFormField(
              controller: code3controller,
              focusNode: pin3FocusNode,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16, color: textColorWhite),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: customInputDecoration(),
              onChanged: (value) => nextField(value, pin4FocusNode),
            ),
          ),
          Spacer(flex: 1),
          CustomSizedBox(
            child: TextFormField(
              controller: code4controller,
              focusNode: pin4FocusNode,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16, color: textColorWhite),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: customInputDecoration(),
              onChanged: (value) => nextField(value, pin5FocusNode),
            ),
          ),
          Spacer(flex: 1),
          CustomSizedBox(
            child: TextFormField(
              controller: code5controller,
              focusNode: pin5FocusNode,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16, color: textColorWhite),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: customInputDecoration(),
              onChanged: (value) => nextField(value, pin6FocusNode),
            ),
          ),
          Spacer(flex: 1),
          CustomSizedBox(
            child: TextFormField(
              controller: code6controller,
              focusNode: pin6FocusNode,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontSize: 16, color: textColorWhite),
              keyboardType: TextInputType.number,
              textAlign: TextAlign.center,
              decoration: customInputDecoration(),
              onChanged: (value) {
                if (value.length == 1) {
                  pin6FocusNode!.unfocus();
                  // Then you need to check is the code is correct or not
                }
              },
            ),
          ),
          Spacer(flex: 3),
        ],
      ),
    );
  }

  InputDecoration customInputDecoration() {
    return InputDecoration(
      // border: InputBorder.none,
      // focusedBorder: InputBorder.none,
      // enabledBorder: InputBorder.none,
      // disabledBorder: InputBorder.none,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: cardColor, width: 5.0),
        borderRadius: BorderRadius.circular(6),
      ),
      // enabledBorder: OutlineInputBorder(
      //   borderSide: BorderSide(color: cardColor, width: 5.0),
      // ),

      // enabledBorder: OutlineInputBorder(),
      fillColor: cardColorDark,
      filled: true,
    );
  }
}

class CustomSizedBox extends StatelessWidget {
  CustomSizedBox({Key? key, required this.child}) : super(key: key);
  Widget child;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: child,
    );
  }
}
