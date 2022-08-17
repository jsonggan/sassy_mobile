import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  const CustomTopAppBar({
    Key? key,
    this.svgFile = 'assets/icons/button_back.svg',
  }) : super(key: key);
  final String svgFile;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(svgFile),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ));
  }
}

class CustomTopAppBarWhiteIcon extends StatelessWidget
    implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  const CustomTopAppBarWhiteIcon({
    Key? key,
    this.svgFile = 'assets/icons/button_back_white.svg',
  }) : super(key: key);
  final String svgFile;

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset(svgFile),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ));
  }
}
