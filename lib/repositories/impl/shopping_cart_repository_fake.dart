import 'package:smart_dream/models/shoppingCart/shopping_cart_product_model.dart';
import 'package:smart_dream/repositories/contracts/shopping_cart_repository.dart';

class ShoppingCartRepositoryFake implements ShoppingCartRepository {
  //

  @override
  Future<void> purchaseProducts(List<ShoppingCartProductModel> products) async {
    //

    await new Future.delayed(const Duration(seconds: 2));

    //
  }

  //
}
