import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:di4l_pos/common/dimensions.dart';
import 'package:di4l_pos/common/global_colors.dart';
import 'package:di4l_pos/models/reports/responses/report_stock_response.dart';
import 'package:di4l_pos/screens/products_screen/cubit/products_cubit.dart';
import 'package:di4l_pos/screens/reports_screen/subscreen/stock_screen/cubit/stock_cubit.dart';
import 'package:di4l_pos/screens/reports_screen/subscreen/stock_screen/widgets/products_in_stock_widget.dart';
import 'package:di4l_pos/screens/stock_manage/cubit/stock_manage_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ExpenseProduct extends StatefulWidget {
  const ExpenseProduct({Key? key}) : super(key: key);

  static BlocProvider<StockManageCubit> provider() {
    return BlocProvider(
      create: (context) => StockManageCubit(),
      child: ExpenseProduct(),
    );
  }

  @override
  State<ExpenseProduct> createState() {
    return _ExpenseProduct();
  }
}

class _ExpenseProduct extends State<ExpenseProduct> with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context.read<StockManageCubit>().getReportStockManages();
    _txtSearchController.addListener(() {
      context
          .read<StockManageCubit>()
          .searchProduct(searchText: _txtSearchController.text);
    });
  }

  TextEditingController textController = TextEditingController();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  final TextEditingController _txtSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: BlocBuilder<StockManageCubit, StockManageState>(
                  builder: (context, state) {
                    final _stocks = state.data?.reportStockManages ?? [];
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return ProductsInStock.provider(
                          index: index + 1,
                          reportStockData: _stocks[index],
                        );
                      },
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: _stocks.length,
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
