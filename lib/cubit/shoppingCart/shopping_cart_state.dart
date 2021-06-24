part of 'shopping_cart_cubit.dart';

abstract class ShoppingCartState extends Equatable {
  const ShoppingCartState();

  @override
  List<Object> get props => [];
}

class ShoppingCartInitialState extends ShoppingCartState {}

class ShoppingCartProductAddedSuccessState extends ShoppingCartState {
  //

  final List<ShoppingCartProductModel> products;

  ShoppingCartProductAddedSuccessState({
    required this.products,
  });

  @override
  List<Object> get props => [
        products,
      ];

  @override
  String toString() =>
      'ShoppingCartProductAddedSuccessState: { products: $products }';

  //
}

class ShoppingCartProductDeletedSuccessState extends ShoppingCartState {
  //

  final List<ShoppingCartProductModel> products;

  ShoppingCartProductDeletedSuccessState({
    required this.products,
  });

  @override
  List<Object> get props => [
        products,
      ];

  @override
  String toString() =>
      'ShoppingCartProductDeletedSuccessState: { products: $products }';

  //
}

class ShoppingCartLoadingState extends ShoppingCartState {}

class ShoppingCartProductUnitsIncreasedSuccessState extends ShoppingCartState {
  //

  final List<ShoppingCartProductModel> products;

  ShoppingCartProductUnitsIncreasedSuccessState({
    required this.products,
  });

  @override
  List<Object> get props => [
        products,
      ];

  @override
  String toString() =>
      'ShoppingCartProductUnitsIncreasedSuccessState: { products: $products }';

  //
}

class ShoppingCartProductUnitsDecreasedSuccessState extends ShoppingCartState {
  //

  final List<ShoppingCartProductModel> products;

  ShoppingCartProductUnitsDecreasedSuccessState({
    required this.products,
  });

  @override
  List<Object> get props => [
        products,
      ];

  @override
  String toString() =>
      'ShoppingCartProductUnitsDecreasedSuccessState: { products: $products }';

  //
}

class ShoppingCartPurchaseMadeSuccessState extends ShoppingCartState {}

class ShoppingCartPurchaseMadeFailureState extends ShoppingCartState {
  //

  final bool shoppingCartNeedsMoreItems;
  final List<ShoppingCartProductModel> products;
  final String? errorMessage;

  ShoppingCartPurchaseMadeFailureState({
    required this.shoppingCartNeedsMoreItems,
    required this.products,
    this.errorMessage,
  });

  @override
  List<Object> get props => [
        shoppingCartNeedsMoreItems,
        products,
      ];

  @override
  String toString() =>
      'ShoppingCartPurchaseMadeFailureState: { shoppingCartNeedsMoreItems: $shoppingCartNeedsMoreItems, errorMessage: $errorMessage, products: $products }';

  //
}
