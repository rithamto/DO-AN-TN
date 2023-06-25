part of 'stock_manage_cubit.dart';

@freezed
class StockManageStateData with _$StockManageStateData {
  const factory StockManageStateData({
    @Default([]) List<ReportStockData> reportStockManages,
    @Default([]) List<ReportStockData> reportStockManagesOriginal,
    @Default(false) bool isOpenSearch,
    @Default(false) bool isCategoryScreen,
    @Default(StatusType.init) StatusType status,
    @Default([]) List<Product> products,
    @Default([]) List<Product> productsOriginal,
  }) = _StockManageStateData;
}

@freezed
class StockManageState with _$StockManageState {
  const factory StockManageState.initial({StockManageStateData? data}) =
      Initial;
  const factory StockManageState.getReportStockManages(
      {StockManageStateData? data}) = GetReportStockManages;
  const factory StockManageState.isOpenSearch({StockManageStateData? data}) =
      IsOpenSearch;
  const factory StockManageState.isCategoryScreen(
      {StockManageStateData? data}) = IsCategoryScreen;
  const factory StockManageState.status({StockManageStateData? data}) = Status;
}
