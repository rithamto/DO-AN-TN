import 'dart:convert';

class ItemProduct {
  ItemProduct({
    this.productId,
    this.name,
    this.quantity,
    this.price,
    this.imageUrl,
    this.discountType,
    this.discountAmount,
    this.addOns,
  });

  int? productId;
  String? name;
  int? quantity;
  int? price;
  String? imageUrl;
  String? discountType;
  String? discountAmount;
  List<AddOn>? addOns;

  ItemProduct copyWith({
    int? productId,
    String? name,
    int? quantity,
    int? price,
    String? imageUrl,
    String? discountType,
    String? discountAmount,
    List<AddOn>? addOns,
  }) =>
      ItemProduct(
        productId: productId ?? this.productId,
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
        imageUrl: imageUrl ?? this.imageUrl,
        discountType: discountType ?? this.discountType,
        discountAmount: discountAmount ?? this.discountAmount,
        addOns: addOns ?? this.addOns,
      );

  factory ItemProduct.fromRawJson(String str) =>
      ItemProduct.fromJson(json.decode(str));

  String? toRawJson(ItemProduct itemProduct) =>
      json.encode(toJson(itemProduct));

  factory ItemProduct.fromJson(Map<String?, dynamic> json) => ItemProduct(
        productId: json["product_id"],
        name: json["name"],
        quantity: json["quantity"],
        price: json["price"],
        imageUrl: json["image_url"],
        discountType: json["discount_type"],
        discountAmount: json["discount_amount"],
        addOns: json["add_ons"],
      );

  static Map<String, dynamic> toJson(ItemProduct itemProduct) => {
        "product_id": itemProduct.productId,
        "name": itemProduct.name,
        "quantity": itemProduct.quantity,
        "price": itemProduct.price,
        "image_url": itemProduct.imageUrl,
        "discount_type": itemProduct.discountType,
        "discount_amount": itemProduct.discountAmount,
        "add_ons": itemProduct.addOns,
      };

  static String encode(List<ItemProduct> itemProducts) => json.encode(
        itemProducts
            .map<Map<String, dynamic>>(
                (itemProduct) => ItemProduct.toJson(itemProduct))
            .toList(),
      );

  static List<ItemProduct> decode(String itemProducts) =>
      (json.decode(itemProducts) as List<dynamic>)
          .map<ItemProduct>((item) => ItemProduct.fromJson(item))
          .toList();
}

class AddOn {
  AddOn({
    required this.variationId,
    required this.name,
    required this.quantity,
    required this.price,
  });

  int variationId;
  String name;
  int quantity;
  int price;

  AddOn copyWith({
    int? variationId,
    String? name,
    int? quantity,
    int? price,
  }) =>
      AddOn(
        variationId: variationId ?? this.variationId,
        name: name ?? this.name,
        quantity: quantity ?? this.quantity,
        price: price ?? this.price,
      );

  factory AddOn.fromRawJson(String str) => AddOn.fromJson(json.decode(str));

  String? toRawJson() => json.encode(toJson());

  factory AddOn.fromJson(Map<String?, dynamic> json) => AddOn(
        variationId: json["product_id"] == null ? null : json["addon_id"],
        name: json["name"],
        quantity: json["quantity"],
        price: json["price"],
      );

  Map<String?, dynamic> toJson() => {
        "addon_id": variationId,
        "name": name,
        "quantity": quantity,
        "price": price,
      };
}
