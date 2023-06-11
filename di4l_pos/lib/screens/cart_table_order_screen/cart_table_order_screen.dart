// ignore_for_file: invalid_use_of_protected_member, use_build_context_synchronously

import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:di4l_pos/common/dimensions.dart';
import 'package:di4l_pos/common/global_colors.dart';
import 'package:di4l_pos/common/global_images.dart';
import 'package:di4l_pos/common/global_styles.dart';
import 'package:di4l_pos/common/storage/app_prefs.dart';
import 'package:di4l_pos/enums/status_type.dart';
import 'package:di4l_pos/get_it.dart';
import 'package:di4l_pos/models/cart_table_order/cart_model.dart';
import 'package:di4l_pos/models/table/response/table_response.dart';
import 'package:di4l_pos/route_generator.dart';
import 'package:di4l_pos/screens/cart_table_order_screen/cubit/cart_table_order_cubit.dart';
import 'package:di4l_pos/screens/cart_table_order_screen/cubit/table_order_cubit.dart';
import 'package:di4l_pos/screens/order_table_screen/widgets/custom_divider.dart';
import 'package:di4l_pos/screens/table_order_screen/mobile/table_order_mobile_screen.dart';
import 'package:di4l_pos/screens/table_order_screen/widgets/calculation_view.dart';
import 'package:di4l_pos/screens/table_order_screen/widgets/custom_button_order.dart';
import 'package:di4l_pos/widgets/data/404_widget.dart';
import 'package:di4l_pos/widgets/data/app_loading_widget.dart';
import 'package:di4l_pos/widgets/data/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';

class CartTableOrderScreen extends StatefulWidget {
  static MultiBlocProvider provider() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(
          create: (BuildContext context) => CartCubit(),
        ),
        BlocProvider<TableCubit>(
          create: (BuildContext context) => TableCubit(),
        ),
      ],
      child: const CartTableOrderScreen(),
    );
  }

  const CartTableOrderScreen({Key? key}) : super(key: key);
  @override
  State<CartTableOrderScreen> createState() => _CartTableOrderScreenState();
}

class _CartTableOrderScreenState extends State<CartTableOrderScreen>
    with AfterLayoutMixin {
  /// MARK: - Initials;
  static ValueNotifier<String> selectedTable = ValueNotifier('');
  static ValueNotifier<String> _selectedTable = ValueNotifier('');
  static List<ValueNotifier<int>> tempAddOns = [];
  final tableOrder = Get.put(TableOrderController());
  final _appPrefs = getIt<AppPref>();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  Color primaryColor = GlobalColors.primaryColor;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    context.read<TableCubit>().getTables();
    context.read<CartCubit>().getCart();
    // tableOrder.noteOrder.value = await _appPrefs.getNote() ?? "";
    // tableOrder.selectedTable.value = await _appPrefs.getTable() ?? "";
    selectedTable.value = tableOrder.selectedTable.value;
  }

  int stringDoubleToInt(String? str) {
    return (double.parse(str!)).toInt();
  }

  void increase(int index) {
    tempAddOns[index].value += 1;
  }

  void decrease(int index) {
    if (tempAddOns[index].value > 0) {
      tempAddOns[index].value -= 1;
    }
  }

  int totalPriceOneItem(
      {required int quantity, required int price, List<AddOn>? addOns}) {
    if (addOns != null) {
      int total = 0;
      for (int i = 0; i < addOns.length; i++) {
        total += addOns[i].price * tempAddOns[i].value;
      }
      return total + quantity * price;
    }
    return quantity * price;
  }

  String formatCurrency({required int price}) {
    // return NumberFormat('#,###').format(price);
    return NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
        .format(price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.black,
        ),
        title: Text('cart'.tr),
        titleTextStyle: GlobalStyles.robotoBold(context).copyWith(
          fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
          color: Colors.black,
        ),
        toolbarHeight: 55,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 10,
        shadowColor: Colors.white54,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: BlocBuilder<CartCubit, CartState>(
          builder: (context, stateCart) {
            final hasData =
                (stateCart.data?.listItemProduct)!.isEmpty ? false : true;
            final itemProducts = stateCart.data?.listItemProduct ?? [];
            int total = 0;
            tableOrder.tempTotal.value = [];
            for (int i = 0; i < itemProducts.length; i++) {
              if (itemProducts[i].addOns!.isNotEmpty) {
                int temp = 0;
                for (var addOn in itemProducts[i].addOns!) {
                  temp += addOn.price * addOn.quantity;
                }
                total +=
                    itemProducts[i].price! * itemProducts[i].quantity! + temp;
              } else {
                total += itemProducts[i].price! * itemProducts[i].quantity!;
              }
              tableOrder.tempTotal.add(0);
            }
            tableOrder.totalAmount.value = total;
            int amountCart() {
              int total = 0;
              for (int i = 0; i < itemProducts.length; i++) {
                total += itemProducts[i].quantity!;
              }
              return total;
            }

            switch (stateCart.data!.status) {
              case StatusType.loading:
                return const AppLoadingWidget(
                  widget: null,
                  text: 'Loading...',
                );
              case StatusType.loaded:
                return hasData
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
                        child: Column(
                          children: [
                            BlocBuilder<TableCubit, TableState>(
                              builder: (context, state) {
                                final tables = state.data?.tables ?? [];
                                return Row(
                                  children: [
                                    Expanded(
                                      child: Obx(
                                        () => Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            tableOrder.selectedTable.value == ''
                                                ? InkWell(
                                                    onTap: () {
                                                      setTable(context, tables);
                                                    },
                                                    splashColor:
                                                        Colors.transparent,
                                                    highlightColor:
                                                        Colors.transparent,
                                                    child: Text(
                                                      'select_table'.tr,
                                                      style: GlobalStyles
                                                              .robotoRegular(
                                                                  context)
                                                          .copyWith(
                                                        fontSize: Dimensions
                                                            .FONT_SIZE_LARGE,
                                                        color: Theme.of(context)
                                                            .primaryColor,
                                                      ),
                                                    ),
                                                  )
                                                : Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        setTable(
                                                            context, tables);
                                                      },
                                                      splashColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      child: Text(
                                                        tableOrder.selectedTable
                                                            .value,
                                                        style: GlobalStyles
                                                                .robotoBold(
                                                                    context)
                                                            .copyWith(
                                                          fontSize: Dimensions
                                                              .FONT_SIZE_LARGE,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    ),
                                                  ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setTable(context, tables);
                                      },
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Image.asset(
                                        GlobalImages.iconEdit,
                                        color: Theme.of(context).primaryColor,
                                        width: Dimensions.ICON_SIZE_DEFAULT,
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                            const SizedBox(
                              height: Dimensions.PADDING_SIZE_DEFAULT,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  flex: 4,
                                  child: Text(
                                    'food'.tr,
                                    style: GlobalStyles.robotoBold(context)
                                        .copyWith(
                                      fontSize: Dimensions.FONT_SIZE_LARGE,
                                    ),
                                  ),
                                ),
                                const Text('|'),
                                Expanded(
                                  child: Center(
                                    child: Text(
                                      'qt'.tr,
                                      style: GlobalStyles.robotoBold(context)
                                          .copyWith(
                                        fontSize: Dimensions.FONT_SIZE_LARGE,
                                      ),
                                    ),
                                  ),
                                ),
                                const Text('|'),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'total_item'.tr,
                                    style: GlobalStyles.robotoBold(context)
                                        .copyWith(
                                      fontSize: Dimensions.FONT_SIZE_LARGE,
                                    ),
                                    textAlign: TextAlign.right,
                                  ),
                                ),
                                const Expanded(child: SizedBox()),
                              ],
                            ),
                            const SizedBox(
                                height: Dimensions.PADDING_SIZE_SMALL),
                            const CustomDivider(height: 1),
                            ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: itemProducts.length,
                                shrinkWrap: true,
                                itemBuilder: (context, indexCart) {
                                  final itemProduct = itemProducts[indexCart];
                                  String addon = '';
                                  for (var addOn in itemProduct.addOns!) {
                                    if (addOn.quantity > 0) {
                                      addon =
                                          '$addon${addOn.name} (${addOn.quantity}) ';
                                    }
                                  }
                                  List<AddOn> addOns = [];
                                  if (itemProduct.addOns!.isNotEmpty) {
                                    int temp = 0;
                                    for (int j = 0;
                                        j < itemProduct.addOns!.length;
                                        j++) {
                                      addOns.add(itemProduct.addOns![j]);
                                      temp += itemProduct.addOns![j].price *
                                          itemProduct.addOns![j].quantity;
                                    }
                                    tableOrder.tempTotal[indexCart] =
                                        itemProduct.price! *
                                                itemProduct.quantity! +
                                            temp;
                                  } else {
                                    tableOrder.tempTotal[indexCart] =
                                        itemProduct.price! *
                                            itemProduct.quantity!;
                                  }

                                  // tableOrder.tempTotal[indexCart] =
                                  //     totalPriceOneItem(
                                  //         quantity:
                                  //             tableOrder.tempQuantity.value,
                                  //         price: itemProduct.price!,
                                  //         addOns: addOns);

                                  return InkWell(
                                    onTap: () {
                                      tableOrder.tempQuantity.value =
                                          itemProduct.quantity!;
                                      tempAddOns = [];
                                      if (itemProduct.addOns!.isNotEmpty) {
                                        for (int j = 0;
                                            j < itemProduct.addOns!.length;
                                            j++) {
                                          tempAddOns.add(ValueNotifier<int>(
                                              itemProduct.addOns![j].quantity));
                                        }
                                      }
                                      showModalBottomSheet(
                                          context: context,
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          builder: (context) {
                                            tableOrder.totalOneItem.value =
                                                totalPriceOneItem(
                                                    quantity: tableOrder
                                                        .tempQuantity.value,
                                                    price: itemProduct.price!,
                                                    addOns: addOns);
                                            return Container(
                                              padding: const EdgeInsets.all(
                                                  Dimensions
                                                      .PADDING_SIZE_DEFAULT),
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade100,
                                                borderRadius:
                                                    const BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(20),
                                                        topRight:
                                                            Radius.circular(
                                                                20)),
                                              ),
                                              child: SingleChildScrollView(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    mainAxisSize:
                                                        MainAxisSize.min,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child:
                                                                Image.network(
                                                              itemProduct
                                                                  .imageUrl!,
                                                              width: 130,
                                                              height: 130,
                                                              fit: BoxFit.cover,
                                                            ),
                                                          ),
                                                          const SizedBox(
                                                            width: 20,
                                                          ),
                                                          Expanded(
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Flexible(
                                                                      child:
                                                                          Text(
                                                                        "${itemProduct.name}",
                                                                        style: GlobalStyles.robotoBold(context)
                                                                            .copyWith(
                                                                          fontSize:
                                                                              25,
                                                                        ),
                                                                        maxLines:
                                                                            2,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height: 10),
                                                                Text(
                                                                  formatCurrency(
                                                                      price: itemProduct
                                                                          .price!),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                  style:
                                                                      const TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        20,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: Dimensions
                                                              .PADDING_SIZE_SMALL),
                                                      description(context),
                                                      const SizedBox(
                                                          height: Dimensions
                                                              .PADDING_SIZE_SMALL),
                                                      if (addOns.isNotEmpty)
                                                        addonsView(
                                                            context,
                                                            addOns,
                                                            itemProduct.price!),
                                                      const SizedBox(
                                                          height: Dimensions
                                                              .PADDING_SIZE_DEFAULT),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          editButton(
                                                            width: 30,
                                                            height: 30,
                                                            icon: Icons.remove,
                                                            iconSize: 20,
                                                            onTap: () {
                                                              if (tableOrder
                                                                      .tempQuantity
                                                                      .value >
                                                                  0) {
                                                                tableOrder
                                                                    .tempQuantity
                                                                    .value = tableOrder
                                                                        .tempQuantity
                                                                        .value -
                                                                    1;
                                                                tableOrder.totalOneItem.value = totalPriceOneItem(
                                                                    quantity: tableOrder
                                                                        .tempQuantity
                                                                        .value,
                                                                    price: itemProduct
                                                                        .price!,
                                                                    addOns:
                                                                        addOns);
                                                              }
                                                            },
                                                          ),
                                                          Obx(
                                                            () => SizedBox(
                                                              width: 50,
                                                              child: Center(
                                                                child: Text(
                                                                  '${tableOrder.tempQuantity.value}',
                                                                  style: GlobalStyles
                                                                          .robotoBold(
                                                                              context)
                                                                      .copyWith(
                                                                    fontSize:
                                                                        Dimensions
                                                                            .FONT_SIZE_EXTRA_LARGE,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                          editButton(
                                                            width: 30,
                                                            height: 30,
                                                            icon: Icons.add,
                                                            iconSize: 20,
                                                            onTap: () {
                                                              tableOrder
                                                                  .tempQuantity
                                                                  .value = tableOrder
                                                                      .tempQuantity
                                                                      .value +
                                                                  1;
                                                              tableOrder.totalOneItem
                                                                      .value =
                                                                  totalPriceOneItem(
                                                                      quantity: tableOrder
                                                                          .tempQuantity
                                                                          .value,
                                                                      price: itemProduct
                                                                          .price!,
                                                                      addOns:
                                                                          addOns);
                                                            },
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: Dimensions
                                                              .PADDING_SIZE_EXTRA_LARGE),
                                                      CustomButton2(
                                                        height: 45,
                                                        width: Get.width - 60,
                                                        buttonText:
                                                            'update_in_cart'.tr,
                                                        printTotal: true,
                                                        onPressed: () async {
                                                          for (int i = 0;
                                                              i <
                                                                  tableOrder
                                                                      .productsInCart
                                                                      .length;
                                                              i++) {
                                                            if (itemProduct
                                                                    .productId ==
                                                                tableOrder
                                                                    .productsInCart[
                                                                        i]
                                                                    .productId) {
                                                              if (tableOrder
                                                                      .tempQuantity
                                                                      .value ==
                                                                  0) {
                                                                _globalKey
                                                                    .currentContext!
                                                                    .read<
                                                                        CartCubit>()
                                                                    .removeProductAt(
                                                                        index:
                                                                            indexCart);
                                                                for (int i = 0;
                                                                    i <
                                                                        addOns
                                                                            .length;
                                                                    i++) {
                                                                  addOns[i]
                                                                      .quantity = 0;
                                                                }
                                                                tableOrder
                                                                    .amountCart
                                                                    .value = 0;
                                                                for (int i = 0;
                                                                    i <
                                                                        tableOrder
                                                                            .productsInCart
                                                                            .length;
                                                                    i++) {
                                                                  tableOrder
                                                                      .amountCart
                                                                      .value = tableOrder
                                                                          .amountCart
                                                                          .value +
                                                                      tableOrder
                                                                          .productsInCart[
                                                                              i]
                                                                          .quantity!;
                                                                }

                                                                _globalKey
                                                                    .currentContext!
                                                                    .read<
                                                                        CartCubit>()
                                                                    .getCart();
                                                                break;
                                                              } else {
                                                                tableOrder
                                                                        .productsInCart[
                                                                            i]
                                                                        .quantity =
                                                                    tableOrder
                                                                        .tempQuantity
                                                                        .value;
                                                                for (int j = 0;
                                                                    j <
                                                                        itemProduct
                                                                            .addOns!
                                                                            .length;
                                                                    j++) {
                                                                  tableOrder
                                                                      .productsInCart[
                                                                          i]
                                                                      .addOns![
                                                                          j]
                                                                      .quantity = tempAddOns[
                                                                          j]
                                                                      .value;
                                                                }
                                                                break;
                                                              }
                                                            }
                                                          }
                                                          tableOrder.amountCart
                                                              .value = 0;
                                                          for (int i = 0;
                                                              i <
                                                                  tableOrder
                                                                      .productsInCart
                                                                      .length;
                                                              i++) {
                                                            tableOrder
                                                                .amountCart
                                                                .value = tableOrder
                                                                    .amountCart
                                                                    .value +
                                                                tableOrder
                                                                    .productsInCart[
                                                                        i]
                                                                    .quantity!;
                                                          }
                                                          _globalKey
                                                              .currentContext!
                                                              .read<CartCubit>()
                                                              .getCart();
                                                          navigator!.pop();
                                                        },
                                                      ),
                                                      const SizedBox(
                                                          height: Dimensions
                                                              .PADDING_SIZE_SMALL),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            );
                                          });
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Container(
                                      constraints:
                                          const BoxConstraints(minHeight: 70),
                                      padding: const EdgeInsets.only(
                                        top: Dimensions.MARGIN_SIZE_SMALL,
                                      ),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Column(
                                              mainAxisSize: MainAxisSize.min,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${itemProduct.name}',
                                                  style: GlobalStyles
                                                      .robotoRegular(context),
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                ),
                                                const SizedBox(
                                                  height: Dimensions
                                                      .PADDING_SIZE_EXTRA_SMALL,
                                                ),
                                                Text(
                                                  formatCurrency(
                                                      price:
                                                          itemProduct.price!),
                                                  style: GlobalStyles
                                                          .robotoRegular(
                                                              context)
                                                      .copyWith(
                                                    color: Colors.black54,
                                                    fontSize: Dimensions
                                                        .FONT_SIZE_DEFAULT,
                                                  ),
                                                ),
                                                if (addon.isNotEmpty)
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                      top: Dimensions
                                                          .PADDING_SIZE_EXTRA_SMALL,
                                                    ),
                                                    child: Text(
                                                      '${'addons_food'.tr}: $addon',
                                                      style: GlobalStyles
                                                              .robotoRegular(
                                                                  context)
                                                          .copyWith(
                                                        fontSize: Dimensions
                                                            .FONT_SIZE_SMALL,
                                                        color: Theme.of(context)
                                                            .hintColor,
                                                      ),
                                                    ),
                                                  ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: Dimensions
                                                    .PADDING_SIZE_EXTRA_SMALL,
                                              ),
                                              child: Text(
                                                '${itemProduct.quantity}',
                                                textAlign: TextAlign.center,
                                                style:
                                                    GlobalStyles.robotoRegular(
                                                        context),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              formatCurrency(
                                                  price: tableOrder
                                                      .tempTotal[indexCart]
                                                  ),
                                              textAlign: TextAlign.end,
                                              style: GlobalStyles.robotoRegular(
                                                  context),
                                              maxLines: 1,
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    AwesomeDialog(
                                                      context: context,
                                                      dialogType:
                                                          DialogType.warning,
                                                      animType:
                                                          AnimType.rightSlide,
                                                      title: 'warning'.tr,
                                                      desc:
                                                          'delete_this_food'.tr,
                                                      btnCancelText: 'no'.tr,
                                                      btnCancelOnPress: () {},
                                                      btnOkText: 'yes'.tr,
                                                      btnOkOnPress: () {
                                                        _globalKey
                                                            .currentContext!
                                                            .read<CartCubit>()
                                                            .removeProductAt(
                                                                index:
                                                                    indexCart);
                                                        for (int i = 0;
                                                            i < addOns.length;
                                                            i++) {
                                                          addOns[i].quantity =
                                                              0;
                                                        }
                                                        tableOrder.amountCart
                                                            .value = 0;
                                                        for (int i = 0;
                                                            i <
                                                                tableOrder
                                                                    .productsInCart
                                                                    .length;
                                                            i++) {
                                                          tableOrder.amountCart
                                                              .value = tableOrder
                                                                  .amountCart
                                                                  .value +
                                                              tableOrder
                                                                  .productsInCart[
                                                                      i]
                                                                  .quantity!;
                                                        }
                                                        _globalKey
                                                            .currentContext!
                                                            .read<CartCubit>()
                                                            .getCart();
                                                      },
                                                    ).show();
                                                  },
                                                  splashColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  child: const Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                            const SizedBox(
                              height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                            ),
                            Obx(
                              () => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        setNote(context);
                                      },
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      child: Text.rich(
                                        TextSpan(
                                          children: tableOrder
                                                      .noteOrder.value ==
                                                  ''
                                              ? [
                                                  TextSpan(
                                                    text:
                                                        'add_special_note_here'
                                                            .tr,
                                                    style: GlobalStyles
                                                            .robotoRegular(
                                                                context)
                                                        .copyWith(
                                                      fontSize: Dimensions
                                                          .FONT_SIZE_LARGE,
                                                      color: primaryColor,
                                                    ),
                                                  ),
                                                ]
                                              : [
                                                  TextSpan(
                                                    text: 'note_order'.tr,
                                                    style:
                                                        GlobalStyles.robotoBold(
                                                                context)
                                                            .copyWith(
                                                      fontSize: Dimensions
                                                          .FONT_SIZE_LARGE,
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .color,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        ': ${tableOrder.noteOrder.value}',
                                                    style: GlobalStyles
                                                            .robotoRegular(
                                                                context)
                                                        .copyWith(
                                                      fontSize: Dimensions
                                                          .FONT_SIZE_LARGE,
                                                      color: Theme.of(context)
                                                          .textTheme
                                                          .bodyLarge!
                                                          .color,
                                                    ),
                                                  ),
                                                ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      setNote(context);
                                    },
                                    splashColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    child: Image.asset(
                                      GlobalImages.iconEdit,
                                      color: primaryColor,
                                      width: Dimensions.ICON_SIZE_DEFAULT,
                                    ),
                                  ),
                                  const SizedBox(width: 5),
                                  if (tableOrder.noteOrder.value != '')
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () {
                                        tableOrder.noteOrder.value = '';
                                      },
                                      child: const Icon(Icons.close_outlined,
                                          color: Colors.red, size: 25),
                                    )
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: Dimensions.PADDING_SIZE_DEFAULT,
                            ),
                            const CustomDivider(height: 1),
                            Obx(
                              () => CalculationView(
                                itemPrice: tableOrder.totalAmount.value,
                                discount: 0,
                                tax: 0,
                                addOns: 0,
                                itemAmount: amountCart(),
                                total: tableOrder.totalAmount.value,
                              ),
                            ),
                            const SizedBox(
                              height: Dimensions.PADDING_SIZE_OVER_LARGE,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: CustomButton2(
                                    height: 50,
                                    transparent: true,
                                    buttonText: 'clear_cart'.tr,
                                    onPressed: () async {
                                      await _appPrefs.removeNote();
                                      await _appPrefs.removeCart();
                                      for (int i = 0;
                                          i < tableOrder.productsInCart.length;
                                          i++) {
                                        for (int j = 0;
                                            j <
                                                tableOrder.productsInCart[i]
                                                    .addOns!.length;
                                            j++) {
                                          tableOrder.productsInCart[i]
                                              .addOns![j].quantity = 0;
                                          tempAddOns[j].value = 0;
                                        }
                                      }
                                      _globalKey.currentContext!
                                          .read<CartCubit>()
                                          .removeAll();
                                      _globalKey.currentContext!
                                          .read<CartCubit>()
                                          .getCart();
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  width: Dimensions.PADDING_SIZE_DEFAULT,
                                ),
                                Expanded(
                                  child: CustomButton2(
                                    height: 50,
                                    buttonText: 'place_order'.tr,
                                    onPressed: () {
                                      if (tableOrder
                                          .selectedTable.value.isEmpty) {
                                        AwesomeDialog(
                                                context: context,
                                                dialogType: DialogType.warning,
                                                animType: AnimType.bottomSlide,
                                                title: 'warning'.tr,
                                                desc: 'please_select_table'.tr,
                                                btnOkText: 'ok'.tr,
                                                btnOkOnPress: () {})
                                            .show();
                                      } else {
                                        navigator!.pushNamed(
                                            RouteGenerator.paymentScreen);
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    : const NoDataWidget();
              // : NoDataTableOrder(text: 'please_add_food_to_order'.tr);
              case StatusType.error:
                return const Error404Widget();
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }

  setNote(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        String? temp;
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                horizontal: Dimensions.PADDING_SIZE_EXTRA_LARGE),
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(20),
                ),
                color: Colors.white,
              ),
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_DEFAULT,
                  ),
                  SizedBox(
                    child: TextFormField(
                      initialValue: tableOrder.noteOrder.value != ''
                          ? tableOrder.noteOrder.value
                          : null,
                      decoration: InputDecoration(
                        hintText: 'add_special_note_here'.tr,
                        hintStyle: GlobalStyles.robotoRegular(context)
                            .copyWith(fontSize: Dimensions.FONT_SIZE_DEFAULT),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1),
                        ),
                      ),
                      keyboardType: TextInputType.text,
                      maxLines: 6,
                      onChanged: (val) => temp = val,
                    ),
                  ),
                  const SizedBox(
                    height: Dimensions.PADDING_SIZE_EXTRA_LARGE,
                  ),
                  CustomButton2(
                    buttonText: 'save'.tr,
                    width: 200,
                    height: 50,
                    onPressed: () async {
                      await _appPrefs.saveNote(note: temp!);
                      tableOrder.noteOrder.value = temp!;
                      navigator!.pop();
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    );
  }

  addonsView(BuildContext context, List<AddOn>? addOns, int price) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('addons_food'.tr,
                style: GlobalStyles.robotoBold(context).copyWith(fontSize: 20)),
            const SizedBox(
              width: 10,
            ),
            Text(
              '(${'optional'.tr})',
              style: GlobalStyles.robotoRegular(context)
                  .copyWith(color: Colors.grey, fontSize: 20),
            )
          ],
        ),
        const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
        Container(
          constraints: const BoxConstraints(
            maxHeight: 300,
          ),
          child: ListView.builder(
              itemCount: addOns!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return ValueListenableBuilder<int>(
                    valueListenable: tempAddOns[index],
                    builder: (context, _, __) {
                      return Container(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                    flex: 5,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(addOns[index].name),
                                        const Text(' - '),
                                        Text(formatCurrency(
                                            price: addOns[index].price)),
                                      ],
                                    )),
                                editButton(
                                    icon: Icons.remove,
                                    onTap: () {
                                      decrease(index);
                                      tableOrder.totalOneItem.value =
                                          totalPriceOneItem(
                                              quantity:
                                                  tableOrder.tempQuantity.value,
                                              price: price,
                                              addOns: addOns);
                                    }),
                                SizedBox(
                                  width: 25,
                                  child: Center(
                                    child: Text('${tempAddOns[index].value}',
                                        style:
                                            GlobalStyles.robotoRegular(context)
                                                .copyWith(
                                                    fontSize: Dimensions
                                                        .FONT_SIZE_DEFAULT)),
                                  ),
                                ),
                                editButton(
                                  icon: Icons.add,
                                  onTap: () {
                                    increase(index);
                                    tableOrder.totalOneItem.value =
                                        totalPriceOneItem(
                                            quantity:
                                                tableOrder.tempQuantity.value,
                                            price: price,
                                            addOns: addOns);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            if (index < addOns.length - 1)
                              Divider(
                                height: 1,
                                thickness: 0.5,
                                color: Colors.blueGrey.shade100,
                              ),
                          ],
                        ),
                      );
                    });
              }),
        ),
      ],
    );
  }

  Widget description(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'description'.tr,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
        Align(
          alignment: Alignment.topLeft,
          child: ReadMoreText(
            'Ngonnnnnnn á',
            trimLines: 2,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'show_more'.tr,
            trimExpandedText: 'show_less'.tr,
            moreStyle: GlobalStyles.robotoRegular(context).copyWith(
              color: primaryColor,
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
            ),
            lessStyle: GlobalStyles.robotoRegular(context).copyWith(
              color: primaryColor,
              fontSize: Dimensions.FONT_SIZE_DEFAULT,
            ),
          ),
        ),
        const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
      ],
    );
  }

  editButton({
    required IconData icon,
    required VoidCallback onTap,
    double width = 25,
    double height = 25,
    double iconSize = 15,
  }) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blueGrey.shade100),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        child: Center(
            child: Icon(
          icon,
          size: iconSize,
          color: primaryColor,
        )),
      ),
    );
  }

  setTable(BuildContext context, List<TableModel> tables) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      builder: (context) {
        _selectedTable.value = selectedTable.value;
        return Padding(
          padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
              color: Colors.white,
            ),
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        navigator!.pop();
                        selectedTable.value = '';
                      },
                      child: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Dimensions.PADDING_SIZE_LARGE,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'select_table'.tr,
                      style: GlobalStyles.robotoBold(context).copyWith(
                        fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: Dimensions.PADDING_SIZE_DEFAULT,
                ),
                Container(
                  height: 40,
                  padding: const EdgeInsets.symmetric(
                    horizontal: Dimensions.PADDING_SIZE_DEFAULT,
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: Theme.of(context).hintColor.withOpacity(0.2),
                      width: 1,
                    ),
                  ),
                  child: ValueListenableBuilder<String>(
                    valueListenable: _selectedTable,
                    builder: (context, selected, _) {
                      return DropdownButton<String>(
                        onChanged: (newValue) {
                          _selectedTable.value = newValue.toString();
                        },
                        menuMaxHeight: Get.height * 0.5,
                        hint: Obx(
                          () => Text(
                            tableOrder.selectedTable.value.isEmpty
                                ? 'please_select_table'.tr
                                : tableOrder.selectedTable.value,
                            style: GlobalStyles.robotoRegular(context).copyWith(
                                fontSize: Dimensions.FONT_SIZE_DEFAULT),
                          ),
                        ),
                        value: selected.isNotEmpty ? selected : null,
                        items: tables
                            .map((table) => DropdownMenuItem<String>(
                                  value: table.name,
                                  child: Text(
                                    table.name!,
                                    style: GlobalStyles.robotoRegular(context)
                                        .copyWith(
                                      fontSize: Dimensions.FONT_SIZE_DEFAULT,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ))
                            .toList(),
                        isExpanded: true,
                        underline: const SizedBox(),
                        onTap: () {},
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: Dimensions.PADDING_SIZE_OVER_LARGE,
                ),
                CustomButton2(
                  buttonText: 'save'.tr,
                  width: 200,
                  height: 50,
                  onPressed: () async {
                    await _appPrefs.saveTable(table: _selectedTable.value);
                    tableOrder.selectedTable.value = _selectedTable.value;
                    selectedTable.value = _selectedTable.value;
                    for (int i = 0; i < tables.length; i++) {
                      if (tables[i].name == tableOrder.selectedTable.value) {
                        tableOrder.tableId.value = tables[i].id!;
                      }
                    }
                    navigator!.pop();
                  },
                )
              ],
            ),
          ),
        );
      },
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
    );
  }
}
