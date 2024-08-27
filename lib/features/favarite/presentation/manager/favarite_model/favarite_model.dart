class FavariteModel {
  int? id;
  String? name;
  String? price;
  String? category;
  String? image;
  int? discount;
  int? stock;
  String? description;
  int? bestSeller;

  FavariteModel({
    this.id,
    this.name,
    this.price,
    this.category,
    this.image,
    this.discount,
    this.stock,
    this.description,
    this.bestSeller,
  });

  factory FavariteModel.fromJson(Map<String, dynamic> json) => FavariteModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        price: json['price'] as String?,
        category: json['category'] as String?,
        image: json['image'] as String?,
        discount: json['discount'] as int?,
        stock: json['stock'] as int?,
        description: json['description'] as String?,
        bestSeller: json['best_seller'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'category': category,
        'image': image,
        'discount': discount,
        'stock': stock,
        'description': description,
        'best_seller': bestSeller,
      };

  // تجاوز دالة == لمقارنة العناصر بناءً على id
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is FavariteModel && other.id == id;
  }

  // تجاوز hashCode ليتوافق مع ==
  @override
  int get hashCode => id.hashCode;
}
