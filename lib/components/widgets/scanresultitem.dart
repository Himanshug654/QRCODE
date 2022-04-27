import 'package:flutter/material.dart';
import 'package:qrcode/app/utils/constants/color.dart';
import 'package:qrcode/app/utils/math_utils.dart';
import 'package:qrcode/model/Result.dart';

class ScanResultCell extends StatelessWidget {
  final Result resultData;

  ScanResultCell({
    required this.resultData,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getSize(20), vertical: getSize(5)),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorConstants.white,
          borderRadius: BorderRadius.circular(
            getSize(10),
          ),
          border: Border.all(
            color: ColorConstants.pageViewGrey,
            width: getSize(0.5),
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: getSize(17), vertical: getSize(11)),
              width: MathUtilities.screenWidth(context),
              decoration: BoxDecoration(
                  color: ColorConstants.lightDividerColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      getSize(10),
                    ),
                    topRight: Radius.circular(
                      getSize(10),
                    ),
                  )),
              child: Row(
                children: <Widget>[
                  Text(resultData.userId.toString()),
                ],
              ),
            ),
            Container(
              height: getSize(0.5),
              color: ColorConstants.pageViewGrey,
            ),
            Padding(
                padding: EdgeInsets.only(
                    left: getSize(16),
                    right: getSize(16),
                    top: getSize(14),
                    bottom: getSize(14)),
                child: Stack(
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(resultData.id.toString()),
                          SizedBox(
                            height: getSize(5),
                          ),
                          Text(
                            resultData.title.toString(),
                          )
                        ],
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
