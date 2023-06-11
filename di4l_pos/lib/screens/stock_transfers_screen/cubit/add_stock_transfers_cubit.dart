import 'package:di4l_pos/enums/status_type.dart';
import 'package:di4l_pos/get_it.dart';
import 'package:di4l_pos/models/products/response/product_response.dart';
import 'package:di4l_pos/models/stock_transfers/request/add_stock_transfers_request.dart';
import 'package:di4l_pos/models/transaction/response/transaction_response.dart';
import 'package:di4l_pos/repositories/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_stock_transfers_state.dart';
part 'add_stock_transfers_cubit.freezed.dart';

class AddStockTransfersCubit extends Cubit<AddStockTransfersState> {
  final _dataRepository = getIt<DataRepository>();
  AddStockTransfersCubit()
      : super(const AddStockTransfersState.initial(
            data: AddStockTransfersStateData()));

//   Future<void> addStockAdjustment({
//     String? refNo,
//     required String adjustmentType,
//     // String? transactionDate,
//     int? locationId,
//     String? transferLocationId,
//     dynamic searchProduct,
//     String? finalTotal,
//     int? productId,
//     String? totalAmountRecovered,
//     String? additionalNotes,
//   }) async {
//     try {
//       String check = await checkEmpty(adjustmentType);
//       if (check.isNotEmpty) {
//         emit(AddStockTransfersState.error(
//             data: state.data!.copyWith(error: check)));
//         await Future<void>.delayed(const Duration(seconds: 1));
//         emit(AddStockTransfersState.error(
//             data: state.data!.copyWith(error: '')));
//       } else {
//         emit(AddStockTransfersState.status(
//             data: state.data!
//                 .copyWith(status: StatusType.loading, error: 'Loading...')));

//         final request = AddStockTransfersRequest(
//           locationId: locationId.toString(),
//           transferLocationId: transferLocationId,
//           refNo: refNo,
//           finalTotal: finalTotal,
//           products: ,
//           shippingCharges: ,
// status: ,
// additionalNotes: ,
// searchProduct: ,
//         );
//         final response =
//             await _dataRepository.addStockAdjustment(request: request);
//         if (response.data != null) {
//           await Future.delayed(
//               const Duration(seconds: 1), () => navigator!.pop());
//           emit(AddStockTransfersState.status(
//               data: state.data!.copyWith(
//                   status: StatusType.loaded,
//                   error: 'add_stock_adjustment_success'.tr)));
//         }
//       }
//     } catch (error) {
//       emit(AddStockTransfersState.status(
//           data: state.data!.copyWith(
//               status: StatusType.error, error: 'Something went wrong')));
//       Helpers.handleErrorApp(error: error);
//     } finally {
//       Future.delayed(const Duration(seconds: 2), () => navigator!.pop());
//     }
//   }

  Future<String> checkEmpty(
    String adjustmentType,
  ) async {
    if (adjustmentType.isEmpty) {
      return 'Total Amount Recovered is Required';
    } else {
      return '';
    }
  }
}
