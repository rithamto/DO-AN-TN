import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:di4l_pos/route_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_scrolling_fab_animated/flutter_scrolling_fab_animated.dart';
import 'package:get/get.dart';

import 'package:di4l_pos/common/dimensions.dart';
import 'package:di4l_pos/common/global_colors.dart';
import 'package:di4l_pos/common/global_images.dart';
import 'package:di4l_pos/screens/expense_screen/cubit/expense_cubit.dart';
import 'package:di4l_pos/screens/expense_screen/widgets/showbottom_filter.dart';
import 'package:di4l_pos/screens/expense_screen/widgets/table_data_revenue_expense.dart';
import 'package:di4l_pos/screens/expense_screen/widgets/total_expense.dart';

import 'search.dart';

class RevenueExpensePage extends StatefulWidget {
  const RevenueExpensePage({Key? key}) : super(key: key);

  static BlocProvider<ExpenseCubit> provider() {
    return BlocProvider(
      create: (context) => ExpenseCubit(),
      child: const RevenueExpensePage(),
    );
  }

  @override
  State<RevenueExpensePage> createState() => _RevenueExpensePage();
}

class _RevenueExpensePage extends State<RevenueExpensePage>
    with AfterLayoutMixin {
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context.read<ExpenseCubit>().getExpenses();
  }

  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: Text(
          'expense'.tr,
          style: const TextStyle(fontSize: Dimensions.FONT_SIZE_LARGE),
        ),
        backgroundColor: GlobalColors.primaryColor,
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          buildHeaderContent(context),
          BlocBuilder<ExpenseCubit, ExpenseState>(
            builder: (context, state) {
              return TotalExpenseWidget(
                totalExpense: '${state.data!.totalExpense}',
                totalRevenue: '${state.data!.totalRevenue}',
              );
            },
          ),
          buildBodyContent(),
        ],
      ),
      floatingActionButton: buildFooterContent(),
    );
  }

  Container buildHeaderContent(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 255, 255, 255),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            constraints: const BoxConstraints(
                minWidth: 20, maxWidth: 40, minHeight: 20, maxHeight: 40),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xffE8E9EE),
            ),
            child: IconButton(
              onPressed: () {
                showModalBottomSheet<void>(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  context: context,
                  builder: (BuildContext context) => const Filter(),
                );
              },
              icon: const Icon(
                Icons.calendar_month,
                color: Color(0xff1C2125),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Search(),
                ),
              );
            },
            icon: Image.asset(
              GlobalImages.search,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildBodyContent() => const Expanded(
        child: SingleChildScrollView(
          child: TableExpense(),
        ),
      );

  Widget buildFooterContent() {
    return ScrollingFabAnimated(
      width: 180,
      height: 35,
      elevation: 0,
      color: GlobalColors.primaryColor,
      icon: const Icon(
        Icons.add,
        size: 18,
        color: Colors.white,
      ),
      text: Text(
        'addExpense'.tr,
        style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.FONT_SIZE_LARGE),
      ),
      onPress: () => navigator!.pushNamed(RouteGenerator.addExpense).then(
          (value) =>
              _globalKey.currentContext!.read<ExpenseCubit>().getExpenses()),
      scrollController: ScrollController(),
      animateIcon: false,
    );
  }
}
