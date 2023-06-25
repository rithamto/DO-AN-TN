import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connect_ghn_state.dart';
part 'connect_ghn_cubit.freezed.dart';

class ConnectGhnCubit extends Cubit<ConnectGhnState> {
  ConnectGhnCubit() : super(ConnectGhnState.initial());
}
