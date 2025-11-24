import 'package:hungry/features/product_details/data/models/topping_model.dart';

class CartItemModel {
  final int productId;
  final int itemId;
  final int quantity;
  final String name;
  final String image;
  final String price;
  final dynamic spicy;
  final List<ToppingModel> toppings;
  final List<ToppingModel> sideOptions;
  CartItemModel({
    required this.productId,
    required this.itemId,
    required this.quantity,
    required this.name,
    required this.image,
    required this.price,
    required this.toppings,
    required this.sideOptions,
    required this.spicy,
  });

  factory CartItemModel.fromJson(Map<String, dynamic> json) {
    return CartItemModel(
      productId: json['product_id'],
      itemId: json['item_id'],
      quantity: json['quantity'],
      name: json['name'],
      image: json['image'].replaceFirst('http://', 'https://'),
      price: json['price'],
      spicy: json['spicy'],
      toppings: (json['toppings'] as List)
          .map((e) => ToppingModel.fromJson(e))
          .toList(),
      sideOptions: (json['side_options'] as List)
          .map((e) => ToppingModel.fromJson(e))
          .toList(),
    );
  }
}
