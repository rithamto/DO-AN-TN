import 'package:bloc/bloc.dart';
import 'package:di4l_pos/common/helpers.dart';
import 'package:di4l_pos/common/ui_helpers.dart';
import 'package:di4l_pos/get_it.dart';
import 'package:di4l_pos/models/reports/responses/report_stock_response.dart';
import 'package:di4l_pos/repositories/data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiengviet/tiengviet.dart';

import '../../../enums/status_type.dart';
import '../../../models/products/response/product_response.dart';

part 'stock_manage_cubit.freezed.dart';
part 'stock_manage_state.dart';

class StockManageCubit extends Cubit<StockManageState> {
  /// MARK: - Initials;
  final _dataRepository = getIt<DataRepository>();

  StockManageCubit()
      : super(const StockManageState.initial(data: StockManageStateData()));

  /// Get Report Stocks
  Future<void> getReportStockManages() async {
    try {
      UIHelpers.showLoading();
      emit(StockManageState.status(
          data: state.data?.copyWith(status: StatusType.loading)));
      final stockResponse = await _dataRepository.getReportStockManage();
      emit(
        StockManageState.getReportStockManages(
          data: state.data?.copyWith(
            reportStockManages: stockResponse.data ?? [],
            reportStockManagesOriginal: stockResponse.data ?? [],
            status: StatusType.loaded,
          ),
        ),
      );
    } catch (error) {
      Helpers.handleErrorApp(error: error);
    } finally {
      UIHelpers.dismissLoading();
    }
  }

  Future<void> searchProductStockReports({required String searchText}) async {
    List<ReportStockData> reportStockOriginal = [
      ...state.data!.reportStockManagesOriginal
    ];
    emit(StockManageState.status(
        data: state.data?.copyWith(status: StatusType.loading)));
    if (searchText.isEmpty) {
      emit(
        StockManageState.getReportStockManages(
          data: state.data?.copyWith(
            reportStockManages: reportStockOriginal,
            status: StatusType.loaded,
          ),
        ),
      );
    } else {
      final searchTextVN = TiengViet.parse(searchText.toLowerCase());
      final reportStockData = reportStockOriginal
          .where(
            (ReportStockData element) =>
                element.product!.toLowerCase().contains(searchTextVN),
          )
          .toList();
      emit(StockManageState.getReportStockManages(
          data: state.data?.copyWith(
              reportStockManages: reportStockData, status: StatusType.loaded)));
    }
  }

  void isOpenSearch(bool value) {
    emit(StockManageState.isOpenSearch(
        data: state.data!.copyWith(isOpenSearch: value)));
  }

  void isCategoryScreen(bool value) {
    emit(StockManageState.isCategoryScreen(
        data: state.data!.copyWith(isCategoryScreen: value)));
  }
}
