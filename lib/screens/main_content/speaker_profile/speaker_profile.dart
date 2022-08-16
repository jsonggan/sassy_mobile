import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/screens/main_content/edit_profile/edit_profile.dart';
import 'package:sassy_mobile/screens/main_content/qr_code/qr_code.dart';
import 'package:sassy_mobile/screens/sign_in/sign_in.dart';
import 'components/body.dart';

class SpeakerProfilePage extends StatelessWidget {
  static String routeName = '/speaker_profile_page';
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xFF2094CC), Color(0xFF04E196)])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: ProfileTopAppBar(),
          body: Profile(),
        ));
  }
}

class ProfileTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(60.0);

  const ProfileTopAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        icon: SvgPicture.asset('assets/icons/button_back_white.svg'),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Text('Profile',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: textColorWhite)),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }
}
