import 'package:equatable/equatable.dart';

class ProductsProductModel extends Equatable {
  //

  final String id;
  final String name;
  final double price;
  final String image;

  const ProductsProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  @override
  List<Object> get props => [
        id,
        name,
        price,
        image,
      ];

  @override
  String toString() =>
      'ProductsProductModel { id: $id, name: $name, price: $price, image: $image }';

  //
}
