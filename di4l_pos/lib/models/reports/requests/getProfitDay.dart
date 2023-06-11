class GetProfitDayRq{
  String? locationId;
  String? startDate;
  String? endDate;

  GetProfitDayRq({this.locationId, this.startDate, this.endDate});

  GetProfitDayRq.fromJson(Map<String, dynamic> json) {
    locationId = json['location_id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location_id'] = this.locationId;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    return data;
  }
}