import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

var info;

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    info = ModalRoute.of(context).settings.arguments.toString();
    //print(info);
    return Center(
      child: new QrChange(),
    );
  }
}

class QrChange extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QrCode();
}

class _QrCode extends State<StatefulWidget> {
  Widget build(BuildContext context) {
    return new Container(
        child: QrImage(
          data: info,
          version: QrVersions.auto,
          size: 240,
          gapless: false,
        ),
        margin: const EdgeInsets.only(top: 20));
  }
}
