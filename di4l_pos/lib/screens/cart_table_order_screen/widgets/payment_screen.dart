// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:di4l_pos/common/dimensions.dart';
import 'package:di4l_pos/common/global_colors.dart';
import 'package:di4l_pos/common/global_styles.dart';
import 'package:di4l_pos/common/storage/app_prefs.dart';
import 'package:di4l_pos/get_it.dart';
import 'package:di4l_pos/models/cart_table_order/cart_model.dart';
import 'package:di4l_pos/models/contacts/response/contacts_response.dart';
import 'package:di4l_pos/models/products/response/product_response.dart';
import 'package:di4l_pos/route_generator.dart';
import 'package:di4l_pos/screens/business_screen/cubit/business_cubit.dart';
import 'package:di4l_pos/screens/cart_table_order_screen/cubit/add_table_order_cubit.dart';
import 'package:di4l_pos/screens/cart_table_order_screen/cubit/cart_table_order_cubit.dart';
import 'package:di4l_pos/screens/contacts_screen/customers_screen/cubit/customers_cubit.dart';
import 'package:di4l_pos/screens/order_table_screen/widgets/custom_divider.dart';
import 'package:di4l_pos/screens/products_screen/cubit/products_cubit.dart';
import 'package:di4l_pos/screens/table_order_screen/mobile/table_order_mobile_screen.dart';
import 'package:di4l_pos/screens/table_order_screen/widgets/custom_button_order.dart';
import 'package:di4l_pos/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../order_screen/cubit/order_cubit.dart';

class PaymentScreen extends StatefulWidget {
  static MultiBlocProvider provider() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(
          create: (BuildContext context) => CartCubit(),
        ),
        BlocProvider<SalesOrderCubit>(
          create: (BuildContext context) => SalesOrderCubit(),
        ),
        BlocProvider<AddTableOrderCubit>(
          create: (BuildContext context) => AddTableOrderCubit(),
        ),
        BlocProvider<BusinessCubit>(
          create: (BuildContext context) => BusinessCubit(),
        ),
        BlocProvider<ProductsCubit>(
          create: (BuildContext context) => ProductsCubit(),
        ),
        BlocProvider<CustomersCubit>(
          create: (BuildContext context) => CustomersCubit(),
        ),
      ],
      child: const PaymentScreen(),
    );
  }

  const PaymentScreen({Key? key}) : super(key: key);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    context.read<CartCubit>().getCart();
    context.read<BusinessCubit>().getBusinesss();
    context.read<ProductsCubit>().getProducts();
    context.read<CustomersCubit>().getContacts();
  }

  Color primaryColor = GlobalColors.primaryColor;
  final tableOrder = Get.put(TableOrderController());
  final _appPrefs = getIt<AppPref>();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final TextEditingController paidCtrl = TextEditingController();
  Map<Product, int> proInCart = {};
  ContactModel? contactModel;
  var textSearch = TextEditingController();
  bool isSearch = false;
  int totalPriceOneItem(
      {required int quantity, required int price, List<AddOn>? addOns}) {
    if (addOns != null) {
      int total = 0;
      for (int i = 0; i < addOns.length; i++) {
        total += addOns[i].price * addOns[i].quantity;
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
  void initState() {
    WidgetsBinding.instance.endOfFrame.then((value) async {
      context.read<BusinessCubit>().getBusinesss().then((value) {
        if (value != null) {
          context.read<AddTableOrderCubit>().setBusinessId(value.id);
        }
      });
      context.read<CustomersCubit>().getContacts();
      textSearch.addListener(() {
        context
            .read<CustomersCubit>()
            .searchCustomer(searchText: textSearch.text);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            tableOrder.change.value = 0;
            navigator!.pop();
            //     .pushReplacementNamed(RouteGenerator.cartTableOrderScreen);
          },
          color: Colors.black,
        ),
        title: Text('confirm'.tr),
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
        physics: const ScrollPhysics(),
        child: BlocBuilder<AddTableOrderCubit, AddTableOrderState>(
          builder: (context, stateOrder) {
            return BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, statePro) {
              final products = statePro.data?.products ?? [];
              for (int i = 0; i < products.length; i++) {
                for (int j = 0; j < tableOrder.productsInCart.length; j++) {
                  if (products[i].id ==
                      tableOrder.productsInCart[j].productId) {
                    proInCart.addEntries({
                      products[i]: tableOrder.productsInCart[j].quantity!
                    }.entries);
                  }
                }
              }
              return BlocBuilder<CartCubit, CartState>(
                builder: (context, stateCart) {
                  final itemProducts = stateCart.data?.listItemProduct ?? [];
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 50,
                              child: Text(
                                '${'table'.tr} :',
                                style:
                                    GlobalStyles.robotoBold(context).copyWith(
                                  fontSize: Dimensions.FONT_SIZE_LARGE,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                tableOrder.selectedTable.value,
                                style: GlobalStyles.robotoRegular(context),
                              ),
                            )
                          ],
                        ),
                        if (tableOrder.noteOrder.value != '')
                          Row(
                            children: [
                              SizedBox(
                                width: 50,
                                child: Text(
                                  '${'note_order'.tr} :',
                                  style:
                                      GlobalStyles.robotoBold(context).copyWith(
                                    fontSize: Dimensions.FONT_SIZE_LARGE,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  tableOrder.noteOrder.value,
                                  style: GlobalStyles.robotoRegular(context),
                                ),
                              )
                            ],
                          ),
                        const SizedBox(height: 30),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                'food'.tr,
                                style:
                                    GlobalStyles.robotoBold(context).copyWith(
                                  fontSize: Dimensions.FONT_SIZE_LARGE,
                                ),
                              ),
                            ),
                            const Text('|'),
                            Expanded(
                              child: Center(
                                child: Text(
                                  'qt'.tr,
                                  style:
                                      GlobalStyles.robotoBold(context).copyWith(
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
                                style:
                                    GlobalStyles.robotoBold(context).copyWith(
                                  fontSize: Dimensions.FONT_SIZE_LARGE,
                                ),
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 5, bottom: 10),
                          child: CustomDivider(height: 1),
                        ),
                        ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: itemProducts.length,
                            shrinkWrap: true,
                            itemBuilder: (context, indexCart) {
                              final itemProduct = itemProducts[indexCart];
                              final amountOne = totalPriceOneItem(
                                quantity: itemProduct.quantity!,
                                price: itemProduct.price!,
                                addOns: itemProduct.addOns,
                              );
                              String addon = '';
                              for (var addOn in itemProduct.addOns!) {
                                if (addOn.quantity > 0) {
                                  addon =
                                      '$addon${addOn.name} (${addOn.quantity}) ';
                                }
                              }
                              return Container(
                                constraints:
                                    const BoxConstraints(minHeight: 30),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 3),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Expanded(
                                      flex: 4,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            itemProduct.name!,
                                            style: GlobalStyles.robotoRegular(
                                                context),
                                          ),
                                          Text(
                                            '${formatCurrency(price: itemProduct.price!)}',
                                            style: GlobalStyles.robotoRegular(
                                                    context)
                                                .copyWith(
                                                    color: Colors.black54,
                                                    fontSize: Dimensions
                                                        .FONT_SIZE_DEFAULT),
                                          ),
                                          if (addon.isNotEmpty)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: Dimensions
                                                    .PADDING_SIZE_EXTRA_SMALL,
                                              ),
                                              child: Text(
                                                '${'addons_food'.tr}: $addon',
                                                style:
                                                    GlobalStyles.robotoRegular(
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
                                      child: Center(
                                        child: Text(
                                          itemProduct.quantity.toString(),
                                          style: GlobalStyles.robotoRegular(
                                              context),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Text(
                                        formatCurrency(price: amountOne),
                                        style:
                                            GlobalStyles.robotoRegular(context),
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                        const Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                          child: CustomDivider(height: 1),
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Text(
                                'items_price_food'.tr,
                                style:
                                    GlobalStyles.robotoBold(context).copyWith(
                                  fontSize: Dimensions.FONT_SIZE_LARGE,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Center(
                                child: Obx(
                                  () => Text(
                                    tableOrder.amountCart.value.toString(),
                                    style: GlobalStyles.robotoRegular(context),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Obx(
                                () => Text(
                                  formatCurrency(
                                      price: tableOrder.totalAmount.value),
                                  style: GlobalStyles.robotoRegular(context),
                                  textAlign: TextAlign.right,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        // Container(
                        //     color: Colors.white,
                        //     child: Padding(
                        //       padding: const EdgeInsets.fromLTRB(
                        //           Dimensions.PADDING_SIZE_DEFAULT,
                        //           Dimensions.PADDING_SIZE_SMALL,
                        //           Dimensions.PADDING_SIZE_DEFAULT,
                        //           Dimensions.PADDING_SIZE_DEFAULT),
                        //       child: Column(
                        //         crossAxisAlignment: CrossAxisAlignment.start,
                        //         children: [
                        //           Text(
                        //             'customer'.tr,
                        //             style: GlobalStyles.boldStyle,
                        //           ),
                        //           SearchWidget(
                        //             onSubmitted: (p0) => setState(() {
                        //               isSearch = false;
                        //             }),
                        //             onTap: () => setState(() {
                        //               isSearch = true;
                        //             }),
                        //             controller: textSearch,
                        //             hintText: "Nhập tên khách hàng",
                        //           ),
                        //           stateOrder.data!.customerSelect != null
                        //               ? ListTile(
                        //                   leading: IconButton(
                        //                     icon: const Icon(Icons.remove),
                        //                     onPressed: () {
                        //                       _globalKey.currentContext!
                        //                           .read<AddTableOrderCubit>()
                        //                           .setCustomerSelect(null);
                        //                     },
                        //                   ),
                        //                   title: Column(
                        //                     crossAxisAlignment:
                        //                         CrossAxisAlignment.start,
                        //                     children: [
                        //                       Text(stateOrder
                        //                           .data!.customerSelect!.name!),
                        //                       Text(stateOrder.data!
                        //                           .customerSelect!.mobile!)
                        //                       //Text(contactModel!.landline!)
                        //                     ],
                        //                   ),
                        //                 )
                        //               : const SizedBox()
                        //         ],
                        //       ),
                        //     )),
                        SizedBox(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'payable_amount'.tr,
                                  style: GlobalStyles.robotoRegular(context),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Obx(
                                  () => Text(
                                    formatCurrency(
                                        price: tableOrder.totalAmount.value),
                                    style: GlobalStyles.robotoRegular(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'paid_amount'.tr,
                                  style: GlobalStyles.robotoRegular(context),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: TextFormField(
                                  controller: paidCtrl,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: '${'enter'.tr}...',
                                    hintStyle: TextStyle(color: primaryColor),
                                  ),
                                  style: TextStyle(color: primaryColor),
                                  onChanged: (value) {
                                    if (paidCtrl.text == "") {
                                      tableOrder.change.value = 0;
                                    } else {
                                      // if (int.parse(paidCtrl.text) >=
                                      //     tableOrder.totalAmount.value) {
                                      tableOrder.change.value =
                                          int.parse(paidCtrl.text) -
                                              tableOrder.totalAmount.value;
                                    }
                                    //else {
                                    //   AwesomeDialog(
                                    //       context: context,
                                    //       dialogType: DialogType.warning,
                                    //       animType: AnimType.bottomSlide,
                                    //       title: 'warning'.tr,
                                    //       desc: 'please_pay'.tr,
                                    //       btnOkText: 'ok'.tr,
                                    //       btnOkOnPress: () {
                                    //         paidCtrl.text = '';
                                    //       }).show();
                                    // }
                                  },
                                  onFieldSubmitted: (value) {
                                    if (paidCtrl.text == "") {
                                      tableOrder.change.value = 0;
                                    } else {
                                      if (int.parse(paidCtrl.text) >=
                                          tableOrder.totalAmount.value) {
                                        tableOrder.change.value =
                                            int.parse(paidCtrl.text) -
                                                tableOrder.totalAmount.value;
                                      } else {
                                        AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.warning,
                                            animType: AnimType.bottomSlide,
                                            title: 'warning'.tr,
                                            desc: 'please_pay'.tr,
                                            btnOkText: 'ok'.tr,
                                            btnOkOnPress: () {
                                              paidCtrl.text = '';
                                              tableOrder.change.value = 0;
                                            }).show();
                                        // tableOrder.change.value = 0;
                                      }
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 30,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Text(
                                  'change_food'.tr,
                                  style:
                                      GlobalStyles.robotoBold(context).copyWith(
                                    fontSize: Dimensions.FONT_SIZE_LARGE,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Obx(
                                  () => Text(
                                    formatCurrency(
                                        price: tableOrder.change.value),
                                    style: GlobalStyles.robotoBold(context)
                                        .copyWith(
                                      fontSize: Dimensions.FONT_SIZE_LARGE,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 100),
                        Obx(
                          () => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: Dimensions.PADDING_SIZE_DEFAULT),
                            child: Row(
                              children: [
                                Expanded(
                                  child: CustomButton2(
                                    height: 50,
                                    width: 170,
                                    transparent: tableOrder.change.value == 0 &&
                                            paidCtrl.text.isEmpty
                                        ? false
                                        : true,
                                    buttonText: 'pay_after_eating'.tr,
                                    fontSize: Dimensions.FONT_SIZE_LARGE,
                                    onPressed: () async {
                                      //               showDatePicker(
                                      //   context: context,
                                      //   initialDate: DateTime.now(),
                                      //   firstDate: DateTime(2000),
                                      //   lastDate: DateTime(2025),
                                      // ).then((value) => _globalKey.currentContext!
                                      //     .read<AddOrderCubit>()
                                      //     .setTransactionDate(value!));
                                      // final request =
                                      //     AddSellRequest(sells: tableOrder.toSellRequest());
                                      _globalKey.currentContext!
                                          .read<AddTableOrderCubit>()
                                          .setNote(tableOrder.noteOrder.value);
                                      _globalKey.currentContext!
                                          .read<AddTableOrderCubit>()
                                          .setTableId(tableOrder.tableId.value);
                                      _globalKey.currentContext!
                                          .read<BusinessCubit>()
                                          .getBusinesss()
                                          .then((value) {
                                        if (value != null) {
                                          context
                                              .read<AddTableOrderCubit>()
                                              .setBusinessId(value.id);
                                        }
                                      });
                                      _globalKey.currentContext!
                                          .read<AddTableOrderCubit>()
                                          .setProductSelectAll(proInCart);
                                      _globalKey.currentContext!
                                          .read<AddTableOrderCubit>()
                                          .setCustomerSelect(contactModel);
                                      _globalKey.currentContext!
                                          .read<AddTableOrderCubit>()
                                          .setTransactionDate(DateTime.now());
                                      _globalKey.currentContext!
                                          .read<AddTableOrderCubit>()
                                          .addOrder();
                                      navigator!.pushNamed(RouteGenerator
                                          .orderFoodSuccessScreen);
                                      await _appPrefs.removeCart();
                                      await _appPrefs.removeNote();
                                      _globalKey.currentContext!
                                          .read<CartCubit>()
                                          .removeAll();
                                      _globalKey.currentContext!
                                          .read<CartCubit>()
                                          .getCart();
                                    },
                                  ),
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: CustomButton2(
                                    height: 50,
                                    width: 170,
                                    transparent:
                                        paidCtrl.text.isNotEmpty ? false : true,
                                    buttonText: 'confirm_payment'.tr,
                                    fontSize: Dimensions.FONT_SIZE_LARGE,
                                    onPressed: () async {
                                      if (paidCtrl.text.isEmpty ||
                                          int.parse(paidCtrl.text) <
                                              tableOrder.totalAmount.value) {
                                        AwesomeDialog(
                                            context: context,
                                            dialogType: DialogType.warning,
                                            animType: AnimType.bottomSlide,
                                            title: 'warning'.tr,
                                            desc: 'please_pay'.tr,
                                            btnOkText: 'ok'.tr,
                                            btnOkOnPress: () {
                                              paidCtrl.text = '';
                                              tableOrder.change.value = 0;
                                            }).show();
                                      } else if (int.parse(paidCtrl.text) >=
                                          tableOrder.totalAmount.value) {
                                        // final request =
                                        //     AddSellRequest(sells: tableOrder.toSellRequest());
                                        // _globalKey.currentContext!
                                        //     .read<SalesOrderCubit>()
                                        //     .addSell(request: request);
                                        _globalKey.currentContext!
                                            .read<AddTableOrderCubit>()
                                            .setNote(
                                                tableOrder.noteOrder.value);
                                        _globalKey.currentContext!
                                            .read<AddTableOrderCubit>()
                                            .setTableId(
                                                tableOrder.tableId.value);
                                        _globalKey.currentContext!
                                            .read<BusinessCubit>()
                                            .getBusinesss()
                                            .then((value) {
                                          if (value != null) {
                                            context
                                                .read<AddTableOrderCubit>()
                                                .setBusinessId(value.id);
                                          }
                                        });
                                        _globalKey.currentContext!
                                            .read<AddTableOrderCubit>()
                                            .setProductSelectAll(proInCart);
                                        _globalKey.currentContext!
                                            .read<AddTableOrderCubit>()
                                            .setCustomerSelect(contactModel);
                                        _globalKey.currentContext!
                                            .read<AddTableOrderCubit>()
                                            .setTransactionDate(DateTime.now());
                                        _globalKey.currentContext!
                                            .read<AddTableOrderCubit>()
                                            .addOrder();
                                        navigator!.pushNamed(RouteGenerator
                                            .orderFoodSuccessScreen);
                                        await _appPrefs.removeCart();
                                        await _appPrefs.removeNote();
                                        _globalKey.currentContext!
                                            .read<CartCubit>()
                                            .removeAll();
                                        _globalKey.currentContext!
                                            .read<CartCubit>()
                                            .getCart();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            });
          },
        ),
      ),
    );
  }
}
