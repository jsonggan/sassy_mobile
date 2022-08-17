import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sassy_mobile/app_theme.dart';

class CustomSnackBar {
  final String message;

  const CustomSnackBar({
    required this.message,
  });

  static showLoading(
    BuildContext context,
  ) {
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
  }

  static showMessage(
    BuildContext context,
    String text,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: StadiumBorder(),
        behavior: SnackBarBehavior.floating,
        backgroundColor: cardColorDark,
        content: Text(text,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: textColorWhite)),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
