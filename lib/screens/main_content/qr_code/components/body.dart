import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sassy_mobile/app_theme.dart';
import 'package:sassy_mobile/providers/user_provider.dart';
import 'package:qr_flutter/qr_flutter.dart';
// import 'package:sassy_mobile/models/app_theme.dart';
// import 'package:sassy_mobile/main.dart';

class QrCode extends StatelessWidget {
  const QrCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> mapShowParticulars =
        Provider.of<UserProvider>(context, listen: false).mapShowParticulars;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 25, right: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 24),
              child: Text(
                'Qr Code',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
          ),
          Container(
            child: QrImage(
              data: mapShowParticulars['results']['qr_code_id'],
              version: QrVersions.auto,
            ),
          ),
        ],
      ),
    );
  }
}
