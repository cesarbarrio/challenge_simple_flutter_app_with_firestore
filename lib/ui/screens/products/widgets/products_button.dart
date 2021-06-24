import 'package:flutter/material.dart';
import 'package:smart_dream/config/app.dart' as Config;

class ProductsButton extends StatelessWidget {
  //

  final double mediumSize = Config.APP_FONT_SIZES_MEDIUM;
  final Color primaryColor = Config.APP_COLORS_PRIMARY;
  final String title;
  final VoidCallback _onPressed;

  ProductsButton({
    Key? key,
    required VoidCallback onPressed,
    required this.title,
  })  : _onPressed = onPressed,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //

    return ElevatedButton(
      onPressed: _onPressed,
      style: ElevatedButton.styleFrom(
        primary: primaryColor,
      ),
      child: Container(
        alignment: Alignment.center,
        child: Text(
          title,
          style: TextStyle(
            fontSize: mediumSize,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );

    //
  }

  //
}
