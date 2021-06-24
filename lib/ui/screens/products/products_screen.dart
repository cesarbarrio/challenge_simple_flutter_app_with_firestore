import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dream/config/app.dart' as Config;
import 'package:smart_dream/cubit/products/products_cubit.dart';
import 'package:smart_dream/cubit/shoppingCart/shopping_cart_cubit.dart';
import 'package:smart_dream/generated/l10n.dart';
import 'package:smart_dream/ui/common/error/error_message.dart';
import 'package:smart_dream/ui/common/loading/loading.dart';
import 'package:smart_dream/ui/screens/products/widgets/products_list.dart';

class ProductsScreen extends StatefulWidget {
  //

  @override
  _ProductsScreenState createState() => _ProductsScreenState();

  //
}

class _ProductsScreenState extends State<ProductsScreen> {
  //

  final double mediumSize = Config.APP_FONT_SIZES_MEDIUM;
  final int snackBarDuration = Config.SNACK_BAR_DURATION_IN_SECONDS;

  @override
  Widget build(BuildContext context) {
    //

    return BlocListener<ShoppingCartCubit, ShoppingCartState>(
      listener: (context, state) {
        //

        if (state is ShoppingCartProductAddedSuccessState) {
          _getSnackBar(
            AppLocalizations.of(context).productsScreenProductAdded,
            Colors.green,
          );
        }

        if (state is ShoppingCartProductDeletedSuccessState) {
          _getSnackBar(
            AppLocalizations.of(context).productsScreenProductDeleted,
            Colors.red,
          );
        }

        //
      },
      child: BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, state) {
          //

          Widget screen = SizedBox();

          if (state is ProductsInitialState) {
            //

            BlocProvider.of<ProductsCubit>(context).fetchProducts();

            screen = Loading();

            //
          }

          if (state is ProductsLoadingState) {
            screen = Loading();
          }

          if (state is ProductsSuccessState) {
            screen = RefreshIndicator(
              onRefresh: _onRefresh,
              child: ListView(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  ProductsList(
                    products: state.products,
                  )
                ],
              ),
            );
          }

          if (state is ProductsFailureState) {
            screen = RefreshIndicator(
              onRefresh: _onRefresh,
              child: ErrorMessage(
                message: AppLocalizations.of(context).productsScreenError,
              ),
            );
          }

          return screen;
        },
      ),
    );
    //
  }

  Future<void> _onRefresh() async {
    BlocProvider.of<ProductsCubit>(context).fetchProducts();
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
