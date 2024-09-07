class ProductModel {
  final dynamic id;
  final String title;
  final double price;
  final String description;
  final String image;
  final RatingModel rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.image,
    required this.rating,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['id'],
      title: jsonData['title'],
      price: (jsonData['price'] is int)
          ? (jsonData['price'] as int).toDouble()
          : jsonData['price'].toDouble(),
      description: jsonData['description'],
      image: jsonData['image'],
      rating: RatingModel.fromJson(jsonData['rating']),
    );
  }

  get category => null;
}

class RatingModel {
  final double rate;
  final int count;

  RatingModel({required this.rate, required this.count});

  factory RatingModel.fromJson(Map<String, dynamic> jsonData) {
    return RatingModel(
      rate: (jsonData['rate'] is int)
          ? (jsonData['rate'] as int).toDouble()
          : jsonData['rate'].toDouble(),
      count: jsonData['count'],
    );
  }
}
