class AddToCartModel {
  final int productId;
  final int quantity;
  final double spicy;
  final List<int> toppings;
  final List<int> sideOptions;

  AddToCartModel({
    required this.productId,
    required this.quantity,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });

  Map<String, dynamic> toMap() {
    return {
      'product_id': productId,
      'quantity': quantity,
      'spicy': spicy,
      'toppings': toppings,
      'side_options': sideOptions,
    };
  }

  AddToCartModel copyWith({
    int? productId,
    int? quantity,
    double? spicy,
    List<int>? toppings,
    List<int>? sideOptions,
  }) {
    return AddToCartModel(
      productId: productId ?? this.productId,
      quantity: quantity ?? this.quantity,
      spicy: spicy ?? this.spicy,
      toppings: toppings ?? this.toppings,
      sideOptions: sideOptions ?? this.sideOptions,
    );
  }
}
