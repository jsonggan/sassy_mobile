import 'package:flutter/material.dart';
import 'package:sassy_mobile/app_theme.dart';

class TextInputField extends StatelessWidget {
  final String type;
  final TextEditingController controller;
  final FormFieldValidator<String> validator;
  final Color color;
  final Color textColor;
  final TextInputType keyboard;

  const TextInputField({
    Key? key,
    required this.type,
    required this.controller,
    required this.validator,
    this.color = cardColorDark,
    this.textColor = textColorWhite,
    this.keyboard = TextInputType.emailAddress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: textColor),
      validator: validator,
      keyboardType: keyboard,
      decoration: InputDecoration(
        fillColor: color,
        filled: true,
        hintText: type,
        hintStyle: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(color: textColorGreyLight),
        border: InputBorder.none,
        focusedBorder:
            OutlineInputBorder(borderSide: BorderSide(color: color, width: 5)),
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: color, width: 5)),
      ),
    );
  }
}
