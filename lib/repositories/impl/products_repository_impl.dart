import 'package:smart_dream/models/products/products_product_model.dart';
import 'package:smart_dream/providers/firestore/firestore_products_provider.dart';
import 'package:smart_dream/repositories/contracts/products_repository_impl.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  //

  final FirestoreProductsProvider _productsProvider;

  ProductsRepositoryImpl() : _productsProvider = FirestoreProductsProvider();

  @override
  Future<List<ProductsProductModel>> fetchProducts() async {
    List<dynamic> rawData = await _productsProvider.fetchProducts();

    List<ProductsProductModel> list = [];

    for (var i = 0; i < rawData.length; i++) {
      ProductsProductModel productModel;

      productModel = ProductsProductModel(
        id: rawData[i]['id'],
        name: rawData[i]['name'],
        price: rawData[i]['price'],
        image: rawData[i]['image'],
      );

      list.add(productModel);
    }

    return list;
  }

  //
}
