import 'package:flutter/material.dart';
import 'package:sassy_mobile/screens/main_content/attendees/trip.dart';
import 'package:sassy_mobile/app_theme.dart';
// import 'package:sassy_mobile/models/app_theme.dart';
// import 'package:sassy_mobile/main.dart';

// class Attendees extends StatelessWidget {
//   Attendees({
//     Key? key,
//   }) : super(key: key);



//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.fromLTRB(0, 10, 0, 24),
//               child: Text('Attendees',
//                   style: Theme.of(context).textTheme.titleLarge),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: categories.length,
//                 scrollDirection: Axis.vertical,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     width: MediaQuery.of(context).size.width,
//                     child: Card(
//                       margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(6),
//                       ),
//                       color: cardColor,
//                       child: Padding(
//                         padding: const EdgeInsets.all(18.0),
//                         child: Row(
//                           children: [
//                             Image.asset('assets/images/' +
//                                 categories[index].imageName! +
//                                 '.png'),
//                             Padding(
//                               padding: const EdgeInsets.fromLTRB(21, 0, 0, 0),
//                               //attendees name and tag
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Padding(
//                                     padding:
//                                         const EdgeInsets.fromLTRB(0, 0, 0, 6),
//                                     child: Text('Alice Wonder',
//                                         style: Theme.of(context)
//                                             .textTheme
//                                             .bodyLarge),
//                                   ),
//                                   //for tag
//                                   Row(
//                                     children: [
//                                       Card(
//                                         margin: EdgeInsets.fromLTRB(0, 0, 7, 0),
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                         ),
//                                         color: tagColor,
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               vertical: 6, horizontal: 9),
//                                           child: Text(
//                                               categories[index].tag1.toString(),
//                                               style: Theme.of(context)
//                                                   .textTheme
//                                                   .bodyMedium),
//                                         ),
//                                       ),
//                                       Card(
//                                         shape: RoundedRectangleBorder(
//                                           borderRadius:
//                                               BorderRadius.circular(5),
//                                         ),
//                                         margin: EdgeInsets.zero,
//                                         color: tagColor,
//                                         child: Padding(
//                                           padding: const EdgeInsets.symmetric(
//                                               vertical: 6, horizontal: 9),
//                                           child: Text(
//                                             categories[index].tag2.toString(),
//                                             style: Theme.of(context)
//                                                 .textTheme
//                                                 .bodyMedium,
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   )
//                                 ],
//                               ),
//                             )
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
