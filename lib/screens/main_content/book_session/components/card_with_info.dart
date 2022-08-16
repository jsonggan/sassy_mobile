import 'package:flutter/material.dart';
import 'package:sassy_mobile/app_theme.dart';

class CardWithInfo extends StatelessWidget {
  final String title;

  final String imageUrl;
  final String availableTicket;
  const CardWithInfo({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.availableTicket,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: cardColor,
      child: Padding(
          padding: const EdgeInsets.all(18),
          child: Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  )),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(21, 0, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.bodyLarge),

                      //for tag

                      RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Available: ',
                                style: Theme.of(context).textTheme.bodyMedium),
                            TextSpan(
                                text: availableTicket,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: textColorGreen)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }
}
