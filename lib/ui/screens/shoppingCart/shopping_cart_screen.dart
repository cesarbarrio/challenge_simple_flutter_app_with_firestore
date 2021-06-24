import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dream/cubit/shoppingCart/shopping_cart_cubit.dart';
import 'package:smart_dream/generated/l10n.dart';
import 'package:smart_dream/ui/common/loading/loading.dart';
import 'package:smart_dream/ui/screens/shoppingCart/widgets/shopping_cart_list.dart';
import 'package:smart_dream/config/app.dart' as Config;

class ShoppingCartScreen extends StatefulWidget {
  //

  @override
  _ShoppingCartScreenState createState() => _ShoppingCartScreenState();

  //
}

class _ShoppingCartScreenState extends State<ShoppingCartScreen> {
  //

  final double mediumSize = Config.APP_FONT_SIZES_MEDIUM;
  final int snackBarDuration = Config.SNACK_BAR_DURATION_IN_SECONDS;

  @override
  Widget build(BuildContext context) {
    //

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).shoppingCartScreenTitle,
        ),
        elevation: 0.0,
      ),
      body: BlocConsumer<ShoppingCartCubit, ShoppingCartState>(
        listener: (context, state) {
          if (state is ShoppingCartPurchaseMadeSuccessState) {
            _getSnackBar(
              AppLocalizations.of(context).shoppingCartScreenPurchaseSuccess,
              Colors.green,
            );
          }
        },
        builder: (context, state) {
          //

          Widget screen = SizedBox();

          if (state is ShoppingCartLoadingState) {
            screen = Loading();
          }

          if (state is ShoppingCartInitialState) {
            screen = Center(
              child: Text(
                AppLocalizations.of(context).shoppingCartScreenNoProducts,
                style: TextStyle(
                  fontSize: mediumSize,
                ),
                textAlign: TextAlign.center,
              ),
            );
          }

          if (state is ShoppingCartProductAddedSuccessState ||
              state is ShoppingCartProductDeletedSuccessState ||
              state is ShoppingCartProductUnitsIncreasedSuccessState ||
              state is ShoppingCartProductUnitsDecreasedSuccessState ||
              state is ShoppingCartPurchaseMadeSuccessState ||
              state is ShoppingCartPurchaseMadeFailureState) {
            screen = ShoppingCartList();
          }

          return screen;
          //
        },
      ),
    );

    //
  }

  _getSnackBar(String text, Color color) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          height: 50,
          child: Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: mediumSize,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
        ),
        backgroundColor: color,
        duration: Duration(
          seconds: snackBarDuration,
        ),
      ),
    );
  }

  //
}
