import 'package:bloc/bloc.dart';
import 'package:di4l_pos/common/helpers.dart';
import 'package:di4l_pos/common/ui_helpers.dart';
import 'package:di4l_pos/enums/status_type.dart';
import 'package:di4l_pos/get_it.dart';
import 'package:di4l_pos/models/sell/request/add_sell_request.dart';
import 'package:di4l_pos/models/sell/request/get_sell_request.dart';
import 'package:di4l_pos/models/sell/response/sell_response.dart';
import 'package:di4l_pos/repositories/data_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tiengviet/tiengviet.dart';

part 'order_state.dart';
part 'order_cubit.freezed.dart';

class SalesOrderCubit extends Cubit<SalesOrderState> {
  /// MARK: - Initials;
  final _dataRepository = getIt<DataRepository>();

  SalesOrderCubit()
      : super(const SalesOrderState.initial(data: SalesOrderStateData()));

  Future<void> getSell() async {
    try {
      emit(SalesOrderState.getSell(
          data: state.data?.copyWith(status: StatusType.loading)));
      final request = GetSellRequest();
      final response = await _dataRepository.getSell(request: request);
      emit(SalesOrderState.getSell(
          data: state.data?.copyWith(
              status: StatusType.loaded,
              sells: response.data ?? [],
              sellsOriginal: response.data ?? [])));
    } catch (error) {
      emit(SalesOrderState.getSell(
          data: state.data?.copyWith(status: StatusType.error)));
      Helpers.handleErrorApp(error: error);
    } finally {
      UIHelpers.dismissLoading();
    }
  }

  Future<void> getSellReturn() async {
    try {
      emit(SalesOrderState.getSell(
          data: state.data?.copyWith(status: StatusType.loading)));
      final request = GetSellRequest();
      final response = await _dataRepository.getSellReturn(request: request);
      emit(SalesOrderState.getSell(
          data: state.data?.copyWith(
              status: StatusType.loaded,
              sells: response.data ?? [],
              sellsOriginal: response.data ?? [])));
    } catch (error) {
      emit(SalesOrderState.getSell(
          data: state.data?.copyWith(status: StatusType.error)));
      Helpers.handleErrorApp(error: error);
    } finally {
      UIHelpers.dismissLoading();
    }
  }

  Future<void> searchSell({required String searchText}) async {
    List<SellData> sellOriginal = [...state.data!.sellsOriginal];
    emit(SalesOrderState.status(
        data: state.data?.copyWith(status: StatusType.loading)));
    if (searchText.isEmpty) {
      emit(SalesOrderState.getSell(
          data: state.data
              ?.copyWith(sells: sellOriginal, status: StatusType.loaded)));
    } else {
      final searchTextVN = TiengViet.parse(searchText.toLowerCase());
      final sells = sellOriginal
          .where((element) =>
              element.contact!.name!.toLowerCase().contains(searchTextVN))
          .toList();
      emit(SalesOrderState.getSell(
          data: state.data?.copyWith(sells: sells, status: StatusType.loaded)));
    }
  }

  Future<void> fillterDateTime({DateTime? dateBegin, DateTime? dateEnd}) async {
    List<SellData> sellOriginal = [...state.data!.sellsOriginal];

    emit(SalesOrderState.status(
        data: state.data?.copyWith(status: StatusType.loading)));
    if (dateBegin == null) {
      emit(SalesOrderState.getSell(
          data: state.data
              ?.copyWith(sells: sellOriginal, status: StatusType.loaded)));
    } else {
      //final date = TiengViet.parse(searchText.toLowerCase());
      final sells = sellOriginal.where((element) {
        var date = DateTime.parse(element.transactionDate!);
        return date.isAfter(dateBegin) && date.isBefore(dateEnd!);
      }).toList();

      emit(SalesOrderState.getSell(
          data: state.data?.copyWith(sells: sells, status: StatusType.loaded)));
    }
  }

  Future<void> addSell({required AddSellRequest request}) async {
    try {
      emit(SalesOrderState.addSell(
          data: state.data?.copyWith(status: StatusType.loading)));
      await _dataRepository.addSell(request: request);
      emit(SalesOrderState.addSell(
          data: state.data?.copyWith(status: StatusType.loaded)));
    } catch (error) {
      emit(SalesOrderState.addSell(
          data: state.data?.copyWith(status: StatusType.error)));
      Helpers.handleErrorApp(error: error);
    } finally {
      UIHelpers.dismissLoading();
    }
  }
}
