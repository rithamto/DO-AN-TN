class AddStockTransfersRequest {
  String? refNo;
  String? status;
  String? locationId;
  String? transferLocationId;
  dynamic searchProduct;
  String? finalTotal;
  List<Products>? products;
  String? shippingCharges;
  String? additionalNotes;

  AddStockTransfersRequest(
      {this.refNo,
      this.status,
      this.locationId,
      this.transferLocationId,
      this.searchProduct,
      this.finalTotal,
      this.products,
      this.shippingCharges,
      this.additionalNotes});

  AddStockTransfersRequest.fromJson(Map<String, dynamic> json) {
    refNo = json['ref_no'];
    status = json['status'];
    locationId = json['location_id'];
    transferLocationId = json['transfer_location_id'];
    searchProduct = json['search_product'];
    finalTotal = json['final_total'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v));
      });
    }
    shippingCharges = json['shipping_charges'];
    additionalNotes = json['additional_notes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ref_no'] = refNo;
    data['status'] = status;
    data['location_id'] = locationId;
    data['transfer_location_id'] = transferLocationId;
    data['search_product'] = searchProduct;
    data['final_total'] = finalTotal;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    data['shipping_charges'] = shippingCharges;
    data['additional_notes'] = additionalNotes;
    return data;
  }
}

class Products {
  String? lotNoLineId;
  String? productId;
  String? variationId;
  String? enableStock;
  String? quantity;
  String? baseUnitMultiplier;
  String? productUnitId;
  String? subUnitId;
  String? unitPrice;
  String? price;

  Products(
      {this.lotNoLineId,
      this.productId,
      this.variationId,
      this.enableStock,
      this.quantity,
      this.baseUnitMultiplier,
      this.productUnitId,
      this.subUnitId,
      this.unitPrice,
      this.price});

  Products.fromJson(Map<String, dynamic> json) {
    lotNoLineId = json['lot_no_line_id'];
    productId = json['product_id'];
    variationId = json['variation_id'];
    enableStock = json['enable_stock'];
    quantity = json['quantity'];
    baseUnitMultiplier = json['base_unit_multiplier'];
    productUnitId = json['product_unit_id'];
    subUnitId = json['sub_unit_id'];
    unitPrice = json['unit_price'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lot_no_line_id'] = lotNoLineId;
    data['product_id'] = productId;
    data['variation_id'] = variationId;
    data['enable_stock'] = enableStock;
    data['quantity'] = quantity;
    data['base_unit_multiplier'] = baseUnitMultiplier;
    data['product_unit_id'] = productUnitId;
    data['sub_unit_id'] = subUnitId;
    data['unit_price'] = unitPrice;
    data['price'] = price;
    return data;
  }
}

