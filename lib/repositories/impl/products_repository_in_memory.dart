import 'package:smart_dream/models/products/products_product_model.dart';
import 'package:smart_dream/repositories/contracts/products_repository_impl.dart';

class ProductsRepositoryInMemoryImpl implements ProductsRepository {
  //

  @override
  Future<List<ProductsProductModel>> fetchProducts() async {
    //

    return [
      ProductsProductModel(
        id: '1',
        name: 'Hotdog',
        price: 1.50,
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Hot_dog_on_a_plate_-_Evan_Swigart.jpg/245px-Hot_dog_on_a_plate_-_Evan_Swigart.jpg',
      ),
      ProductsProductModel(
        id: '2',
        name: 'Hamburguesa',
        price: 6.00,
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/NCI_Visuals_Food_Hamburger.jpg/1024px-NCI_Visuals_Food_Hamburger.jpg',
      ),
      ProductsProductModel(
        id: '3',
        name: 'Cocacola',
        price: 1.25,
        image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/15-09-26-RalfR-WLC-0098.jpg/320px-15-09-26-RalfR-WLC-0098.jpg',
      )
    ];

    //
  }

  //
}
