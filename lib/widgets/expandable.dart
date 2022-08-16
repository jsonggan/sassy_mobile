import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:sassy_mobile/app_theme.dart';

ExpandableTheme expandableList(int itemCount, Widget header, Widget expanded) {
  return ExpandableTheme(
    data: const ExpandableThemeData(
      tapHeaderToExpand: true,
      tapBodyToExpand: true,
      tapBodyToCollapse: true,
      hasIcon: false,
    ),
    child: Expanded(
      child: ListView.builder(
        itemCount: itemCount,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return ExpandableNotifier(
              child: Card(
            margin: EdgeInsets.fromLTRB(0, 0, 0, 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            color: cardColor,
            child: ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                theme: const ExpandableThemeData(
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: true,
                  tapBodyToExpand: true,
                ),
                header: header,
                collapsed: Container(),
                expanded: expanded,
              ),
            ),
          ));
        },
      ),
    ),
  );
}
