class ProductCartModel {
  final int productId;
  final int quantity;
  final double spicy;
  final List<int> toppings;
  ProductCartModel({
    required this.productId,
    required this.quantity,
    required this.spicy,
    required this.toppings,
  });

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'quantity': quantity,
      'spicy': spicy,
      'toppings': toppings,
    };
  }
}
