import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/agenda_provider.dart';
import 'package:sassy_mobile/providers/event_provider.dart';
import 'package:sassy_mobile/widgets/custom_card.dart';

class DateButton extends StatelessWidget {
  List listOfDates;
  int index;
  DateButton({
    Key? key,
    required this.listOfDates,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapEvent =
        Provider.of<EventProvider>(context, listen: false).mapEvent;
    List listOfDatesForDisplay = [];
    for (var i = 0; i < listOfDates.length; i++) {
      var inputFormat = DateFormat('yyyy-MM-dd HH:mm:ssZ');
      var inputDate = inputFormat.parse(listOfDates[i].toString());

      var outputFormat = DateFormat('dd-MM');
      var outputDate = outputFormat.format(inputDate);
      print(outputDate.toString());
      var tempListForDate = outputDate.toString().split('-');
      var tempMonth = '';
      if (tempListForDate[1] == '01') {
        tempMonth = 'Jan';
      }
      if (tempListForDate[1] == '02') {
        tempMonth = 'Feb';
      }

      if (tempListForDate[1] == '03') {
        tempMonth = 'Mar';
      }
      if (tempListForDate[1] == '04') {
        tempMonth = 'Apr';
      }

      if (tempListForDate[1] == '05') {
        tempMonth = 'May';
      }
      if (tempListForDate[1] == '06') {
        tempMonth = 'Jun';
      }
      if (tempListForDate[1] == '07') {
        tempMonth = 'Jul';
      }

      if (tempListForDate[1] == '08') {
        tempMonth = 'Aug';
      }
      if (tempListForDate[1] == '09') {
        tempMonth = 'Sep';
      }
      if (tempListForDate[1] == '10') {
        tempMonth = 'Oct';
      }

      if (tempListForDate[1] == '11') {
        tempMonth = 'Nov';
      }
      if (tempListForDate[1] == '12') {
        tempMonth = 'Dec';
      }
      listOfDatesForDisplay.add(tempListForDate[0] + ' ' + tempMonth);
    }
    print(listOfDatesForDisplay);

    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          color: listOfDates[index].toString().split(' ')[0] ==
                  Provider.of<AgendaProvider>(context).date
              ? blue
              : cardColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () {
              Provider.of<AgendaProvider>(context, listen: false)
                  .dateSelector(listOfDates[index].toString().split(' ')[0]);
              if (Provider.of<AgendaProvider>(context, listen: false)
                      .track
                      .length ==
                  0) {
                return;
              } else {
                Provider.of<AgendaProvider>(context, listen: false)
                    .fetchAgendaData(
                        Provider.of<AgendaProvider>(context, listen: false)
                            .date,
                        int.parse(
                            Provider.of<AgendaProvider>(context, listen: false)
                                .track));
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 6),
              child: Text(listOfDatesForDisplay[index],
                  style: listOfDates[index].toString().split(' ')[0] ==
                          Provider.of<AgendaProvider>(context, listen: false)
                              .date
                      ? Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: textColorWhite, fontSize: 17)
                      : Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: textColorGrey)),
            ),
          )),
    );
  }
}
