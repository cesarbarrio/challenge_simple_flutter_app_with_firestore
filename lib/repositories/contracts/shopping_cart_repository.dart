import 'package:smart_dream/models/shoppingCart/shopping_cart_product_model.dart';

abstract class ShoppingCartRepository {
  //

  Future<void> purchaseProducts(List<ShoppingCartProductModel> products);

  //
}
