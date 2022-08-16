import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:sassy_mobile/app_theme.dart';
//import 'package:sassy_mobile/widgets/card.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final Color color;

  const CustomCard({Key? key, required this.child, this.color = cardColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.transparent,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: color,
      child: child,
    );
  }
}
