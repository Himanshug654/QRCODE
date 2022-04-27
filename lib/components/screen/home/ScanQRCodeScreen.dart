import 'dart:async';
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qrcode/app/utils/constants/color.dart';
import 'package:qrcode/app/utils/constants/strings.dart';
import 'package:qrcode/app/utils/math_utils.dart';
import 'package:qrcode/app/utils/navigator.dart';
import 'package:qrcode/components/screen/home/ScanResults.dart';

class ScanQRCodeScreen extends StatefulWidget {
  static const route = "UnlockScooterScreen";

  @override
  _ScanQRCodeScreenState createState() => _ScanQRCodeScreenState();
}

class _ScanQRCodeScreenState extends State<ScanQRCodeScreen> {
  var qrText = null;
  late QRViewController qrCodeController;
  GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  late QRView qrView;
  int id = 1;



  @override
  void dispose() {
    qrCodeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      initQrCode(true);
    });
  }

  initQrCode(bool isInit) {
    if (isInit) {
      qrView = QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: ColorConstants.colorPrimary,
          borderRadius: getSize(15),
          borderWidth: getSize(10),
        ),
      );
      setState(() {});
    } else {
      Timer(
        Duration(seconds: 2),
        () => (setState(() {
          qrText = null;
          qrCodeController.resumeCamera();
        })),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.scanQrCode),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  QRView(
                    key: GlobalKey(debugLabel: "QR" + id.toString()),
                    onQRViewCreated: onQRViewCreated,
                    overlay: QrScannerOverlayShape(
                      borderColor: ColorConstants.colorPrimary,
                      borderRadius: getSize(15),
                      borderWidth: getSize(10),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }



  void onQRViewCreated(QRViewController controller) {
    this.qrCodeController = controller;
    qrCodeController.scannedDataStream.listen(
      (scanData) {
        if (qrText == null) {
          qrText = scanData.code as String;
          Map<String, dynamic> dict = new HashMap();
          dict['url'] = qrText;
          NavigationUtilities.pushRoute(ScanResults.route,
              type: RouteType.fade, args: dict);
          // qrCodeController.resumeCamera();
          Timer(Duration(seconds: 2), () => ({qrText = null}));
        }
      },
    );
  }
}