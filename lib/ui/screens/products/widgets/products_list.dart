import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_dream/cubit/shoppingCart/shopping_cart_cubit.dart';
import 'package:smart_dream/models/products/products_product_model.dart';
import 'package:smart_dream/models/shoppingCart/shopping_cart_product_model.dart';
import 'package:smart_dream/ui/screens/products/widgets/products_button.dart';
import 'package:smart_dream/ui/screens/products/widgets/products_image.dart';
import 'package:smart_dream/generated/l10n.dart';
import 'package:smart_dream/config/app.dart' as Config;

class ProductsList extends StatefulWidget {
  //

  final List<ProductsProductModel> products;

  ProductsList({
    required this.products,
  });

  @override
  _ProductsListState createState() => _ProductsListState();

  //
}

class _ProductsListState extends State<ProductsList> {
  //

  final Color colorPrimary = Config.APP_COLORS_PRIMARY;

  List<ShoppingCartProductModel> shoppingCartProducts = [];

  @override
  void initState() {
    //

    final shoppingCartCubitState =
        BlocProvider.of<ShoppingCartCubit>(context).state;

    if (shoppingCartCubitState is ShoppingCartProductAddedSuccessState) {
      shoppingCartProducts = shoppingCartCubitState.products;
    }

    super.initState();

    //
  }

  @override
  Widget build(BuildContext context) {
    //

    //Listen to the changes of shopping cart cubit to know if a product is already added
    return BlocListener<ShoppingCartCubit, ShoppingCartState>(
      listener: (context, state) {
        //

        if (state is ShoppingCartProductAddedSuccessState) {
          setState(() {
            shoppingCartProducts = state.products;
          });
        }

        if (state is ShoppingCartPurchaseMadeSuccessState) {
          setState(() {
            shoppingCartProducts = [];
          });
        }

        if (state is ShoppingCartProductDeletedSuccessState) {
          setState(() {
            shoppingCartProducts = state.products;
          });
        }

        //
      },
      child: ListView.builder(
        shrinkWrap: true,
        physics: ScrollPhysics(),
        itemCount: widget.products.length,
        itemBuilder: (context, index) {
          return Card(
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
                    ProductImage(
                      imageUrl: widget.products[index].image,
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
                              widget.products[index].name,
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
                              '\$ ${widget.products[index].price}',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                (_checkProductIsAddedToShoppingCart(widget.products[index]))
                    ? ProductsButton(
                        title: AppLocalizations.of(context)
                            .productsScreenDeleteFromShoppingCartButton,
                        onPressed: () {
                          _onDeleteProductButtonPressed(
                              context, widget.products[index]);
                        },
                      )
                    : ProductsButton(
                        title: AppLocalizations.of(context)
                            .productsScreenAddToShoppingCartButton,
                        onPressed: () {
                          _onAddProductButtonPressed(
                              context, widget.products[index]);
                        },
                      ),
              ],
            ),
          );
        },
      ),
    );

    //
  }

  void _onAddProductButtonPressed(
      BuildContext context, ProductsProductModel productsProduct) {
    //

    ShoppingCartProductModel shoppingCartProduct = ShoppingCartProductModel(
      id: productsProduct.id,
      name: productsProduct.name,
      price: productsProduct.price,
      totalUnits: 1,
      image: productsProduct.image,
    );

    BlocProvider.of<ShoppingCartCubit>(context).addProduct(shoppingCartProduct);

    //
  }

  void _onDeleteProductButtonPressed(
      BuildContext context, ProductsProductModel productsProduct) {
    //

    ShoppingCartProductModel shoppingCartProduct = ShoppingCartProductModel(
      id: productsProduct.id,
      name: productsProduct.name,
      price: productsProduct.price,
      totalUnits: 1,
      image: productsProduct.image,
    );

    BlocProvider.of<ShoppingCartCubit>(context)
        .deleteProduct(shoppingCartProduct);

    //
  }

  bool _checkProductIsAddedToShoppingCart(
      ProductsProductModel productsProduct) {
    //

    final int productFound = shoppingCartProducts
        .indexWhere((element) => element.id == productsProduct.id);

    return (productFound == -1) ? false : true;

    //
  }
}
