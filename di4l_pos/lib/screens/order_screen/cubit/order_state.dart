part of 'order_cubit.dart';

@freezed
class SalesOrderStateData with _$SalesOrderStateData {
  const factory SalesOrderStateData({
    @Default(StatusType.init) StatusType status,
    @Default([]) List<SellData> sells,
    @Default([]) List<SellData> sellsOriginal,
  }) = _SalesOrderStateData;
}

@freezed
class SalesOrderState with _$SalesOrderState {
  const factory SalesOrderState.initial({
    SalesOrderStateData? data,
  }) = Initial;
  const factory SalesOrderState.status({
    SalesOrderStateData? data,
  }) = Status;
  const factory SalesOrderState.getSell({
    SalesOrderStateData? data,
  }) = GetSell;
  const factory SalesOrderState.addSell({
    SalesOrderStateData? data,
  }) = AddSell;
}
