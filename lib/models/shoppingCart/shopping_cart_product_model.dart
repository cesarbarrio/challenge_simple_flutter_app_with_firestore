import 'package:equatable/equatable.dart';

class ShoppingCartProductModel extends Equatable {
  //

  final String id;
  final String name;
  final double price;
  final String image;
  final int totalUnits;

  const ShoppingCartProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.totalUnits,
    required this.image,
  });

  @override
  List<Object> get props => [
        id,
        name,
        price,
        totalUnits,
        image,
      ];

  @override
  String toString() =>
      'ShoppingCartProductModel { id: $id, name: $name, price: $price, totalUnits: $totalUnits, }';

  //
}
