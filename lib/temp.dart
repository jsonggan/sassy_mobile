import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:sassy_mobile/widgets/custom_card.dart';

class Temp extends StatelessWidget {
  static String routeName = '/temp';
  const Temp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomCard(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text('The Festival Begins In',
              style: Theme.of(context).textTheme.bodyMedium),
          SizedBox(height: 13),
          SizedBox(
            height: 100,
            child: CountdownTimer(
              endTime: DateTime.parse('2020-08-12T00:30:00.000000Z')
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium)),
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
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
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
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
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
                                  style:
                                      Theme.of(context).textTheme.bodyMedium),
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
                              time.days.toString().length == 1
                                  ? '0' + time.days.toString()
                                  : time.days.toString(),
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
                          Text(
                              time.hours.toString().length == 1
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
                              time.sec.toString().length == 1
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
          ),
        ]),
      ),
    ));
  }
}
//2022-08-12T08:30:00.000000Z

