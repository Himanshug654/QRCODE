import 'package:flutter/material.dart';
import 'package:qrcode/app/utils/math_utils.dart';

class Button extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;

  Button({
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var textTheme = Theme.of(context).textTheme;

    return Padding(
        padding: const EdgeInsets.all(10.0),
        child: ElevatedButton(
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width, getSize(60))),
            backgroundColor: MaterialStateProperty.all(colorScheme.primary),
            // elevation: MaterialStateProperty.all(3),
            shadowColor: MaterialStateProperty.all(Colors.transparent),
          ),
          onPressed: onPressed,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Text(buttonText,
                style: textTheme.bodyText2!
                    .copyWith(color: colorScheme.background, fontSize: 16,)),
          ),
        ),
    );
  }
}