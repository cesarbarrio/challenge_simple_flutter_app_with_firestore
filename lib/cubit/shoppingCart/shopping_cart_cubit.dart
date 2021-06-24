import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_dream/models/shoppingCart/shopping_cart_product_model.dart';
import 'package:smart_dream/repositories/contracts/shopping_cart_repository.dart';

part 'shopping_cart_state.dart';

const int MIN_PRODUCTS_TO_PURCHASE = 1;

class ShoppingCartCubit extends Cubit<ShoppingCartState> {
  //

  ShoppingCartRepository _shoppingCartRepository;

  ShoppingCartCubit({required ShoppingCartRepository shoppingCartRepository})
      : _shoppingCartRepository = shoppingCartRepository,
        super(ShoppingCartInitialState());

  List<ShoppingCartProductModel> products = [];

  void addProduct(ShoppingCartProductModel product) {
    //

    emit(ShoppingCartLoadingState());

    //The product won't be added if it is already added
    if (!(_checkProductIsAdded(product.id))) {
      products.add(product);

      emit(ShoppingCartProductAddedSuccessState(
        products: products,
      ));
    }

    //
  }

  void deleteProduct(ShoppingCartProductModel product) {
    //

    emit(ShoppingCartLoadingState());

    //The product won't be deleted if it is not in the shopping cart
    if ((_checkProductIsAdded(product.id))) {
      products.remove(product);

      emit(ShoppingCartProductDeletedSuccessState(
        products: products,
      ));
    }

    //
  }

  void increaseProductUnits(ShoppingCartProductModel product) {
    //

    emit(ShoppingCartLoadingState());

    //The product units won't be increased if the product is not in the shopping cart
    if ((_checkProductIsAdded(product.id))) {
      int productIndex = products.indexOf(product);

      ShoppingCartProductModel productIncreased = ShoppingCartProductModel(
        id: product.id,
        name: product.name,
        image: product.image,
        price: product.price,
        totalUnits: products[productIndex].totalUnits + 1,
      );

      products[productIndex] = productIncreased;

      emit(ShoppingCartProductUnitsIncreasedSuccessState(
        products: products,
      ));
    }

    //
  }

  void decreaseProductUnits(ShoppingCartProductModel product) {
    //

    emit(ShoppingCartLoadingState());

    //The product units won't be decreased if the product is not in the shopping cart
    if ((_checkProductIsAdded(product.id))) {
      //

      int productIndex = products.indexOf(product);

      //The product will be deleted if it has only one unit
      if (products[productIndex].totalUnits <= 1) {
        deleteProduct(product);
      } else {
        ShoppingCartProductModel productDecreased = ShoppingCartProductModel(
          id: product.id,
          name: product.name,
          image: product.image,
          price: product.price,
          totalUnits: products[productIndex].totalUnits - 1,
        );

        products[productIndex] = productDecreased;

        emit(ShoppingCartProductUnitsDecreasedSuccessState(
          products: products,
        ));
      }

      //
    }

    //
  }

  void purchaseProducts() async {
    //

    emit(ShoppingCartLoadingState());

    //If the shopping cart doesn't have a min amount of products it will throw an error
    if (products.length < MIN_PRODUCTS_TO_PURCHASE) {
      emit(ShoppingCartPurchaseMadeFailureState(
        shoppingCartNeedsMoreItems: true,
        products: products,
      ));
    } else {
      try {
        //

        await _shoppingCartRepository.purchaseProducts(products);

        products = [];
        emit(ShoppingCartPurchaseMadeSuccessState());

        //
      } catch (error) {
        //
        emit(
          ShoppingCartPurchaseMadeFailureState(
            errorMessage: error.toString(),
            shoppingCartNeedsMoreItems: false,
            products: products,
          ),
        );

        //
      }
    }

    //
  }

  bool _checkProductIsAdded(String productId) {
    //

    final int productFound =
        products.indexWhere((element) => element.id == productId);

    return (productFound == -1) ? false : true;

    //
  }

  //
}
