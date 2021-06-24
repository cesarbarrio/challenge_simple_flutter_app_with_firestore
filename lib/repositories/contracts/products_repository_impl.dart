import 'package:smart_dream/models/products/products_product_model.dart';

abstract class ProductsRepository {
  //

  Future<List<ProductsProductModel>> fetchProducts();

  //
}
