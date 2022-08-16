import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sassy_mobile/app_theme.dart';

class ResendOtp extends StatelessWidget {
  const ResendOtp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: SvgPicture.asset('assets/icons/close_white.svg')),
      backgroundColor: backGroundColorBlack,
    );
  }
}
