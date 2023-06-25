import 'package:bloc/bloc.dart';
import 'package:di4l_pos/common/helpers.dart';
import 'package:di4l_pos/enums/status_type.dart';
import 'package:di4l_pos/get_it.dart';
import 'package:di4l_pos/models/delivery/request/connect_ghtk_request.dart';
import 'package:di4l_pos/models/delivery/response/connect_ghtk_response.dart';
import 'package:di4l_pos/repositories/data_repository.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

part 'connect_ghtk_state.dart';
part 'connect_ghtk_cubit.freezed.dart';

class ConnectGhtkCubit extends Cubit<ConnectGhtkState> {
  final _dataRepository = getIt<DataRepository>();

  ConnectGhtkCubit()
      : super(const ConnectGhtkState.initial(data: ConnectGhtkStateData()));

  Future<void> getLocationsGHTK({required dynamic token}) async {
    try {
      String check = await checkEmpty(token);
      if (check.isNotEmpty) {
        emit(ConnectGhtkState.error(data: state.data!.copyWith(error: check)));
        await Future<void>.delayed(const Duration(seconds: 1));
        emit(ConnectGhtkState.error(data: state.data!.copyWith(error: '')));
      } else {
        emit(ConnectGhtkState.status(
            data: state.data!
                .copyWith(status: StatusType.loading, error: 'Loading...')));
        final _request = ConnectGhtkRequest(token: token);
        final _response = await _dataRepository.connectGHTK(request: _request);
        if (_response.success != true) {
          await Future.delayed(
              const Duration(seconds: 1), () => navigator!.pop());
          emit(ConnectGhtkState.status(
              data: state.data!.copyWith(
                  status: StatusType.loaded,
                  locationsGHTK: _response.data ?? [],
                  error: _response.message ?? '')));
        } else {
          await Future.delayed(
              const Duration(seconds: 1), () => navigator!.pop());
          emit(ConnectGhtkState.status(
              data: state.data!.copyWith(
                  status: StatusType.loaded,
                  locationsGHTK: _response.data ?? [],
                  error: _response.message ?? '')));
        }
      }
    } catch (error) {
      debugPrint('Error: $error');
      emit(ConnectGhtkState.status(
          data: state.data!.copyWith(
              status: StatusType.error, error: 'Something went wrong')));
      Helpers.handleErrorApp(error: error);
    } finally {
      Future.delayed(const Duration(seconds: 2), () => navigator!.pop());
    }
  }
}

Future<String> checkEmpty(dynamic token) async {
  if (token.isEmpty) {
    return 'Token is Required';
  } else {
    return '';
  }
}
