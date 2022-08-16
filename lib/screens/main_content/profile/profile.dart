import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/auth_provider.dart';
import 'package:sassy_mobile/screens/main_content/edit_profile/edit_profile.dart';
import 'package:sassy_mobile/screens/main_content/qr_code/qr_code.dart';
import 'package:sassy_mobile/screens/sign_in/sign_in.dart';
import 'components/body.dart';

class ProfilePage extends StatelessWidget {
  static String routeName = '/profile_page';
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
      title: Text('Profile',
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: textColorWhite)),
      centerTitle: true,
      automaticallyImplyLeading: false,
      actions: <Widget>[
        PopupMenuButton<MenuItem>(
            onSelected: (value) {
              if (value == MenuItem.editProfile) {
                Navigator.pushNamed(context, EditProfilePage.routeName);
              } else if (value == MenuItem.logout) {
                Provider.of<AuthProvider>(context, listen: false).logOut();
                Navigator.pushNamed(context, SignInPage.routeName);
              } else if (value == MenuItem.qrCode) {
                Navigator.pushNamed(context, QrCodePage.routeName);
              }
            },
            icon: SvgPicture.asset('assets/icons/more_white.svg'),
            itemBuilder: (context) => [
                  PopupMenuItem(
                    padding: EdgeInsets.zero,
                    value: MenuItem.editProfile,
                    child: ListTile(
                      leading:
                          SvgPicture.asset('assets/icons/edit_profile.svg'),
                      title: Text('Edit Profile',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.zero,
                    value: MenuItem.qrCode,
                    child: ListTile(
                      leading: SvgPicture.asset('assets/icons/qr_code.svg'),
                      title: Text('QR Code',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  ),
                  PopupMenuItem(
                    padding: EdgeInsets.zero,
                    value: MenuItem.logout,
                    child: ListTile(
                      leading: SvgPicture.asset('assets/icons/logout.svg'),
                      title: Text('Logout',
                          style: Theme.of(context).textTheme.bodyMedium),
                    ),
                  )
                ]),
      ],
    );
  }
}

enum MenuItem { editProfile, qrCode, logout }
