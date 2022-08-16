import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/agenda_provider.dart';

class TrackButton extends StatelessWidget {
  final String track;
  TrackButton({
    Key? key,
    required this.track,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          color: Provider.of<AgendaProvider>(context).track == track
              ? blue
              : cardColor,
          child: InkWell(
            borderRadius: BorderRadius.circular(6),
            onTap: () {
              Provider.of<AgendaProvider>(context, listen: false)
                  .trackSelector(track);
              if (Provider.of<AgendaProvider>(context, listen: false)
                      .date
                      .length ==
                  0) {
                return;
              } else {
                Provider.of<AgendaProvider>(context, listen: false)
                    .fetchAgendaData(
                        Provider.of<AgendaProvider>(context, listen: false)
                            .date,
                        int.parse(track));
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 19, vertical: 6),
              child: Text(track,
                  style: Provider.of<AgendaProvider>(context).track == track
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
