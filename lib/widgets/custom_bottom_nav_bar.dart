// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:sassy_mobile/app_theme.dart';
// import 'package:sassy_mobile/screens/agenda/agenda.dart';
// import 'package:sassy_mobile/screens/countdown/countdown.dart';
// import 'package:sassy_mobile/screens/map/map.dart';
// import 'package:sassy_mobile/screens/more_feature/components/body.dart';
// import 'package:sassy_mobile/screens/more_feature/more_feature.dart';

// class CustomBottomNavBar extends StatelessWidget {
//   const CustomBottomNavBar({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 55,
//       color: bottomNavBarColor,
//       child: SafeArea(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             IconButton(
//               icon: SvgPicture.asset(
//                 "assets/icons/home.svg",
//               ),
//               onPressed: () =>
//                   Navigator.pushNamed(context, EventHomePage.routeName),
//             ),
//             InkWell(
//               onTap: () => Navigator.pushNamed(context, AgendaPage.routeName),
//               highlightColor: Colors.blue.withOpacity(0.4),
//               splashColor: Colors.green.withOpacity(0.5),
//               child: SvgPicture.asset("assets/icons/list.svg"),
//             ),
//             IconButton(
//               icon: Image.asset("assets/images/location.png"),
//               onPressed: () => Navigator.pushNamed(context, MapPage.routeName),
//             ),
//             IconButton(
//               icon: Image.asset(
//                 "assets/images/users.png",
//               ),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: SvgPicture.asset("assets/icons/more.svg"),
//               onPressed: () =>
//                   Navigator.pushNamed(context, MoreFeaturePage.routeName),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
