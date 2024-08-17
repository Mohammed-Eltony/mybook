class CategoryModel {
  int? id;
  String? name;
  int? productsCount;

  CategoryModel({this.id, this.name, this.productsCount});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] as int?,
        name: json['name'] as String?,
        productsCount: json['products_count'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'products_count': productsCount,
      };
}
