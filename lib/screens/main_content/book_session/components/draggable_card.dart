import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/sessions_provider.dart';

class DraggableCard extends StatelessWidget {
  const DraggableCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dateTimeStart = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(
        Provider.of<SessionsProvider>(context, listen: false).startTime, true);
    var dateLocalStart = dateTimeStart.toLocal();

    var dateTimeEnd = DateFormat("yyyy-MM-ddTHH:mm:ssZ").parse(
        Provider.of<SessionsProvider>(context, listen: false).endTime, true);
    var dateLocalEnd = dateTimeEnd.toLocal();
    Map<String, dynamic> mapSession =
        Provider.of<SessionsProvider>(context, listen: false).mapSession;

    List listOfTimeStartForDescription =
        Provider.of<SessionsProvider>(context, listen: false)
            .listOfTimeStartForDescription;

    List listOfTimeEndForDescription =
        Provider.of<SessionsProvider>(context, listen: false)
            .listOfTimeEndForDescription;
    return DraggableScrollableSheet(
      initialChildSize: 0.7,
      minChildSize: 0.7,
      maxChildSize: 1,
      builder: (context, controller) => Container(
        child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: ListView(
            padding: EdgeInsets.fromLTRB(
                horizontalPadding, 35, horizontalPadding, 120),
            controller: controller,
            children: <Widget>[
              Text(Provider.of<SessionsProvider>(context).event,
                  style: Theme.of(context).textTheme.titleLarge),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 0, 18),
                child: Text(
                  mapSession['result']['price'].toString() == '0'
                      ? 'Free'
                      : '\$${mapSession['result']['price']}',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 16,
                        color: Color(0xFF20E001),
                      ),
                ),
              ),
              Row(
                children: [
                  Image.asset('assets/images/calendar_small.png'),
                  Spacer(flex: 1),
                  Text(mapSession['result']['datetime_start'].split('T')[0],
                      style: Theme.of(context).textTheme.bodyMedium),
                  Spacer(flex: 3),
                  SvgPicture.asset('assets/icons/clock.svg'),
                  Spacer(flex: 1),
                  Text(
                      dateLocalStart
                              .toString()
                              .split(' ')[1]
                              .split('.')[0]
                              .split(':')[0] +
                          ':' +
                          dateLocalStart
                              .toString()
                              .split(' ')[1]
                              .split('.')[0]
                              .split(':')[1] +
                          '-' +
                          dateLocalEnd
                              .toString()
                              .split(' ')[1]
                              .split('.')[0]
                              .split(':')[0] +
                          ':' +
                          dateLocalEnd
                              .toString()
                              .split(' ')[1]
                              .split('.')[0]
                              .split(':')[1],
                      style: Theme.of(context).textTheme.bodyMedium),
                  Spacer(flex: 14),
                ],
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0, 6, 0, 18),
                child: Row(
                  children: [
                    SvgPicture.asset('assets/icons/clock.svg'),
                    Spacer(flex: 1),
                    Text(mapSession['result']['location'].toString(),
                        style: Theme.of(context).textTheme.bodyMedium),
                    Spacer(flex: 20),
                  ],
                ),
              ),
              Text('Description',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16)),
              SizedBox(
                height: 10,
              ),
              // Padding(
              //   padding: const EdgeInsets.fromLTRB(0, 9, 0, 27),
              //   child: Text(mapSession['result']['description'].toString(),
              //       style: Theme.of(context)
              //           .textTheme
              //           .bodyMedium!
              //           .copyWith(height: 1.4)),
              // ),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount:
                      Provider.of<SessionsProvider>(context, listen: false)
                          .listOfSessionDescription
                          .length,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            listOfTimeStartForDescription[index] +
                                ' - ' +
                                listOfTimeEndForDescription[index] +
                                ':' +
                                "\n" +
                                '- ' +
                                Provider.of<SessionsProvider>(context,
                                        listen: false)
                                    .listOfSessionDescription[index],
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(height: 1.4)),
                        Text('',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontSize: 8)),
                      ],
                    );
                  }),
              Text('Speakers',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(fontSize: 16)),
              SizedBox(
                height: 70,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:
                        Provider.of<SessionsProvider>(context, listen: false)
                            .listOfSpeakerImage
                            .length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                          CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                Provider.of<SessionsProvider>(context,
                                        listen: false)
                                    .listOfSpeakerImage[index]),
                            backgroundColor: Colors.transparent,
                          ),
                          SizedBox(
                            width: 15,
                          )
                        ],
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
