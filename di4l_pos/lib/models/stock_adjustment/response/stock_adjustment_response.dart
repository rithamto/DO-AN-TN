import 'dart:convert';

class StockAdjustmentResponse {
  StockAdjustmentResponse({this.data});

  List<StockAdjustmentData>? data;

  StockAdjustmentResponse copyWith({List<StockAdjustmentData>? data}) =>
      StockAdjustmentResponse(data: data ?? this.data);

  factory StockAdjustmentResponse.fromRawJson(String str) =>
      StockAdjustmentResponse.fromJson(json.decode(str));

  String? toRawJson() => json.encode(toJson());

  factory StockAdjustmentResponse.fromJson(Map<String?, dynamic> json) =>
      StockAdjustmentResponse(
        data: json["data"] == null
            ? null
            : List<StockAdjustmentData>.from(
                json["data"].map((x) => StockAdjustmentData.fromJson(x))),
      );

  Map<String?, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class StockAdjustmentData {
  int? id;
  String? transactionDate;
  String? refNo;
  String? locationName;
  String? adjustmentType;
  String? finalTotal;
  String? totalAmountRecovered;
  String? additionalNotes;
  int? dTRowId;
  String? addedBy;

  StockAdjustmentData(
      {this.id,
      this.transactionDate,
      this.refNo,
      this.locationName,
      this.adjustmentType,
      this.finalTotal,
      this.totalAmountRecovered,
      this.additionalNotes,
      this.dTRowId,
      this.addedBy});

  StockAdjustmentData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    transactionDate = json['transaction_date'];
    refNo = json['ref_no'];
    locationName = json['location_name'];
    adjustmentType = json['adjustment_type'];
    finalTotal = json['final_total'];
    totalAmountRecovered = json['total_amount_recovered'];
    additionalNotes = json['additional_notes'];
    dTRowId = json['DT_RowId'];
    addedBy = json['added_by'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['transaction_date'] = transactionDate;
    data['ref_no'] = refNo;
    data['location_name'] = locationName;
    data['adjustment_type'] = adjustmentType;
    data['final_total'] = finalTotal;
    data['total_amount_recovered'] = totalAmountRecovered;
    data['additional_notes'] = additionalNotes;
    data['DT_RowId'] = dTRowId;
    data['added_by'] = addedBy;
    return data;
  }
}
