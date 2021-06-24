part of 'products_cubit.dart';

abstract class ProductsState extends Equatable {
  const ProductsState();

  @override
  List<Object> get props => [];
}

class ProductsInitialState extends ProductsState {}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  //

  final List<ProductsProductModel> products;

  ProductsSuccessState({
    required this.products,
  });

  @override
  List<Object> get props => [
        products,
      ];

  @override
  String toString() => 'ProductsSuccessState: { products: $products }';

  //
}

class ProductsFailureState extends ProductsState {
  //

  final String errorMessage;

  ProductsFailureState({
    required this.errorMessage,
  });

  @override
  List<Object> get props => [
        errorMessage,
      ];

  @override
  String toString() => 'ProductsFailureState: { errorMessage: $errorMessage }';

  //
}
