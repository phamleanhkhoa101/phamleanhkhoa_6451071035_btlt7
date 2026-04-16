class Product {
  final int id;
  final String title;
  final double price;
  final String description;
  final String thumbnail;

  Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.thumbnail,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: int.tryParse('${json['id']}') ?? 0,
      title: json['title']?.toString() ?? '',
      price: double.tryParse('${json['price']}') ?? 0.0,
      description: json['description']?.toString() ?? '',
      thumbnail: json['thumbnail']?.toString() ?? '',
    );
  }
}