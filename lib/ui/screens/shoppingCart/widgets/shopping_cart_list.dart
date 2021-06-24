import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dream/cubit/shoppingCart/shopping_cart_cubit.dart';
import 'package:smart_dream/models/shoppingCart/shopping_cart_product_model.dart';
import 'package:smart_dream/generated/l10n.dart';
import 'package:smart_dream/config/app.dart' as Config;
import 'package:smart_dream/ui/screens/shoppingCart/widgets/shopping_cart_botton.dart';
import 'package:smart_dream/ui/screens/shoppingCart/widgets/shopping_cart_image.dart';

class ShoppingCartList extends StatefulWidget {
  //

  @override
  _ShoppingCartListState createState() => _ShoppingCartListState();

  //
}

class _ShoppingCartListState extends State<ShoppingCartList> {
  //

  final Color colorPrimary = Config.APP_COLORS_PRIMARY;
  final double mediumSize = Config.APP_FONT_SIZES_MEDIUM;
  final double titleSize = Config.APP_FONT_SIZES_TITLE;
  List<ShoppingCartProductModel> products = [];

  @override
  void initState() {
    //

    final shoppingCartCubitState =
        BlocProvider.of<ShoppingCartCubit>(context).state;

    if (shoppingCartCubitState is ShoppingCartProductDeletedSuccessState) {
      products = shoppingCartCubitState.products;
    }

    if (shoppingCartCubitState is ShoppingCartProductAddedSuccessState) {
      products = shoppingCartCubitState.products;
    }

    if (shoppingCartCubitState
        is ShoppingCartProductUnitsIncreasedSuccessState) {
      products = shoppingCartCubitState.products;
    }

    if (shoppingCartCubitState
        is ShoppingCartProductUnitsDecreasedSuccessState) {
      products = shoppingCartCubitState.products;
    }

    if (shoppingCartCubitState is ShoppingCartPurchaseMadeFailureState) {
      products = shoppingCartCubitState.products;
    }

    if (shoppingCartCubitState is ShoppingCartPurchaseMadeSuccessState) {
      products = [];
    }

    super.initState();

    //
  }

  @override
  Widget build(BuildContext context) {
    //

    return BlocListener<ShoppingCartCubit, ShoppingCartState>(
      listener: (context, state) {
        //

        if (state is ShoppingCartProductDeletedSuccessState) {
          setState(() {
            products = state.products;
          });
        }

        if (state is ShoppingCartProductAddedSuccessState) {
          setState(() {
            products = state.products;
          });
        }

        if (state is ShoppingCartProductUnitsIncreasedSuccessState) {
          setState(() {
            products = state.products;
          });
        }

        if (state is ShoppingCartProductUnitsDecreasedSuccessState) {
          setState(() {
            products = state.products;
          });
        }

        if (state is ShoppingCartPurchaseMadeFailureState) {
          setState(() {
            products = state.products;
          });
        }

        if (state is ShoppingCartPurchaseMadeSuccessState) {
          setState(() {
            products = [];
          });
        }

        //
      },
      child: (products.length == 0)
          ? Center(
              child: Text(
                AppLocalizations.of(context).shoppingCartScreenNoProducts,
                style: TextStyle(
                  fontSize: mediumSize,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 160),
                  child: ListView.builder(
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      return Center(
                        child: Container(
                          width: 500,
                          height: 120,
                          child: Card(
                            margin: EdgeInsets.only(
                              top: 5,
                              left: 12.5,
                              right: 12.5,
                            ),
                            elevation: 2.0,
                            child: Column(
                              children: [
                                Row(
                                  children: <Widget>[
                                    ShoppingCartImage(
                                      imageUrl: products[index].image,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: 10,
                                          ),
                                          child: Center(
                                            child: Text(
                                              products[index].name,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                            vertical: 10,
                                          ),
                                          height: 1,
                                          width: 200,
                                          color: colorPrimary,
                                        ),
                                        Center(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                              top: 5,
                                              bottom: 10,
                                            ),
                                            child: Text(
                                              '\$ ${products[index].price * products[index].totalUnits}',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Column(
                                      children: [
                                        IconButton(
                                          splashRadius: 20,
                                          iconSize: 30,
                                          color: colorPrimary,
                                          onPressed: () {
                                            _onIncreaseUnitsButtonPressed(
                                                products[index]);
                                          },
                                          icon: Icon(
                                            Icons.arrow_drop_up,
                                          ),
                                        ),
                                        Text('X ${products[index].totalUnits}'),
                                        IconButton(
                                          splashRadius: 20,
                                          iconSize: 30,
                                          color: colorPrimary,
                                          onPressed: () {
                                            _onDecreaseUnitsButtonPressed(
                                                products[index]);
                                          },
                                          icon: Icon(
                                            Icons.arrow_drop_down,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 50,
                      bottom: 100,
                    ),
                    child: Text(
                      '\$ ${_getTotalPrice(products)}',
                      style: TextStyle(
                        fontSize: titleSize,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: ShoppingCartButton(
                    title: AppLocalizations.of(context)
                        .shoppingCartScreenPurchaseButton,
                    onPressed: () {
                      _onPurchaseButtonPressed();
                    },
                  ),
                ),
              ],
            ),
    );

    //
  }

  void _onPurchaseButtonPressed() {
    BlocProvider.of<ShoppingCartCubit>(context).purchaseProducts();
  }

  void _onIncreaseUnitsButtonPressed(
      ShoppingCartProductModel shoppingCartProduct) {
    BlocProvider.of<ShoppingCartCubit>(context)
        .increaseProductUnits(shoppingCartProduct);
  }

  void _onDecreaseUnitsButtonPressed(
      ShoppingCartProductModel shoppingCartProduct) {
    BlocProvider.of<ShoppingCartCubit>(context)
        .decreaseProductUnits(shoppingCartProduct);
  }

  double _getTotalPrice(List<ShoppingCartProductModel> totalProducts) {
    double totalPrice = 0;

    for (var i = 0; i < totalProducts.length; i++) {
      totalPrice =
          totalPrice + (totalProducts[i].price * totalProducts[i].totalUnits);
    }

    return totalPrice;
  }

  //
}
