import 'package:hungry/features/cart/data/models/cart_item_model.dart';

class CartModelResponse {
  final int id;
  final String totalPrice;
  final List<CartItemModel> items;
  CartModelResponse({
    required this.id,
    required this.totalPrice,
    required this.items,
  });

  factory CartModelResponse.fromJson(Map<String, dynamic> json) {
    return CartModelResponse(
      id: json['id'],
      totalPrice: json['total_price'],
      items: (json['items'] as List)
          .map((e) => CartItemModel.fromJson(e))
          .toList(),
    );
  }
}
