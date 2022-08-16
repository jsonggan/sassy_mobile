import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:sassy_mobile/app_theme.dart';
//import 'package:sassy_mobile/widgets/custom_button.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    Key? key,
    this.text = 'button',
    required this.press,
    this.textColor = textColorWhite,
    this.height = 55.0,
    this.width = double.infinity,
    this.color = blue,
  }) : super(key: key);
  final String text;
  final Function? press;
  final double width;
  final double height;
  final Color color;
  final Color textColor;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          backgroundColor: widget.color,
        ),
        onPressed: widget.press as void Function()?,
        child: Text(widget.text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: widget.textColor)),
      ),
    );
  }
}
