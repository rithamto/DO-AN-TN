import 'dart:convert';

class StockTransfersResponse {
  StockTransfersResponse({this.data});

  List<StockTransfersData>? data;

  StockTransfersResponse copyWith({List<StockTransfersData>? data}) =>
      StockTransfersResponse(data: data ?? this.data);

  factory StockTransfersResponse.fromRawJson(String str) =>
      StockTransfersResponse.fromJson(json.decode(str));

  String? toRawJson() => json.encode(toJson());

  factory StockTransfersResponse.fromJson(Map<String?, dynamic> json) =>
      StockTransfersResponse(
        data: json["data"] == null
            ? null
            : List<StockTransfersData>.from(
                json["data"].map((x) => StockTransfersData.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StockTransfersData {
  int? id;
  String? transactionDate;
  String? refNo;
  String? locationFrom;
  String? locationTo;
  String? finalTotal;
  String? shippingCharges;
  dynamic additionalNotes;
  int? dTRowId;
  String? status;

  StockTransfersData(
      {this.id,
      this.transactionDate,
      this.refNo,
      this.locationFrom,
      this.locationTo,
      this.finalTotal,
      this.shippingCharges,
      this.additionalNotes,
      this.dTRowId,
      this.status});

  StockTransfersData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionDate = json['transaction_date'];
    refNo = json['ref_no'];
    locationFrom = json['location_from'];
    locationTo = json['location_to'];
    finalTotal = json['final_total'];
    shippingCharges = json['shipping_charges'];
    additionalNotes = json['additional_notes'];
    dTRowId = json['DT_RowId'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_date'] = transactionDate;
    data['ref_no'] = refNo;
    data['location_from'] = locationFrom;
    data['location_to'] = locationTo;
    data['final_total'] = finalTotal;
    data['shipping_charges'] = shippingCharges;
    data['additional_notes'] = additionalNotes;
    data['DT_RowId'] = dTRowId;
    data['status'] = status;
    return data;
  }
}
