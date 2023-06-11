import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:di4l_pos/screens/main_screen/mobile/widgets/my_appbar.dart';
import 'package:di4l_pos/screens/stock_adjustment_screen/cubit/stock_adjustment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StockTransfersScreenTable extends StatefulWidget {
  const StockTransfersScreenTable({Key? key}) : super(key: key);
  static BlocProvider<StockAdjustmentCubit> provider() {
    return BlocProvider(
      create: (context) => StockAdjustmentCubit(),
      child: const StockTransfersScreenTable(),
    );
  }

  @override
  _StockTransfersScreenTableState createState() =>
      _StockTransfersScreenTableState();
}

class _StockTransfersScreenTableState extends State<StockTransfersScreenTable>
    with AfterLayoutMixin<StockTransfersScreenTable> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {}

  int dropdownValue = 25;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: const MyAppBar(
        title: Text('Stock Transfers '),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
