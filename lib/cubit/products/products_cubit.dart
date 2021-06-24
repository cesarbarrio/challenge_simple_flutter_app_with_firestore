import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:smart_dream/models/products/products_product_model.dart';
import 'package:smart_dream/repositories/contracts/products_repository_impl.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  //

  final ProductsRepository _productsRepository;
  List<ProductsProductModel> products = [];

  ProductsCubit({
    required ProductsRepository productsRepository,
  })  : _productsRepository = productsRepository,
        super(ProductsInitialState());

  void fetchProducts() async {
    //

    emit(ProductsLoadingState());
    try {
      //

      products = await _productsRepository.fetchProducts();

      emit(
        ProductsSuccessState(
          products: products,
        ),
      );

      //
    } catch (error) {
      emit(
        ProductsFailureState(errorMessage: error.toString()),
      );

      //
    }

    //
  }

  //
}
