import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:qrcode/app/utils/constants/strings.dart';
import 'package:qrcode/app/utils/navigator.dart';
import 'package:qrcode/components/screen/home/ScanQRCodeScreen.dart';
import 'package:qrcode/components/widgets/button.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Button(
              buttonText: StringConstants.scanQrCode,
              onPressed: () {
                NavigationUtilities.pushRoute(
                  ScanQRCodeScreen.route,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}