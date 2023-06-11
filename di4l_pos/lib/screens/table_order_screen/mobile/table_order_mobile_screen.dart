// ignore_for_file: invalid_use_of_protected_member

import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:di4l_pos/common/dimensions.dart';
import 'package:di4l_pos/common/global_colors.dart';
import 'package:di4l_pos/common/global_images.dart';
import 'package:di4l_pos/common/global_styles.dart';
import 'package:di4l_pos/common/storage/app_prefs.dart';
import 'package:di4l_pos/enums/status_type.dart';
import 'package:di4l_pos/get_it.dart';
import 'package:di4l_pos/models/cart_table_order/cart_model.dart';
import 'package:di4l_pos/models/modifier_set/modifier_set_response.dart';
import 'package:di4l_pos/models/products/response/product_response.dart';
import 'package:di4l_pos/models/sell/request/add_sell_request.dart';
import 'package:di4l_pos/models/table/response/table_response.dart';
import 'package:di4l_pos/route_generator.dart';
import 'package:di4l_pos/screens/cart_table_order_screen/cubit/cart_table_order_cubit.dart';
import 'package:di4l_pos/screens/cart_table_order_screen/cubit/table_order_cubit.dart';
import 'package:di4l_pos/screens/category_screen/cubit/category_cubit.dart';
import 'package:di4l_pos/screens/products_screen/cubit/products_cubit.dart';
import 'package:di4l_pos/screens/table_order_screen/cubit/modifier_set_cubit.dart';
import 'package:di4l_pos/screens/table_order_screen/widgets/cart_button.dart';
import 'package:di4l_pos/screens/table_order_screen/widgets/custom_button_order.dart';
import 'package:di4l_pos/widgets/data/404_widget.dart';
import 'package:di4l_pos/widgets/data/app_loading_widget.dart';
import 'package:di4l_pos/widgets/data/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:readmore/readmore.dart';
import 'package:search_page/search_page.dart';
import 'package:getwidget/getwidget.dart';

class TableOrderController extends GetxController {
  RxString selectedTable = ''.obs;
  RxInt tableId = 0.obs;
  RxString noteOrder = ''.obs;
  RxString idNewOrder = ''.obs;
  RxInt amountCart = 0.obs;
  RxInt tempQuantity = 0.obs;
  RxInt totalOneItem = 0.obs;
  RxInt totalAmount = 0.obs;
  RxInt change = 0.obs;
  RxList<ItemProduct> productsInCart = <ItemProduct>[].obs;
  RxList<int> tempTotal = <int>[].obs;

  reset() {
    noteOrder = ''.obs;
    idNewOrder = ''.obs;
    amountCart = 0.obs;
    tempQuantity = 0.obs;
    totalOneItem = 0.obs;
    totalAmount = 0.obs;
    change = 0.obs;
    productsInCart = <ItemProduct>[].obs;
  }

  List<SellProductRequest> toSellProductRequest(
      List<ItemProduct> productsInCart) {
    final list = <SellProductRequest>[];
    for (int i = 0; i < productsInCart.length; i++) {
      final sellProductRequest = SellProductRequest(
        productId: productsInCart[i].productId,
        quantity: productsInCart[i].quantity,
        unitPrice: productsInCart[i].price!.toDouble(),
      );
      list.add(sellProductRequest);
    }
    return list;
  }

  List<SellRequest> toSellRequest() {
    final list = <SellRequest>[];
    list.add(SellRequest(
        products: toSellProductRequest(productsInCart),
        saleNote: noteOrder.value,
        changeReturn: change.value,
        tableId: tableId.value));
    return list;
  }
}

class TableOrderMobileScreen extends StatefulWidget {
  static MultiBlocProvider provider() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CartCubit>(
          create: (BuildContext context) => CartCubit(),
        ),
        BlocProvider<ProductsCubit>(
          create: (BuildContext context) => ProductsCubit(),
        ),
        BlocProvider<TableCubit>(
          create: (BuildContext context) => TableCubit(),
        ),
        BlocProvider<ModifierCubit>(
          create: (BuildContext context) => ModifierCubit(),
        ),
        BlocProvider<CategoryCubit>(
          create: (BuildContext context) => CategoryCubit(),
        ),
      ],
      child: const TableOrderMobileScreen(),
    );
  }

  const TableOrderMobileScreen({Key? key}) : super(key: key);

  @override
  State<TableOrderMobileScreen> createState() => _TableOrderMobileScreenState();
}

class _TableOrderMobileScreenState extends State<TableOrderMobileScreen>
    with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) async {
    context.read<ProductsCubit>().getProducts();
    context.read<CartCubit>().getCart();
    context.read<CategoryCubit>().getCategories();
    context.read<TableCubit>().getTables();
    context.read<ModifierCubit>().getModifiers();
    selectedTable.value = tableOrder.selectedTable.value;
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final tableOrder = Get.put(TableOrderController());
  static ValueNotifier<String> selectedTable = ValueNotifier('');
  static ValueNotifier<String> selectTable = ValueNotifier('');
  static List<ValueNotifier<int>> tempAddOns = [];
  final _appPrefs = getIt<AppPref>();
  Color primaryColor = GlobalColors.primaryColor;
  List<String> categories = ['All'];
  List<Tab> tabs = [];
  List<Widget> tabContents = [];
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
      {required int quantity, required String price, List<AddOn>? addOns}) {
    if (addOns != null) {
      int total = 0;
      for (int i = 0; i < addOns.length; i++) {
        total += addOns[i].price * tempAddOns[i].value;
      }
      return total + (quantity * stringDoubleToInt(price));
    }
    return quantity * stringDoubleToInt(price);
  }

  // int totalPriceWithModifier({required List<AddOn>? addOns, required int index}) {
  //   if (addOns != null) {
  //     int total = 0;
  //     for (var addOn in addOns) {
  //       total += addOn.price * addOn.quantity;
  //     }
  //     return total + tableOrder.pro.value;
  //   }
  //   return tableOrder.totalOneItem.value;
  // }

  String formatCurrency({required String price}) {
    // return NumberFormat('#,###').format(price);
    return NumberFormat.simpleCurrency(locale: 'vi-VN', decimalDigits: 0)
        .format(stringDoubleToInt(price));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text(
          'table_order'.tr,
          style: const TextStyle(
              color: Colors.black, fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE),
        ),
        centerTitle: true,
        toolbarHeight: 55,
        elevation: 10,
        shadowColor: Colors.white54,
        leading: BackButton(
          color: Colors.black,
          onPressed: () {
            navigator!.pushReplacementNamed(RouteGenerator.mainScreen);
          },
        ),
        actions: [
          BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, productState) {
            final productData = productState.data?.products ?? [];
            return BlocBuilder<ModifierCubit, ModifierState>(
                builder: (context, modifierState) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: SearchPage<Product>(
                      barTheme: ThemeData(
                        appBarTheme: const AppBarTheme(
                          color: Colors.white,
                          iconTheme: IconThemeData(color: Colors.black),
                        ),
                        inputDecorationTheme: const InputDecorationTheme(
                          border: InputBorder.none,
                        ),
                      ),
                      onQueryUpdate: print,
                      items: productData,
                      searchLabel: 'search'.tr,
                      suggestion: Center(
                        child: Text('suggest'.tr),
                      ),
                      failure: Center(
                        child: Text('no_food'.tr),
                      ),
                      filter: (product) => [
                        product.name,
                      ],
                      builder: (product) {
                        final price = stringDoubleToInt(product
                            .productVariations![0]!
                            .variations![0]!
                            .defaultSellPrice);
                        final modifiers =
                            modifierState.data?.modifierSets ?? [];
                        List<Variations>? variations = [];
                        for (var modifier in modifiers) {
                          for (var modifierProduct
                              in modifier.modifierProducts!) {
                            if (modifierProduct.id == product.id) {
                              variations = modifier.variations;
                            }
                          }
                        }
                        List<AddOn> addOns = [];
                        for (var variation in variations!) {
                          addOns.add(AddOn(
                              variationId: variation.id!,
                              name: variation.name!,
                              quantity: 0,
                              price: stringDoubleToInt(
                                  variation.defaultSellPrice!)));
                        }
                        return GFListTile(
                          onTap: () {
                            bool inCart = false;
                            if (tableOrder.productsInCart.isNotEmpty) {
                              for (int i = 0;
                                  i < tableOrder.productsInCart.length;
                                  i++) {
                                if (product.id ==
                                    tableOrder.productsInCart[i].productId) {
                                  tableOrder.tempQuantity.value =
                                      tableOrder.productsInCart[i].quantity!;
                                  for (int j = 0; j < addOns.length; j++) {
                                    addOns[j].quantity = tableOrder
                                        .productsInCart[i].addOns![j].quantity;
                                  }
                                  inCart = true;
                                  break;
                                } else {
                                  tableOrder.tempQuantity.value = 1;
                                }
                              }
                            } else {
                              tableOrder.tempQuantity.value = 1;
                            }
                            setFood(
                                context: context,
                                product: product,
                                inCart: inCart,
                                addOns: addOns);
                          },
                          color: Colors.white,
                          avatar: GFImageOverlay(
                            height: 100,
                            width: 100,
                            image: NetworkImage(product.imageUrl!),
                            colorFilter: null,
                          ),
                          titleText: product.name,
                          subTitleText: price.toString(),
                          icon: const Icon(Icons.arrow_forward_ios),
                        );
                      },
                    ),
                  );
                },
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                  size: 30,
                ),
              );
            });
          }),
          const SizedBox(width: 10),
          const CartButton(),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: Column(
            children: [
              BlocBuilder<TableCubit, TableState>(
                builder: (context, tableState) {
                  final tables = tableState.data?.tables ?? [];
                  if (tableState.data!.status == StatusType.loaded) {
                    return Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                tableOrder.selectedTable.value == ''
                                    ? InkWell(
                                        onTap: () {
                                          setTable(context, tables);
                                        },
                                        splashColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        child: Text(
                                          'select_table'.tr,
                                          style: GlobalStyles.robotoRegular(
                                                  context)
                                              .copyWith(
                                            fontSize:
                                                Dimensions.FONT_SIZE_LARGE,
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                        ),
                                      )
                                    : Expanded(
                                        child: InkWell(
                                          onTap: () {
                                            setTable(context, tables);
                                          },
                                          splashColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          child: Text(
                                            tableOrder.selectedTable.value,
                                            style:
                                                GlobalStyles.robotoBold(context)
                                                    .copyWith(
                                              fontSize:
                                                  Dimensions.FONT_SIZE_LARGE,
                                            ),
                                            textAlign: TextAlign.center,
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
                  }
                  return const SizedBox.shrink();
                },
              ),
              const SizedBox(height: 15), // const Divider(thickness: 1),
              BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, categoryState) {
                final categoryData = categoryState.data?.categories ?? [];
                tabs = [
                  const Tab(
                      child: Text(
                    'All',
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  )),
                ];
                tabContents = [
                  displayProduct(context, 'All'),
                ];
                List.generate(categoryData.length, (index) {
                  // categories.add(categoryData[index].name!);
                  tabs.add(Tab(
                    child: Text(
                      categoryData[index].name!,
                      style: const TextStyle(color: Colors.black, fontSize: 18),
                    ),
                  ));
                  tabContents
                      .add(displayProduct(context, categoryData[index].name!));
                });
                if (categoryState.data!.status == StatusType.loaded) {
                  return DefaultTabController(
                    length: tabs.length,
                    child: Column(
                      children: [
                        TabBar(
                          tabs: tabs,
                          indicatorColor: primaryColor,
                          isScrollable: true,
                        ),
                        SizedBox(
                          height: Get.height - 196,
                          width: double.maxFinite,
                          child: TabBarView(
                            children: tabContents,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
            ],
          ),
        ),
      ),
    );
  }

  addonsView(BuildContext context, List<AddOn>? addOns, Product product) {
    final price = stringDoubleToInt(
        product.productVariations![0]!.variations![0]!.defaultSellPrice);
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
                                            price: addOns[index]
                                                .price
                                                .toString())),
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
                                            price: price.toString(),
                                            addOns: addOns);
                                  },
                                ),
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
                                            price: price.toString(),
                                            addOns: addOns);
                                  },
                                ),
                              ],
                            ),
                            const SizedBox(height: 5),
                            if (index < 3 - 1)
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

  Widget description(BuildContext context, String description) {
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
            description,
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
        selectTable.value = selectedTable.value;
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
                        selectTable.value = '';
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
                    valueListenable: selectedTable,
                    builder: (context, selected, _) {
                      return DropdownButton<String>(
                        onChanged: (newValue) {
                          selectTable.value = newValue.toString();
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
                    await _appPrefs.saveTable(table: selectTable.value);
                    tableOrder.selectedTable.value = selectTable.value;
                    selectedTable.value = selectTable.value;
                    for (int i = 0; i < tables.length; i++) {
                      if (tables[i].name == tableOrder.selectedTable.value) {
                        tableOrder.tableId.value = tables[i].id!;
                      }
                    }
                    navigator!.pop();
                  },
                ),
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

  Widget displayProduct(BuildContext context, String category) {
    return BlocBuilder<ProductsCubit, ProductsState>(
        builder: (context, productState) {
      List<Product> proCategory = [];
      // List<int> quantityData = [];

      if (category == 'All') {
        proCategory = productState.data?.products ?? [];
      } else {
        final products = productState.data?.products ?? [];
        for (int i = 0; i < products.length; i++) {
          if (products[i].category != null &&
              products[i].category!.name == category) {
            proCategory.add(products[i]);
            // hasModifier.add(false);
          }
        }
      }
      // for (int i = 0; i < productData.length; i++) {
      //   for (int j = 0; j < tableOrder.productsInCart.length; j++) {
      //     if (productData[i].id == tableOrder.productsInCart[j].productId) {
      //       quantityData.add(tableOrder.productsInCart[j].quantity!);
      //     } else {
      //       quantityData.add(0);
      //     }
      //   }
      // }
      switch (productState.data!.status) {
        case StatusType.loading:
          return const AppLoadingWidget(
            widget: null,
            text: 'Loading...',
          );
        case StatusType.loaded:
          return proCategory.isNotEmpty
              ? GridView.builder(
                  padding: const EdgeInsets.only(top: 5, bottom: 5),
                  shrinkWrap: true,
                  itemCount: proCategory.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0),
                  itemBuilder: (context, indexProduct) {
                    final defaultSellPrice = proCategory[indexProduct]
                        .productVariations![0]!
                        .variations![0]!
                        .defaultSellPrice;
                    // bool inCart = false;
                    // if (tableOrder.productsInCart.isNotEmpty) {
                    //   for (int i = 0;
                    //       i < tableOrder.productsInCart.length;
                    //       i++) {
                    //     if (productData[indexProduct].id ==
                    //         tableOrder.productsInCart[i].productId) {
                    //       inCart = true;
                    //       break;
                    //     }
                    //   }
                    // }
                    List<Variations>? variations = [];
                    List<AddOn> addOns = [];
                    return BlocBuilder<ModifierCubit, ModifierState>(
                        builder: (context, modifierState) {
                      final modifiers = modifierState.data?.modifierSets ?? [];
                      for (var modifier in modifiers) {
                        for (var modifierProduct
                            in modifier.modifierProducts!) {
                          if (modifierProduct.id ==
                              proCategory[indexProduct].id) {
                            variations = modifier.variations;
                            for (var variation in variations!) {
                              addOns.add(AddOn(
                                  variationId: variation.id!,
                                  name: variation.name!,
                                  quantity: 0,
                                  price: (stringDoubleToInt(
                                      variation.defaultSellPrice))));
                            }
                          }
                        }
                      }
                      return InkWell(
                        onTap: () {
                          bool inCart = false;
                          if (tableOrder.productsInCart.isNotEmpty) {
                            for (int i = 0;
                                i < tableOrder.productsInCart.length;
                                i++) {
                              if (proCategory[indexProduct].id ==
                                  tableOrder.productsInCart[i].productId) {
                                tableOrder.tempQuantity.value =
                                    tableOrder.productsInCart[i].quantity!;
                                for (int j = 0; j < addOns.length; j++) {
                                  addOns[j].quantity = tableOrder
                                      .productsInCart[i].addOns![j].quantity;
                                }
                                inCart = true;
                                break;
                              } else {
                                tableOrder.tempQuantity.value = 1;
                              }
                            }
                          } else {
                            tableOrder.tempQuantity.value = 1;
                          }
                          setFood(
                            context: context,
                            product: proCategory[indexProduct],
                            inCart: inCart,
                            addOns: addOns,
                          );
                        },
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                  child: Center(
                                    child: Text(
                                      // inCart
                                      //     ? '${tableOrder.tempQuantity.value}x ${productData[indexProduct].name}'
                                      //     :
                                      proCategory[indexProduct].name!,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                        // color:
                                        //     inCart ? primaryColor : null
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                proCategory[indexProduct]
                                                    .imageUrl!),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(8)),
                                    child: Container(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.5),
                                          borderRadius: const BorderRadius.only(
                                            bottomLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8),
                                          ),
                                        ),
                                        width: double.infinity,
                                        height: 40,
                                        child: Center(
                                          child: Text(
                                            formatCurrency(
                                                price: defaultSellPrice!),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 17,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    });
                  },
                )
              : const NoDataWidget();
        case StatusType.error:
          return const Error404Widget();
        default:
          return const SizedBox.shrink();
      }
    });
  }

  setFood(
      {required BuildContext context,
      required Product product,
      required bool inCart,
      required List<AddOn>? addOns}) {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (context) {
          final price =
              product.productVariations![0]!.variations![0]!.defaultSellPrice;
          tempAddOns = [];
          for (var addOn in addOns!) {
            tempAddOns.add(ValueNotifier<int>(addOn.quantity));
          }
          tableOrder.totalOneItem.value = totalPriceOneItem(
              quantity: tableOrder.tempQuantity.value,
              price: price.toString(),
              addOns: addOns);
          final _addOns = addOns;
          return Container(
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_DEFAULT),
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        product.imageUrl!,
                        width: 180,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: Text(
                                  "${product.name}",
                                  style:
                                      GlobalStyles.robotoBold(context).copyWith(
                                    fontSize: 25,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            formatCurrency(price: price.toString()),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                description(context, product.productDescription ?? ''),
                const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                if (_addOns.isNotEmpty) addonsView(context, _addOns, product),
                const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    editButton(
                      width: 30,
                      height: 30,
                      icon: Icons.remove,
                      iconSize: 20,
                      onTap: () {
                        if (inCart && tableOrder.tempQuantity.value > 0) {
                          tableOrder.tempQuantity.value =
                              tableOrder.tempQuantity.value - 1;
                          tableOrder.totalOneItem.value = totalPriceOneItem(
                              quantity: tableOrder.tempQuantity.value,
                              price: price.toString(),
                              addOns: _addOns);
                        } else if (!inCart &&
                            tableOrder.tempQuantity.value > 1) {
                          tableOrder.tempQuantity.value =
                              tableOrder.tempQuantity.value - 1;
                          tableOrder.totalOneItem.value = totalPriceOneItem(
                              quantity: tableOrder.tempQuantity.value,
                              price: price.toString(),
                              addOns: _addOns);
                        }
                      },
                    ),
                    Obx(
                      () => SizedBox(
                        width: 50,
                        child: Center(
                          child: Text(
                            '${tableOrder.tempQuantity.value}',
                            style: GlobalStyles.robotoBold(context).copyWith(
                              fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
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
                        tableOrder.tempQuantity.value =
                            tableOrder.tempQuantity.value + 1;
                        tableOrder.totalOneItem.value = totalPriceOneItem(
                            quantity: tableOrder.tempQuantity.value,
                            price: price.toString(),
                            addOns: _addOns);
                      },
                    ),
                  ],
                ),
                const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
                CustomButton2(
                  height: 45,
                  width: Get.width - 60,
                  buttonText: inCart ? 'update_in_cart'.tr : 'add_to_cart'.tr,
                  printTotal: true,
                  onPressed: () async {
                    if (inCart) {
                      for (int i = 0;
                          i < tableOrder.productsInCart.length;
                          i++) {
                        if (product.id ==
                            tableOrder.productsInCart[i].productId) {
                          if (tableOrder.tempQuantity.value == 0) {
                            _globalKey.currentContext!
                                .read<CartCubit>()
                                .removeProductAt(index: i);
                            for (int i = 0; i < addOns.length; i++) {
                              addOns[i].quantity = 0;
                            }
                            break;
                          } else {
                            tableOrder.productsInCart[i].quantity =
                                tableOrder.tempQuantity.value;
                            for (int j = 0; j < _addOns.length; j++) {
                              tableOrder.productsInCart[i].addOns![j].quantity =
                                  tempAddOns[j].value;
                            }
                            break;
                          }
                        }
                      }
                      tableOrder.amountCart.value = 0;
                      for (int i = 0;
                          i < tableOrder.productsInCart.length;
                          i++) {
                        tableOrder.amountCart.value =
                            tableOrder.amountCart.value +
                                tableOrder.productsInCart[i].quantity!;
                      }
                      _globalKey.currentContext!.read<CartCubit>().getCart();
                      navigator!.pop();
                    } else {
                      for (int j = 0; j < _addOns.length; j++) {
                        _addOns[j].quantity = tempAddOns[j].value;
                      }
                      final itemProduct = ItemProduct(
                          productId: product.id!,
                          name: product.name!,
                          quantity: tableOrder.tempQuantity.value,
                          price: stringDoubleToInt(price),
                          imageUrl: product.imageUrl!,
                          addOns: _addOns);
                      _globalKey.currentContext!
                          .read<CartCubit>()
                          .addCart(itemProduct: itemProduct);
                      tableOrder.amountCart.value = 0;
                      for (int i = 0;
                          i < tableOrder.productsInCart.length;
                          i++) {
                        tableOrder.amountCart.value =
                            tableOrder.amountCart.value +
                                tableOrder.productsInCart[i].quantity!;
                      }
                      _globalKey.currentContext!.read<CartCubit>().getCart();
                      navigator!.pop();
                    }
                  },
                ),
                const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
              ],
            ),
          );
        });
  }
}
