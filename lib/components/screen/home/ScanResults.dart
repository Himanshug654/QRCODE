import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qrcode/app/utils/constants/strings.dart';
import 'package:qrcode/components/widgets/scanresultitem.dart';
import 'package:qrcode/model/Result.dart';
import 'package:http/http.dart' as http;

class ScanResults extends StatefulWidget {
  static const route = "ScanResultScreen";

  String? url;

  ScanResults(Map<String, dynamic> arguments) {
    this.url = arguments['url'];
  }

  @override
  State<ScanResults> createState() => _ScanResultsState();
}

class _ScanResultsState extends State<ScanResults> {
  List<Result> _results = [];

  @override
  void initState() {
    super.initState();
    fetchResults();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(StringConstants.results),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (_, index) {
            return ScanResultCell(resultData: _results[index]);
          },
          itemCount: _results.length,
        ),
      ),
    );
  }

  void fetchResults() async {
    final response = await http.get(Uri.parse(widget.url!));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List jsonList = json.decode(response.body.toString()) as List;
      List<Result> myList =
          jsonList.map((jsonElement) => Result.fromJson(jsonElement)).toList();
      setState(() {
        _results = myList;
      });
      //     return Result.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.

      // set up the button
      Widget okButton = TextButton(
        child: Text(StringConstants.okay),
        onPressed: () {
          Navigator.of(context).pop();
        },
      );

      // set up the AlertDialog
      AlertDialog alert = AlertDialog(
        title: Text("Invalid URL"),
        actions: [
          okButton,
        ],
      );

      // show the dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        },
      );
      throw Exception('Failed to load results');
    }
  }
}