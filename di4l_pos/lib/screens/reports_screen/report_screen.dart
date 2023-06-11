import 'package:di4l_pos/common/dimensions.dart';
import 'package:di4l_pos/screens/reports_screen/subscreen/expense_screen/expense_report_screen.dart';
import 'package:di4l_pos/screens/reports_screen/subscreen/profit_and_loss_screen/profit_and_loss_screen.dart';
import 'package:di4l_pos/screens/reports_screen/subscreen/sell_report_screen/sell_report_screen.dart';
import 'package:di4l_pos/screens/reports_screen/subscreen/stock_screen/stock_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/global_colors.dart';
import '../../widgets/custom_appbar.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportState();
}

class _ReportState extends State<ReportScreen> {
  TextStyle thu = const TextStyle(
      color: Color.fromARGB(255, 1, 117, 40), fontWeight: FontWeight.w600);
  TextStyle chi = const TextStyle(
      color: Color.fromARGB(255, 241, 65, 0), fontWeight: FontWeight.w600);
  TextStyle grey = const TextStyle(color: Color.fromARGB(255, 129, 125, 125));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.bgColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CustomAppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          textColor: GlobalColors.getTextTitle(context),
          title: 'reports'.tr,
        ),
      ),
      body: SafeArea(child: Tabbar(context)),
    );
  }

  Widget Tabbar(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return DefaultTabController(
      length: 4,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                width: w,
                height: 40,
                child: TabBar(
                    isScrollable: true,
                    indicatorColor: Color.fromARGB(255, 1, 117, 40),
                    unselectedLabelColor: Color.fromARGB(255, 104, 104, 104),
                    labelColor: Color.fromARGB(255, 1, 117, 40),
                    labelStyle: TextStyle(
                      fontSize: 16,
                    ),
                    tabs: [
                      Tab(
                        text: 'sale_orders'.tr,
                      ),
                      Tab(
                        text: 'review_report'.tr,
                      ),
                      Tab(
                        text: 'stock'.tr,
                      ),
                      Tab(
                        text: 'expense'.tr,
                      ),
                    ]),
              ),
            ],
          ),
          // tap bar view
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: Dimensions.PADDING_SIZE_SMALL),
              child: TabBarView(
                children: [
                  //cửa hàng
                  SellReportScreen.provider(),
                  //lãi lỗ
                  ProfitAndLossScreen.provide(),
                  // kho hàng
                  StockScreen.provider(),
                  // Tap3Screen(),
                  // thu chi
                  ExpenseReportScreen.provider()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
