import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'connect_viettelpost_state.dart';
part 'connect_viettelpost_cubit.freezed.dart';

class ConnectViettelpostCubit extends Cubit<ConnectViettelpostState> {
  ConnectViettelpostCubit() : super(ConnectViettelpostState.initial());
}
