import 'package:flutter/cupertino.dart';

navigateToMainScreen(BuildContext context) =>
    Navigator.of(context).pushNamed('/');

navigateToShoppingCartScreen(BuildContext context) =>
    Navigator.of(context).pushNamed('/shopping-cart');
