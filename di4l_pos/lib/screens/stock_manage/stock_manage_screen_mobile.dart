import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:di4l_pos/route_generator.dart';
import 'package:di4l_pos/screens/products_screen/cubit/products_cubit.dart';
import 'package:di4l_pos/screens/reports_screen/subscreen/stock_screen/cubit/stock_cubit.dart';
import 'package:di4l_pos/screens/reports_screen/subscreen/stock_screen/widgets/products_in_stock_widget.dart';
import 'package:di4l_pos/screens/stock_manage/cubit/stock_manage_cubit.dart';
import 'package:di4l_pos/screens/stock_manage/widget/expense_product.dart';
import 'package:di4l_pos/screens/stock_manage/widget/sort_filter_buttons.dart';
import 'package:di4l_pos/screens/stock_manage/widget/stock_button.dart';
import 'package:di4l_pos/screens/stock_manage/widget/value_box.dart';
import 'package:di4l_pos/widgets/custom_appbar.dart';
import 'package:di4l_pos/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../../../common/global_colors.dart';
import '../../../common/global_styles.dart';

class StockManageScreenMobile extends StatefulWidget {
  const StockManageScreenMobile({Key? key}) : super(key: key);

  @override
  _StockManageScreenMobileState createState() =>
      _StockManageScreenMobileState();

  static BlocProvider<StockManageCubit> provider() {
    return BlocProvider(
      create: (context) => StockManageCubit(),
      child: StockManageScreenMobile(),
    );
  }
}

class _StockManageScreenMobileState extends State<StockManageScreenMobile>
    with AfterLayoutMixin {
  TextEditingController textController = TextEditingController();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context.read<StockManageCubit>().getReportStockManages();
    _txtSearchController.addListener(() {
      context
          .read<StockManageCubit>()
          .searchProduct(searchText: _txtSearchController.text);
    });
  }

  bool isOpenSearch = false;
  final TextEditingController _txtSearchController = TextEditingController();
  int dropdownValue = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: BlocBuilder<StockManageCubit, StockManageState>(
          buildWhen: (previous, current) => (previous.data!.isCategoryScreen !=
              current.data!.isCategoryScreen),
          builder: (context, state) => CustomAppBar(
            backgroundColor: Colors.white,
            textColor: GlobalColors.getTextTitle(context),
            title: 'Kho Hàng'.tr,
            actions: [
              IconButton(
                icon: const Icon(
                  Icons.qr_code_scanner,
                ),
                onPressed: () =>
                    navigator?.pushNamed(RouteGenerator.scanBarCodeScreen),
              ),
              !state.data!.isCategoryScreen
                  ? IconButton(
                      onPressed: () {
                        _globalKey.currentContext!
                            .read<StockManageCubit>()
                            .isOpenSearch(!isOpenSearch);
                        isOpenSearch = !isOpenSearch;
                      },
                      icon: const Icon(
                        Icons.search,
                      ),
                    )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
      key: _globalKey,
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          BlocBuilder<StockManageCubit, StockManageState>(
            buildWhen: (previous, current) =>
                previous.data!.isOpenSearch != current.data!.isOpenSearch,
            builder: (context, state) {
              return AnimatedContainer(
                height: !state.data!.isOpenSearch ? 0 : 50,
                color: Colors.white,
                alignment: Alignment.center,
                duration: const Duration(seconds: 1),
                curve: Curves.fastOutSlowIn,
                child: SearchWidget(
                  controller: _txtSearchController,
                  hintText: state.data!.isCategoryScreen
                      ? 'search'.tr
                      : 'search_product'.tr,
                  // onPressedFilter: () => _weSlideController.show()
                ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Mã sản phẩm',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        navigator!.pushNamed(RouteGenerator.reportScreen);
                      },
                      child: Row(
                        children: const [
                          Icon(
                            Icons.report,
                            color: Colors.blue,
                          ),
                          Text(
                            'Báo cáo',
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const ValueBox(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: StockButtons(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SortFilterButtons(),
          ),
          const ExpenseProduct(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Action when Decrease button is pressed
                    },
                    icon: const Icon(Icons.arrow_downward),
                    label: Flexible(
                      child: Text('Điều chỉnh giảm'),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(width: 15),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Action when Add button is pressed
                    },
                    icon: const Icon(Icons.arrow_upward),
                    label: Flexible(
                      child: Text('Nhập hàng'),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
