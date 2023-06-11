import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:di4l_pos/common/global_colors.dart';
import 'package:di4l_pos/common/global_styles.dart';
import 'package:di4l_pos/enums/status_type.dart';
import 'package:di4l_pos/route_generator.dart';
import 'package:di4l_pos/screens/contacts_screen/widgets/scroll_animated_button_widget.dart';
import 'package:di4l_pos/screens/stock_transfers_screen/cubit/stock_transfers_cubit.dart';
import 'package:di4l_pos/screens/stock_transfers_screen/mobile/widget/all_stock_transfers_mobile.dart';
import 'package:di4l_pos/widgets/data/404_widget.dart';
import 'package:di4l_pos/widgets/data/app_loading_widget.dart';
import 'package:di4l_pos/widgets/data/no_data_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class StockTranfersScreenMobile extends StatefulWidget {
  const StockTranfersScreenMobile({Key? key}) : super(key: key);
  static BlocProvider<StockTransfersCubit> provider() {
    return BlocProvider(
      create: (context) => StockTransfersCubit(),
      child: const StockTranfersScreenMobile(),
    );
  }

  @override
  _stockTransferscreenMobileState createState() =>
      _stockTransferscreenMobileState();
}

class _stockTransferscreenMobileState extends State<StockTranfersScreenMobile>
    with AfterLayoutMixin<StockTranfersScreenMobile> {
  final ScrollController _scrollController = ScrollController();
  TextEditingController textController = TextEditingController();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context.read<StockTransfersCubit>().getStockTransfers();
  }

  int dropdownValue = 25;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black, size: 23),
        elevation: 0.5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'stock_transfers'.tr,
            style: GlobalStyles.normalStyle.copyWith(
              color: GlobalColors.primaryWebColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: AnimSearchBar(
              helpText: 'search'.tr,
              prefixIcon: const Icon(
                Icons.search_outlined,
                color: GlobalColors.primaryWebColor,
                size: 30,
              ),
              suffixIcon: const Icon(Icons.close_fullscreen_outlined),
              width: MediaQuery.of(context).size.width,
              boxShadow: false,
              textController: textController,
              onSuffixTap: () {
                setState(() {
                  textController.clear();
                });
              },
              onSubmitted: (String) {},
            ),
          ),
        ],
      ),
      backgroundColor: GlobalColors.kDarkWhite,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'all_stock_transfers'.tr,
                  style: const TextStyle(
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold,
                    color: GlobalColors.primaryColor,
                  ),
                ),
                SizedBox(
                  height: 40,
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () => navigator!.pushNamed(
                      RouteGenerator.stockAdjustmentScreen,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        GlobalColors.flButtonColor,
                      ),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    child: Text(
                      'stock_adjustments'.tr,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontFamily: 'Roboto',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<StockTransfersCubit, StockTransfersState>(
            buildWhen: ((previous, current) =>
                previous.data!.status != current.data!.status),
            builder: (context, state) {
              final _stockTransfers = state.data?.stockTransfers ?? [];
              switch (state.data!.status) {
                case StatusType.loading:
                  return const AppLoadingWidget(
                    widget: null,
                    text: 'Loading...',
                  );
                case StatusType.loaded:
                  return _stockTransfers.isNotEmpty
                      ? Expanded(
                          child: ListView.builder(
                            itemCount: _stockTransfers.length,
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return AllStockTransfersMobile(
                                stockTransfersData:
                                    _stockTransfers.elementAt(index),
                                function: () => context
                                    .read<StockTransfersCubit>()
                                    .deleteStockTransfer(
                                        id: _stockTransfers
                                            .elementAt(index)
                                            .id!),
                              );
                            },
                          ),
                        )
                      : const NoDataWidget();
                case StatusType.error:
                  return const Error404Widget();
                default:
                  return const SizedBox.shrink();
              }
            },
          ),
        ],
      ),
      floatingActionButton: ScrollingFabAnimatedCustom(
        width: 210,
        height: 48,
        text: 'add_stock_transfers'.tr,
        iconData: Icons.add,
        scrollController: _scrollController,
        onPress: () => navigator!.pushNamed(
          RouteGenerator.addStockTransfersScreen,
        ),
      ),
    );
  }
}
