import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_country.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_event_name.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_gender.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_profession.dart';
import 'package:sassy_mobile/providers/select_dropdown/select_salutation.dart';

class DropDown extends StatefulWidget {
  List items;
  String text;
  bool isSelect;
  String? fieldText;
  Color color;
  Color textColor;
  Color textColorItem;

  DropDown({
    Key? key,
    required this.items,
    required this.text,
    required this.isSelect,
    required this.fieldText,
    this.color = cardColorLight,
    this.textColor = textColorGreyLight,
    this.textColorItem = textColorGrey,
  }) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            isExpanded: true,
            hint: Row(
              children: [
                Expanded(
                  child: Text(
                    widget.text,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: widget.textColor),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            items: widget.items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: widget.textColorItem),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))
                .toList(),
            value: widget.isSelect ? widget.fieldText : null,
            onChanged: (value) {
              if (widget.text == 'Salutation') {
                Provider.of<SelectSalutation>(context, listen: false)
                    .updateSalutation(value);
                print('Update salutation drop down is working');
              }
              // if (widget.text == 'Gender') {
              //   Provider.of<SelectGender>(context, listen: false)
              //       .updateGender(value);
              //   print('Update Gender drop down is working');
              // }
              if (widget.text == 'Event Name') {
                Provider.of<SelectEventName>(context, listen: false)
                    .updateEventName(value);
                print('Update Event Name drop down is working');
              }
              if (widget.text == 'Profession') {
                Provider.of<SelectProfession>(context, listen: false)
                    .updateprofession(value);
                print('Update profession drop down is working');
              }
              if (widget.text == 'Country') {
                Provider.of<SelectCountry>(context, listen: false)
                    .updateCountry(value);
                print('Update profession drop down is working');
              }
            },
            icon: SvgPicture.asset('assets/icons/dropdown.svg'),
            buttonHeight: 55,
            buttonWidth: MediaQuery.of(context).size.width,
            buttonPadding: const EdgeInsets.only(left: 14, right: 14),
            buttonDecoration: BoxDecoration(
              boxShadow: const [],
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: widget.color,
              ),
              color: widget.color,
            ),
            buttonElevation: 2,
            itemHeight: 55,
            itemPadding: const EdgeInsets.only(left: 14, right: 14),
            dropdownMaxHeight: 200,
            dropdownWidth:
                MediaQuery.of(context).size.width - 2 * horizontalPadding,
            dropdownPadding: null,
            dropdownDecoration: BoxDecoration(
              boxShadow: const [],
              borderRadius: BorderRadius.circular(6),
              color: widget.color,
            ),
            dropdownElevation: 8,
            scrollbarRadius: const Radius.circular(40),
            scrollbarThickness: 6,
            scrollbarAlwaysShow: true,
            offset: const Offset(0, 0),
          ),
        ),
      ),
    );
  }
}
