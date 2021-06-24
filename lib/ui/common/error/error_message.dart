import 'package:flutter/material.dart';
import 'package:smart_dream/config/app.dart' as Config;

class ErrorMessage extends StatelessWidget {
  //

  final double mediumSize = Config.APP_FONT_SIZES_MEDIUM;
  final String message;

  ErrorMessage({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    //

    return ListView(
      physics: AlwaysScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 250),
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Text(
            message,
            style: TextStyle(
              fontSize: mediumSize,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );

    //
  }

  //
}
