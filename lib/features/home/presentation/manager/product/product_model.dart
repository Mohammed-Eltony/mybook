class ProductModel {
  int? id;
  String? name;
  String? description;
  String? price;
  int? discount;
  double? priceAfterDiscount;
  int? stock;
  int? bestSeller;
  String? image;
  String? category;

  ProductModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.stock,
    this.bestSeller,
    this.image,
    this.category,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        price: json['price'] as String?,
        discount: json['discount'] as int?,
        priceAfterDiscount: (json['price_after_discount'] as num?)?.toDouble(),
        stock: json['stock'] as int?,
        bestSeller: json['best_seller'] as int?,
        image: json['image'] as String?,
        category: json['category'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'description': description,
        'price': price,
        'discount': discount,
        'price_after_discount': priceAfterDiscount,
        'stock': stock,
        'best_seller': bestSeller,
        'image': image,
        'category': category,
      };

  // تجاوز دالة == لمقارنة العناصر بناءً على id
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel && other.id == id;
  }

  // تجاوز hashCode ليتوافق مع ==
  @override
  int get hashCode => id.hashCode;
}
