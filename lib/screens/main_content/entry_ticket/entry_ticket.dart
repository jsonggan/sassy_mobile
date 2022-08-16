import 'package:flutter/material.dart';
import 'package:sassy_mobile/app_theme.dart';
// import 'package:sassy_mobile/models/app_theme.dart';
// import 'package:sassy_mobile/main.dart';

class EntryTicket extends StatelessWidget {
  const EntryTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: horizontalPadding),
        //whole page element
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 24),
              child: Text('Entry Ticket',
                  style: Theme.of(context).textTheme.titleLarge),
            ),

            //card
            SizedBox(
              height: 84,
              width: double.infinity,
              child: Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                color: cardColor,
                child: Padding(
                    padding: const EdgeInsets.all(18),
                    child: Row(
                      children: [
                        Image.asset('assets/images/attendees1.png'),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(21, 0, 0, 0),
                          child: Column(
                            children: [
                              Container(
                                height: 17,
                                child: Text('''User's Name''',
                                    style:
                                        Theme.of(context).textTheme.bodyLarge),
                              ),

                              //for tag
                              Container(
                                width: 100,
                                height: 15,
                                child: Text('1x GA Ticket',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                              ),
                              Container(
                                width: 100,
                                height: 15,
                                child: Text('SectionA2',
                                    style:
                                        Theme.of(context).textTheme.bodyMedium),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              ),
            ),
            //qr code
            Container(
                padding: EdgeInsets.fromLTRB(0, 14, 0, 0),
                width: MediaQuery.of(context).size.width,
                child:
                    Image.asset('assets/images/qr_code.png', fit: BoxFit.fill)),
          ],
        ),
      ),
    );
  }
}
