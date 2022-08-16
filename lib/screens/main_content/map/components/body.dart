import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/event_provider.dart';
import 'package:sassy_mobile/providers/map_provider.dart';
// import 'package:sassy_mobile/models/app_theme.dart';
// import 'package:sassy_mobile/main.dart';

class Map extends StatefulWidget {
  const Map({Key? key}) : super(key: key);

  @override
  State<Map> createState() => _MapState();
}

class _MapState extends State<Map> {
  late String eventCode;

  // @override
  // void didChangeDependencies() {
  //   Provider.of<MapProvider>(context, listen: false).getMap('SGCRW22');

  //   super.didChangeDependencies();
  // }

  @override
  Widget build(BuildContext context) {
    // print('second event code');
    // String eventCode = Provider.of<EventProvider>(context).eventCode;
    // print('your event code here');
    // print(eventCode);

    // Provider.of<MapProvider>(context, listen: false).getMap('SGCRW22');
    // var mapMap = Provider.of<MapProvider>(context).mapMap;
    return !Provider.of<MapProvider>(context).getMapIsDone
        ? SizedBox(
            height: 50, child: Center(child: CircularProgressIndicator()))
        : Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 25, right: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 24),
                    child: Text(
                      'Map',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
                InteractiveViewer(
                  clipBehavior: Clip.none,
                  minScale: 1,
                  maxScale: 3,
                  child: Image.network(
                      Provider.of<MapProvider>(context)
                          .mapMap['result'][0]
                          .toString(),
                      fit: BoxFit.fill),
                ),
              ],
            ),
          );
  }
}
