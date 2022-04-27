import 'package:flutter/material.dart';
import 'package:qrcode/app/utils/navigator.dart';
import 'package:qrcode/components/screen/home/HomeScreen.dart';
import 'package:qrcode/components/screen/home/ScanQRCodeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widgets is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: NavigationUtilities.key,
      onGenerateRoute: onGenerateRoute,
      home:  MyHomePage(),
      routes: <String,WidgetBuilder>{
      },
    );
  }
}
