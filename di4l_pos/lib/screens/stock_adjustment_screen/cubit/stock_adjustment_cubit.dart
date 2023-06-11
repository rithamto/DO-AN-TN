import 'package:di4l_pos/common/helpers.dart';
import 'package:di4l_pos/common/ui_helpers.dart';
import 'package:di4l_pos/enums/status_type.dart';
import 'package:di4l_pos/get_it.dart';
import 'package:di4l_pos/models/stock_adjustment/response/stock_adjustment_detail_response.dart';
import 'package:di4l_pos/models/stock_adjustment/response/stock_adjustment_response.dart';
import 'package:di4l_pos/repositories/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'stock_adjustment_cubit.freezed.dart';
part 'stock_adjustment_state.dart';

class StockAdjustmentCubit extends Cubit<StockAdjustmentState> {
  /// MAKR: - Initials;
  final _dataRepository = getIt<DataRepository>();

  StockAdjustmentCubit()
      : super(const StockAdjustmentState.initial(
            data: StockAdjustmentStateData()));
  Future<void> getStockAdjustments() async {
    try {
      emit(Status(data: state.data?.copyWith(status: StatusType.loading)));
      final responses = await _dataRepository.getStockAdjustments();
      emit(GetStockAdjustments(
          data: state.data?.copyWith(
        status: StatusType.loaded,
        stockAdjustments: responses.data ?? [],
      )));
    } catch (error) {
      emit(Status(data: state.data?.copyWith(status: StatusType.error)));
      Helpers.handleErrorApp(error: error);
    }
  }

  Future<void> getStockAdjustmentsDetail({required int id}) async {
    try {
      emit(Status(data: state.data?.copyWith(status: StatusType.loading)));
      final responses = await _dataRepository.getStockAdjustmentsDetail(id: id);
      emit(GetStockAdjustmentDetail(
          data: state.data?.copyWith(
        status: StatusType.loaded,
        stockAdjustmentDetail: responses.stockAdjustment,
      )));
      emit(GetActivities(
          data: state.data?.copyWith(
        status: StatusType.loaded,
        activities: responses.activities ?? [],
      )));
    } catch (error) {
      emit(Status(data: state.data?.copyWith(status: StatusType.error)));
      Helpers.handleErrorApp(error: error);
    }
  }

  void getStockAdjustment(StockAdjustmentData? stockAdjustmentData) {
    emit(StockAdjustmentState.getStockAdjustment(
        data: state.data?.copyWith(stockAdjustment: stockAdjustmentData)));
  }

  Future<void> deleteStockAdjustment({required int id}) async {
    UIHelpers.showCustomDialog(
      context: Get.context!,
      message: 'message_confirm_delete_stockadjustment'.tr,
      onComfirm: () async {
        UIHelpers.showLoading();
        try {
          await _dataRepository.deleteStockAdjustment(id: id);
          await Future.delayed(const Duration(microseconds: 200), () {
            navigator!.pop();
            getStockAdjustments();
          });
        } catch (error) {
          debugPrint('Delete Stock Adjustment Error: $error');
          Helpers.handleErrorApp(error: error);
        } finally {
          UIHelpers.dismissLoading();
        }
      },
      isShowClose: true,
    );
  }
}
