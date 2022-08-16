import 'package:date_count_down/date_count_down.dart';
import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/event_provider.dart';
import 'package:sassy_mobile/widgets/custom_card.dart';

class Countdown extends StatelessWidget {
  const Countdown({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapEvent =
        Provider.of<EventProvider>(context, listen: false).mapEvent;
    return CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text('The Event Begins In',
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 13),
          CountdownTimer(
            // 2022-08-12T00:30:00.000000Z
            // mapEvent['result']['datetime_start']
            endTime: DateTime.parse(mapEvent['result']['datetime_start'])
                .millisecondsSinceEpoch,
            widgetBuilder: (_, time) {
              if (time == null) {
                return Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text('00',
                              style: Theme.of(context).textTheme.titleMedium),
                          Center(
                              child: Text('Days',
                                  style:
                                      Theme.of(context).textTheme.bodyMedium)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text('00',
                              style: Theme.of(context).textTheme.titleMedium),
                          Center(
                            child: Text('Hours',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text('00',
                              style: Theme.of(context).textTheme.titleMedium),
                          Center(
                            child: Text('Minutes',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text('00',
                              style: Theme.of(context).textTheme.titleMedium),
                          Center(
                            child: Text('Seconds',
                                style: Theme.of(context).textTheme.bodyMedium),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              }
              return Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                            time.days.toString().length == 4
                                ? '00'
                                : time.days.toString().length == 1
                                    ? '0' + time.days.toString()
                                    : time.days.toString(),
                            style: Theme.of(context).textTheme.titleMedium),
                        Center(
                            child: Text('Days',
                                style: Theme.of(context).textTheme.bodyMedium)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                            time.hours.toString().length == 4
                                ? '00'
                                : time.hours.toString().length == 1
                                    ? '0' + time.hours.toString()
                                    : time.hours.toString(),
                            style: Theme.of(context).textTheme.titleMedium),
                        Center(
                          child: Text('Hours',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                            time.min.toString().length == 1
                                ? '0' + time.min.toString()
                                : time.min.toString(),
                            style: Theme.of(context).textTheme.titleMedium),
                        Center(
                          child: Text('Minutes',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                            time.sec.toString().length == 4
                                ? '00'
                                : time.sec.toString().length == 1
                                    ? '0' + time.sec.toString()
                                    : time.sec.toString(),
                            style: Theme.of(context).textTheme.titleMedium),
                        Center(
                          child: Text('Seconds',
                              style: Theme.of(context).textTheme.bodyMedium),
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ]),
      ),
    );
  }
}
