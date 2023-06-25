import 'dart:async';
import 'package:after_layout/after_layout.dart';
import 'package:di4l_pos/common/dimensions.dart';
import 'package:di4l_pos/common/global_colors.dart';
import 'package:di4l_pos/enums/status_type.dart';
import 'package:di4l_pos/models/reports/responses/report_stock_response.dart';
import 'package:di4l_pos/screens/products_screen/cubit/products_cubit.dart';
import 'package:di4l_pos/screens/reports_screen/subscreen/stock_screen/cubit/stock_cubit.dart';
import 'package:di4l_pos/screens/reports_screen/subscreen/stock_screen/widgets/products_in_stock_widget.dart';
import 'package:di4l_pos/screens/stock_manage/cubit/stock_manage_cubit.dart';
import 'package:di4l_pos/widgets/data/404_widget.dart';
import 'package:di4l_pos/widgets/data/app_loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ExpenseProduct extends StatefulWidget {
  const ExpenseProduct({Key? key}) : super(key: key);

  @override
  State<ExpenseProduct> createState() {
    return _ExpenseProduct();
  }
}

class _ExpenseProduct extends State<ExpenseProduct> {

  // TextEditingController textController = TextEditingController();
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();
  // final TextEditingController _txtSearchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      key: _globalKey,
      child: Container(
        padding: const EdgeInsets.all(16),
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
                  buildWhen: (previous, current) =>
                      previous.data!.status != current.data!.status ||
                      previous.data!.products != current.data!.products,
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
