import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/speakers_provider.dart';

class HeaderForExpandable extends StatelessWidget {
  HeaderForExpandable({
    Key? key,
    required this.index,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapSpeakers =
        Provider.of<SpeakersProvider>(context, listen: false).mapSpeakers;
    return Row(
      children: [
        Center(
            child: ClipOval(
          child: Container(
            height: 50,
            width: 50,
            child: Image.network(
              mapSpeakers['result'][index]['profile_picture_url'],
              width: 50.0,
              height: 50.0,
              fit: BoxFit.contain,
            ),
          ),
        )),
        Padding(
            padding: const EdgeInsets.fromLTRB(21, 0, 0, 0),
            //speakers name and headshot
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 6),
                  child: ScrollableTitle(
                      title: mapSpeakers['result'][index]['name']),
                ),

                //for headshots
                ScrollableText(
                  title: mapSpeakers['result'][index]['job_title'],
                ),

                ScrollableText(
                  title: mapSpeakers['result'][index]['company_name'],
                ),
              ],
            )),
      ],
    );
  }
}

class ScrollableText extends StatelessWidget {
  const ScrollableText({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width -
          2 * horizontalPadding -
          50 -
          2 * 18 -
          25,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
      ),
    );
  }
}

class ScrollableTitle extends StatelessWidget {
  const ScrollableTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width -
          2 * horizontalPadding -
          50 -
          2 * 18 -
          25,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Text(title, style: Theme.of(context).textTheme.bodyLarge),
      ),
    );
  }
}
