class Instrument {
  const Instrument({
    required this.name,
    required this.price,
    required this.category,
    required this.imagePath,
    required this.description,
  });

  final String name;
  final String price;
  final String category;
  final String imagePath;
  final String description;

  factory Instrument.fromJson(Map<String, dynamic> json) {
    return Instrument(
      name: json['name'] as String,
      price: json['price'] as String,
      category: json['category'] as String,
      imagePath: json['imagePath'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'category': category,
      'imagePath': imagePath,
      'description': description,
    };
  }
}
