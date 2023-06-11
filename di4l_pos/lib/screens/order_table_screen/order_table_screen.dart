import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:di4l_pos/common/dimensions.dart';
import 'package:di4l_pos/common/storage/app_prefs.dart';
import 'package:di4l_pos/enums/status_type.dart';
import 'package:di4l_pos/get_it.dart';
import 'package:di4l_pos/screens/cart_table_order_screen/cubit/table_order_cubit.dart';
import 'package:di4l_pos/screens/products_screen/cubit/products_cubit.dart';
import 'package:di4l_pos/screens/table_order_screen/mobile/table_order_mobile_screen.dart';
import 'package:di4l_pos/screens/table_order_screen/widgets/cart_button.dart';
import 'package:di4l_pos/widgets/data/404_widget.dart';
import 'package:di4l_pos/widgets/data/app_loading_widget.dart';
import 'package:di4l_pos/widgets/data/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:di4l_pos/common/global_styles.dart';

import '../order_screen/cubit/order_cubit.dart';

class OrderTableScreen extends StatefulWidget {
  static MultiBlocProvider provider() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SalesOrderCubit>(
          create: (context) => SalesOrderCubit(),
        ),
        BlocProvider<TableCubit>(
          create: (BuildContext context) => TableCubit(),
        ),
        BlocProvider<ProductsCubit>(
          create: (BuildContext context) => ProductsCubit(),
        ),
      ],
      child: const OrderTableScreen(),
    );
  }

  const OrderTableScreen({Key? key}) : super(key: key);

  @override
  State<OrderTableScreen> createState() => _OrderTableScreenState();
}

class _OrderTableScreenState extends State<OrderTableScreen>
    with AfterLayoutMixin {
  /// MARK: - Initials;
  int? selectedIndex = 0;
  bool isCart = true;
  bool isEdit = false;
  final _appPrefs = getIt<AppPref>();
  final tableOrder = Get.put(TableOrderController());
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context.read<SalesOrderCubit>().getSell();
    context.read<ProductsCubit>().getProducts();
    context.read<TableCubit>().getTables();
  }

  int stringToInt(String? str) {
    return (double.parse(str!)).toInt();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        key: _globalKey,
        leading: MaterialButton(
          onPressed: () {
            navigator!.pop();
          },
          child: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
          ),
        ),
        title: Text('table_order'.tr),
        titleTextStyle: GlobalStyles.robotoBold(context).copyWith(
          fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
          color: Colors.black,
        ),
        toolbarHeight: 55,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 10,
        shadowColor: Colors.white54,
        actions: const [
          CartButton(),
        ],
      ),
      body: BlocBuilder<SalesOrderCubit, SalesOrderState>(
        buildWhen: (previous, current) =>
            previous.data!.status != current.data!.status,
        builder: (context, sellState) {
          final sellData = sellState.data?.sells ?? [];
          switch (sellState.data!.status) {
            case StatusType.loading:
              return const AppLoadingWidget(
                widget: null,
                text: 'Loading...',
              );
            case StatusType.loaded:
              return sellData.isNotEmpty
                  ? ListView.builder(
                      itemCount: sellData.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: index != sellData.length - 1
                              ? const EdgeInsets.fromLTRB(20, 20, 20, 0)
                              : const EdgeInsets.all(20),
                          child: Container(
                            height: 150,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.2),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: const Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                          ),
                        );
                      })
                  : const NoDataWidget();
            case StatusType.error:
              return const Error404Widget();
            default:
              return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
