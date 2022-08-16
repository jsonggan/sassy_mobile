import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/speakers_provider.dart';

class ExpandedForExpandable extends StatefulWidget {
  int index;
  ExpandedForExpandable({
    Key? key,
    required this.index,
  }) : super(key: key);

  @override
  State<ExpandedForExpandable> createState() => _ExpandedForExpandableState();
}

class _ExpandedForExpandableState extends State<ExpandedForExpandable> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapSpeakers =
        Provider.of<SpeakersProvider>(context, listen: false).mapSpeakers;
    List listOfSpeakerDescription =
        Provider.of<SpeakersProvider>(context, listen: false)
            .listOfSpeakerDescription;
    List listOfSpeakerLocation =
        Provider.of<SpeakersProvider>(context, listen: false)
            .listOfSpeakerLocation;
    return !Provider.of<SpeakersProvider>(
      context,
    ).getSpeakersIsDone
        ? SizedBox(
            height: 50, child: Center(child: CircularProgressIndicator()))
        : Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 18),
            child: Text(
              listOfSpeakerDescription[widget.index]
              // +
              // '\n\nPerforming: ' +
              // listOfSpeakerLocation[widget.index]
              ,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    height: 1.5,
                  ),
            ),
          );
  }
}
