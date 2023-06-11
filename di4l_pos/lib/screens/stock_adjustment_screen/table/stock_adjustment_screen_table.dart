import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:di4l_pos/screens/main_screen/mobile/widgets/my_appbar.dart';
import 'package:di4l_pos/screens/stock_adjustment_screen/cubit/stock_adjustment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockAdjustmentScreenTable extends StatefulWidget {
  const StockAdjustmentScreenTable({Key? key}) : super(key: key);
  static BlocProvider<StockAdjustmentCubit> provider() {
    return BlocProvider(
      create: (context) => StockAdjustmentCubit(),
      child: const StockAdjustmentScreenTable(),
    );
  }

  @override
  _StockAdjustmentScreenTableState createState() => _StockAdjustmentScreenTableState();
}

class _StockAdjustmentScreenTableState extends State<StockAdjustmentScreenTable>
    with AfterLayoutMixin<StockAdjustmentScreenTable> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {}

  int dropdownValue = 25;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      key: _globalKey,
      appBar: const MyAppBar(
        title: Text('Stock Adjustments '),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
