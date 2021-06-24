import 'package:flutter/material.dart';
import 'package:smart_dream/config/app.dart' as Config;

class ProductImage extends StatelessWidget {
  //

  final String imageUrl;
  final Color colorPrimary = Config.APP_COLORS_PRIMARY;

  ProductImage({
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    //

    return Center(
      child: Container(
        width: 100,
        height: 100,
        margin: EdgeInsets.all(
          10,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.5,
            color: colorPrimary,
          ),
          shape: BoxShape.circle,
        ),
        child: Container(
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: Image.network(
                  imageUrl,
                ).image,
                fit: BoxFit.fill,
              ),
            )),
      ),
    );

    //
  }

  //
}
