// ignore_for_file: invalid_use_of_visible_for_testing_member

import 'package:di4l_pos/enums/status_type.dart';
import 'package:di4l_pos/get_it.dart';
import 'package:di4l_pos/models/sell/request/add_sell_request.dart';
import 'package:di4l_pos/models/table/response/table_response.dart';
import 'package:di4l_pos/repositories/data_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../models/contacts/response/contacts_response.dart';
import '../../../../../models/products/response/product_response.dart';

part 'add_table_order_state.dart';
part 'add_table_order_cubit.freezed.dart';

class AddTableOrderCubit extends Bloc<AddTableOrderCubit, AddTableOrderState> {
  /// MARK: - Initials;
  final _dataRepository = getIt<DataRepository>();

  AddTableOrderCubit()
      : super(AddTableOrderState.initial(
            data: AddTableOrderStateData(transactionDate: DateTime.now())));

  Future<void> addOrder() async {
    try {
      // var json = SellsRequest(sells: [
      //   Sells(
      //     locationId: state.data!.businessID!,
      //     products: state.data!.products,
      //     discountType: state.data!.discountType,
      //     discountAmount: state.data!.discount.toInt(),
      //     contactId: state.data!.customerSelect!.id,
      //     //transactionDate: state.data!.transactionDate.toString(),
      //     status: "final",
      //   )
      // ]).toJson();
      //log(json.toString());

      final response = await _dataRepository.addSell(
          request: AddSellRequest(sells: [
        SellRequest(
          locationId: state.data!.businessId.toString(),
          products: state.data!.products,
          discountType: state.data!.discountType,
          discountAmount: state.data!.discount,
          contactId: state.data!.customerSelect!.id,
          transactionDate: state.data!.transactionDate.toString(),
          tableId: state.data!.tableId,
          status: "final",
        )
      ]));
      //print(response);
      // if (_response.data != null) {
      //   await Future.delayed(Duration(seconds: 1), () => navigator!.pop());
      //   emit(AddProductState.status(
      //       data: state.data!.copyWith(
      //           status: StatusType.loaded, error: 'add_product_success'.tr)));
      // }
    } catch (error) {
      // emit(AddProductState.status(
      //     data: state.data!.copyWith(
      //         status: StatusType.error, error: 'Something went wrong!')));
      // debugPrint('AddProduct Error: $error');
    } finally {
      // UIHelpers.dismissLoading();
    }
  }

  void setProductSelected(Product product, bool isDell, int? value) {
    Map<Product, int> map = {...state.data!.productsSelected};
    Map<Product, int> entry = <Product, int>{product: value ?? 1};
    List<SellProductRequest> products = [...state.data!.products];
    double sum = 0;
    int count = 0;
    // if (value! < 1) {
    //   map.remove(product);
    // }
    if (isDell) {
      map[product] = (map[product]! - 1);
      if (map[product] == 0 || value == -1) {
        map.remove(product);
      }
    } else {
      if (map.isEmpty) {
        map.addAll(entry);
      } else {
        if (map.containsKey(product)) {
          if (value != null) {
            map[product] = value;
          } else {
            map[product] = (map[product]! + 1);
          }
        } else {
          map.addAll(entry);
        }
      }
    }
    map.forEach((key, value) {
      count += value;
      sum += double.parse(key
              .productVariations!.first!.variations!.first!.defaultSellPrice!) *
          value.toInt();
      products.add(SellProductRequest(
        productId: key.id,
        variantionId: key.productVariations!.first!.id,
      ));
    });
    emit(AddTableOrderState.setProductSelected(state.data?.copyWith(
        productsSelected: map,
        totalAmount: sum,
        countProductSelect: count,
        products: products)));
  }

  void setProductSelectAll(Map<Product, int> values) {
    double sum = 0;
    int cout = 0;
    List<SellProductRequest> products = [...state.data!.products];

    emit(AddTableOrderState.setProductSelectedAll(
        state.data!.copyWith(products: [])));
    values.forEach((key, value) {
      cout += value;
      sum += double.parse(key
              .productVariations!.first!.variations!.first!.defaultSellPrice!) *
          value.toInt();
      products.add(SellProductRequest(
        productId: key.id,
        variantionId: key.productVariations!.first!.id,
      ));
    });
    emit(AddTableOrderState.setProductSelectedAll(state.data!.copyWith(
        productsSelected: values,
        totalAmount: sum,
        countProductSelect: cout,
        products: products)));
  }

  String setDiscountType(
    String value,
  ) {
    emit(AddTableOrderState.setDiscount(
        state.data!.copyWith(discountType: value)));
    return value;
  }

  void setTransactionDate(
    DateTime value,
  ) {
    emit(AddTableOrderState.setTransactionDate(
        state.data!.copyWith(transactionDate: value)));
  }

  void setBusinessId(
    int? value,
  ) {
    emit(AddTableOrderState.setBusinessId(
        state.data!.copyWith(businessId: value)));
  }

  void setCustomerSelect(
    ContactModel? value,
  ) {
    emit(AddTableOrderState.setCustomerSelect(state.data!.copyWith(
      customerSelect: value,
    )));
  }

  void setDiscount(
    double value,
  ) {
    emit(AddTableOrderState.setDiscount(state.data!.copyWith(discount: value)));
  }

  void setTableId(
    int? value,
  ) {
    emit(AddTableOrderState.setTableId(state.data!.copyWith(tableId:value)));
  }

  void setNote(
    String? value,
  ) {
    emit(AddTableOrderState.setNote(state.data!.copyWith(note: value)));
  }
}
