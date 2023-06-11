part of 'stock_adjustment_cubit.dart';

@freezed
class StockAdjustmentStateData with _$StockAdjustmentStateData {
  const factory StockAdjustmentStateData({
    @Default(StatusType.init) StatusType status,
    @Default([]) List<StockAdjustmentData> stockAdjustments,
    StockAdjustmentData? stockAdjustment,
    StockAdjustment? stockAdjustmentDetail,
    @Default([]) List<Activities> activities,
  }) = _StockAdjustmentStateData;
}

@freezed
class StockAdjustmentState with _$StockAdjustmentState {
  const factory StockAdjustmentState.initial({StockAdjustmentStateData? data}) =
      Initial;
  const factory StockAdjustmentState.status({StockAdjustmentStateData? data}) =
      Status;
  const factory StockAdjustmentState.getStockAdjustments(
      {StockAdjustmentStateData? data}) = GetStockAdjustments;
  const factory StockAdjustmentState.getStockAdjustment(
      {StockAdjustmentStateData? data}) = GetStockAdjustment;
  const factory StockAdjustmentState.getStockAdjustmentDetail(
      {StockAdjustmentStateData? data}) = GetStockAdjustmentDetail;
  const factory StockAdjustmentState.getActivities(
      {StockAdjustmentStateData? data}) = GetActivities;
}
