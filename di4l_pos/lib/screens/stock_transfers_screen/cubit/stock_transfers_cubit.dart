import 'package:di4l_pos/common/helpers.dart';
import 'package:di4l_pos/common/ui_helpers.dart';
import 'package:di4l_pos/enums/status_type.dart';
import 'package:di4l_pos/get_it.dart';
import 'package:di4l_pos/models/stock_transfers/response/stock_transfers_detail_response.dart';
import 'package:di4l_pos/models/stock_transfers/response/stock_transfers_response.dart';
import 'package:di4l_pos/repositories/data_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'stock_transfers_state.dart';
part 'stock_transfers_cubit.freezed.dart';

class StockTransfersCubit extends Cubit<StockTransfersState> {
  final _dataRepository = getIt<DataRepository>();

  StockTransfersCubit()
      : super(
            const StockTransfersState.initial(data: StockTransfersStateData()));

  Future<void> getStockTransfers() async {
    try {
      emit(Status(data: state.data?.copyWith(status: StatusType.loading)));
      final _responses = await _dataRepository.getStockTransfers();
      emit(GetStockTransfers(
          data: state.data?.copyWith(
        status: StatusType.loaded,
        stockTransfers: _responses.data ?? [],
      )));
      print(_responses.data);
    } catch (error) {
      emit(Status(data: state.data?.copyWith(status: StatusType.error)));
      Helpers.handleErrorApp(error: error);
    }
  }

  Future<void> getStockTransferDetail({required int id}) async {
    try {
      emit(Status(data: state.data?.copyWith(status: StatusType.loading)));
      final responses = await _dataRepository.getStockTransferDetail(id: id);
      emit(GetSellTransfers(
          data: state.data?.copyWith(
        status: StatusType.loaded,
        sellTransfers: responses.sellTransfer,
      )));
      emit(GetLocationDetails(
          data: state.data?.copyWith(
        status: StatusType.loaded,
        locationDetails: responses.locationDetails,
      )));
      emit(GetSubject(
          data: state.data?.copyWith(
        status: StatusType.loaded,
        subject: responses.subject,
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

  Future<void> deleteStockTransfer({required int id}) async {
    UIHelpers.showCustomDialog(
      context: Get.context!,
      message: 'message_confirm_delete_stocktransfer'.tr,
      onComfirm: () async {
        UIHelpers.showLoading();
        try {
          await _dataRepository.deleteStockTransfer(id: id);
          await Future.delayed(const Duration(microseconds: 200), () {
            navigator!.pop();
            getStockTransfers();
          });
        } catch (error) {
          debugPrint('Delete Stock Transfer Error: $error');
          Helpers.handleErrorApp(error: error);
        } finally {
          UIHelpers.dismissLoading();
        }
      },
      isShowClose: true,
    );
  }
}
