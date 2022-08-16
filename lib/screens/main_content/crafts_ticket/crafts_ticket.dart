import 'package:flutter/material.dart';
import 'package:sassy_mobile/widgets/custom_appbar.dart';
import 'package:sassy_mobile/widgets/custom_bottom_nav_bar.dart';
import './components/body.dart';
import 'package:sassy_mobile/screens/main_home/components/body.dart';

class CraftsTicketPage extends StatefulWidget {
  const CraftsTicketPage({Key? key}) : super(key: key);
  static String routeName = '/crafts_ticket_page';

  @override
  State<CraftsTicketPage> createState() => _CraftsTicketPageState();
}

class _CraftsTicketPageState extends State<CraftsTicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomTopAppBar(),
      body: Container(
        child: CraftsTicket(),
      ),
      // bottomNavigationBar: MainHomeState().bottomAppBar(),
    );
  }
}



// class CraftsTicketPage extends StatelessWidget {
//   static String routeName = '/crafts_ticket_page';
//   const CraftsTicketPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: CustomTopAppBar(),
//         body: Container(
//           child: CraftsTicket(),
//         ),
//         bottomNavigationBar: MainHome);
//   }
// }
