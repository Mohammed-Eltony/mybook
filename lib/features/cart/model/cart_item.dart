class CartItem {
  int? itemId;
  int? itemProductId;
  String? itemProductName;
  String? itemProductImage;
  String? itemProductPrice;
  int? itemProductDiscount;
  double? itemProductPriceAfterDiscount;
  int? itemProductStock;
  int? itemQuantity;
  double? itemTotal;

  CartItem({
    this.itemId,
    this.itemProductId,
    this.itemProductName,
    this.itemProductImage,
    this.itemProductPrice,
    this.itemProductDiscount,
    this.itemProductPriceAfterDiscount,
    this.itemProductStock,
    this.itemQuantity,
    this.itemTotal,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      itemId: json['item_id'] as int?,
      itemProductId: json['item_product_id'] as int?,
      itemProductName: json['item_product_name'] as String?,
      itemProductImage: json['item_product_image'] as String?,
      itemProductPrice: json['item_product_price'] as String?,
      itemProductDiscount: json['item_product_discount'] as int?,
      itemProductPriceAfterDiscount:
          (json['item_product_price_after_discount'] as num?)?.toDouble(),
      itemProductStock: json['item_product_stock'] as int?,
      itemQuantity: json['item_quantity'] as int?,
      itemTotal: (json['item_total'] as num?)?.toDouble(),
    );
  }
}
