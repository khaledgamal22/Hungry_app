class ProductModel {
  final int id;
  final String name;
  final String description;
  final String price;
  final String image;
  final String rating;

  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.rating,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: json['price'],
      image: json["image"].replaceFirst("http://", "https://"),
      rating: json['rating'].toString(),
    );
  }
}
