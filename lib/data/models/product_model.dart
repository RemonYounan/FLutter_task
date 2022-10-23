class ProductModel {
  final int id;
  final String company;
  final String name;
  final String type;
  final String price;
  final String image;
  final String description;
  bool isFavorite = false;

  ProductModel({
    required this.id,
    required this.company,
    required this.name,
    required this.type,
    required this.price,
    required this.image,
    required this.description,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      company: json['company'],
      name: json['name'],
      type: json['type'],
      price: json['price'],
      image: json['image'],
      description: json['description'],
    );
  }
  Map<String, dynamic> tojson() {
    return {
      'id': id,
      'company': company,
      'name': name,
      'type': type,
      'price': price,
      'image': image,
      'description': description,
    };
  }
}
