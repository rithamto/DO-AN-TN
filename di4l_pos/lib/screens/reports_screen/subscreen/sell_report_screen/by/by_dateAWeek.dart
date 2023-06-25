import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:di4l_pos/common/dimensions.dart';
import 'package:di4l_pos/common/global_colors.dart';
import 'package:di4l_pos/common/global_images.dart';
import 'package:di4l_pos/common/global_styles.dart';
import 'package:di4l_pos/screens/reports_screen/subscreen/sell_report_screen/cubit/sell_report_cubit.dart';
import 'package:di4l_pos/screens/reports_screen/widget/by_orders_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:radio_grouped_buttons/custom_buttons/custom_radio_buttons_group.dart';

class ByWeek extends StatefulWidget {
  const ByWeek({Key? key}) : super(key: key);
  static BlocProvider<SellReportCubit> provider() {
    return BlocProvider(
      create: (context) => SellReportCubit(),
      child: const ByWeek(),
    );
  }

  @override
  State<ByWeek> createState() => _ByWeekState();
}

class _ByWeekState extends State<ByWeek> with AfterLayoutMixin {
  // final ScrollController _scrollController = ScrollController();
  final TextEditingController _txtDateStart = TextEditingController(text: "");
  final TextEditingController _txtDateEnd = TextEditingController(text: "");
  List<String> buttonList = [
    "today".tr,
    "yesterday".tr,
    "this_month".tr,
    "last_month".tr,
    "last_30_days".tr,
    "this_year".tr,
    "all".tr,
  ];
  List<String> buttonValue = [
    "today",
    "yesterday",
    "this_month",
    "last_month",
    "last_30_days",
    "this_year",
    "all",
  ];

  late String? titleButton = "all".tr;

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    // DateTime firstDayCurrentMonth = DateTime.utc(DateTime.now().year, DateTime.now().month, 1);
    // String formattedDate = DateFormat('yyyy-MM-dd').format(firstDayCurrentMonth);
    // var now = DateTime.now();
    // var today = DateFormat('yyyy-MM-dd').format(now);
    // context.read<SellReportCubit>().getProfitDay(formattedDate, today);
    context.read<SellReportCubit>().getProfitDay(_txtDateStart.text, _txtDateEnd.text);
  }

  @override
  Widget build(BuildContext context) {
    //  setupScrollController(context);
    return Scaffold(
        backgroundColor: GlobalColors.bgColor,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              buildFilter(),
              buildChart(),  
            ],
          ),
          ),
      );
  }

  double count(List<double> lst){
    for(var i = 0; i <= lst.length - 1; i = i + 1){
      if(lst[i] < 0){
        lst[i] = -lst[i];
      }
    }
    return findMax(lst)/findMin(lst);
  }

  double findMax(List<double> lst){
    double MAX = lst[0];
    for(var i = 0; i <= lst.length - 1; i = i + 1){
      if(MAX < lst[i]){
        MAX = lst[i];
      }
    }
    return MAX;
  }

  double findMin(List<double> lst){
    double MIN = lst[0];
    for(var i = 0; i <= lst.length - 1; i = i + 1){
      if(MIN > lst[i]){
        MIN = lst[i];
      }
    }
    return MIN;
  }

  BlocBuilder<SellReportCubit, SellReportState> buildChart() {
    return BlocBuilder<SellReportCubit, SellReportState>(
      builder: (context, state) {
        final profitDay = state.data!.profitDay;
        final monday = double.parse(profitDay?.monday ?? "0");
        final tuesday = double.parse(profitDay?.tuesday ?? "0");
        final wednesday = double.parse(profitDay?.wednesday ?? "0");
        final thursday = double.parse(profitDay?.thursday ?? "0");
        final friday = double.parse(profitDay?.friday ?? "0");
        final saturday = double.parse(profitDay?.saturday ?? "0");
        final sunday = double.parse(profitDay?.sunday ?? "0");
        var lst = [monday, tuesday, wednesday, thursday, friday, saturday, sunday];
        return Container(
          width: double.infinity,
          height: 600,
          child: BarChart(
            BarChartData(
              barTouchData: barTouchData,
              titlesData: titlesData,
              borderData: borderData,
              barGroups: [
                BarChartGroupData(
                  x: 0,
                  barRods: [
                    BarChartRodData(
                      color: GlobalColors.primaryColor,
                      toY: monday,
                      gradient: _barsGradient,
                    )
                  ],
                  groupVertically: true,
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 1,
                  barRods: [
                    BarChartRodData(
                      color: GlobalColors.primaryColor,
                      toY: tuesday,
                      gradient: _barsGradient,
                    )
                  ],
                  groupVertically: true,
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 2,
                  barRods: [
                    BarChartRodData(
                      color: GlobalColors.primaryColor,
                      toY: wednesday,
                      gradient: _barsGradient,
                    )
                  ],
                  groupVertically: true,
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 3,
                  barRods: [
                    BarChartRodData(
                      color: GlobalColors.primaryColor,
                      toY: thursday,
                      gradient: _barsGradient,
                    )
                  ],
                  groupVertically: true,
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 4,
                  barRods: [
                    BarChartRodData(
                      color: GlobalColors.primaryColor,
                      toY: friday,
                      gradient: _barsGradient,
                    )
                  ],
                  groupVertically: true,
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 5,
                  barRods: [
                    BarChartRodData(
                      color: GlobalColors.primaryColor,
                      toY: saturday,
                      gradient: _barsGradient,
                    )
                  ],
                  groupVertically: true,
                  showingTooltipIndicators: [0],
                ),
                BarChartGroupData(
                  x: 6,
                  barRods: [
                    BarChartRodData(                                    
                      color: GlobalColors.primaryColor,
                      toY: sunday,
                      gradient: _barsGradient,
                    )
                  ],
                  groupVertically: true,
                  showingTooltipIndicators: [0],
                ),
              ],
              gridData: FlGridData(show: false),
              alignment: BarChartAlignment.spaceAround,
              maxY: findMax(lst) * 1.2,
              minY: findMin(lst) * 1.2
            ),
          ),
        );
      },
    );
  }

  Container buildFilter() {
    return Container(
        width: double.infinity,
        color: Colors.white,
        padding: const EdgeInsets.only(left: 10, right: 10),
        margin: const EdgeInsets.only(top: 5, bottom: 100),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: TextButton(
                child: const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.black,
                  size: 25,
                ),
                onPressed: () {
                  showModalBottomSheet(
                      constraints: BoxConstraints(
                          maxHeight: MediaQuery.of(context).size.height - 120),
                      enableDrag: true,
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.0),
                      )),
                      backgroundColor: Colors.transparent,
                      isScrollControlled: true,
                      isDismissible: true,
                      context: context,
                      builder: (context) {
                        return Column(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                ),
                                height: 4,
                                width: 35,
                                margin: const EdgeInsets.only(bottom: 10)),
                            Expanded(
                              child: Container(
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(10.0),
                                    )),
                                width: double.infinity,
                                child: Scaffold(
                                    backgroundColor: Colors.transparent,
                                    appBar: AppBar(
                                      toolbarHeight: 50,
                                      title: Text('filter'.tr,
                                          style: GlobalStyles.titilliumRegular(
                                                  context)
                                              .copyWith(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                      backgroundColor: Colors.white,
                                      foregroundColor: Colors.black,
                                      automaticallyImplyLeading: false,
                                      centerTitle: true,
                                      elevation: 0.7,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(10.0),
                                      )),
                                      actions: [
                                        IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            icon: const Icon(
                                              Icons.clear,
                                              // size: Dimensions
                                              //     .ICON_SIZE_DEFAULT,
                                            ))
                                      ],
                                    ),
                                    body: Container(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          buildRadioButton(context),
                                          const SizedBox(height: 20),
                                          Text('custom_time'.tr),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Row(
                                              // crossAxisAlignment:
                                              //     CrossAxisAlignment.end,
                                              children: [
                                                Text(
                                                  'to'.tr,
                                                  style: const TextStyle(
                                                    color: GlobalColors
                                                        .kGreyTextColor,
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                Flexible(
                                                  child: TextField(
                                                    controller: _txtDateStart,
                                                    readOnly: true,
                                                    onTap: () async {
                                                      DateTime? dateTime =
                                                          await showDatePicker(
                                                              context: context,
                                                              initialDate:
                                                                  DateTime
                                                                      .now(),
                                                              firstDate:
                                                                  DateTime(
                                                                      1970),
                                                              lastDate:
                                                                  DateTime(
                                                                      2101));
                                                      if (dateTime != null) {
                                                        print(
                                                            dateTime); //dateTime output format => 2021-03-10 00:00:00.000
                                                        String formattedDate =
                                                            DateFormat(
                                                                    'yyyy-MM-dd')
                                                                .format(
                                                                    dateTime);
                                                        print(
                                                            formattedDate); //formatted date output using intl package =>  2021-03-16
                                                        //you can implement different kind of Date Format here according to your requirement

                                                        setState(() {
                                                          _txtDateStart.text =
                                                              formattedDate; //set output date to TextField value.
                                                        });
                                                      } else {
                                                        print(
                                                            "Date is not selected");
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            padding: const EdgeInsets.only(
                                                right: 10),
                                            child: Row(
                                              children: [
                                                Text(
                                                  'from'.tr,
                                                  style: const TextStyle(
                                                    color: GlobalColors
                                                        .kGreyTextColor,
                                                  ),
                                                ),
                                                const SizedBox(width: 10),
                                                Container(
                                                  child: Flexible(
                                                    child: TextFormField(
                                                      controller: _txtDateEnd,
                                                      readOnly: true,
                                                      onTap: () async {
                                                        DateTime? dateTime =
                                                            await showDatePicker(
                                                                context:
                                                                    context,
                                                                initialDate:
                                                                    DateTime
                                                                        .now(),
                                                                firstDate:
                                                                    DateTime(
                                                                        1970),
                                                                lastDate:
                                                                    DateTime(
                                                                        2101));
                                                        if (dateTime != null) {
                                                          print(
                                                              dateTime); //dateTime output format => 2021-03-10 00:00:00.000
                                                          String formattedDate =
                                                              DateFormat(
                                                                      'yyyy-MM-dd')
                                                                  .format(
                                                                      dateTime);
                                                          print(
                                                              formattedDate); //formatted date output using intl package =>  2021-03-16
                                                          //you can implement different kind of Date Format here according to your requirement

                                                          setState(() {
                                                            _txtDateEnd.text =
                                                                formattedDate; //set output date to TextField value.
                                                          });
                                                        } else {
                                                          print(
                                                              "Date is not selected");
                                                        }
                                                      },
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    bottomNavigationBar:
                                        buildButtonBottomSheet()),
                              ),
                            )
                          ],
                        );
                      });
                  //
                },
              ),
            ),
            const SizedBox(width: 10),
            Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(5),
                ),
                child:
                    // buildButtonTabBar(),

                    TextButton(
                  style: TextButton.styleFrom(
                      primary: GlobalColors.primaryColor,
                      backgroundColor: Colors.white),
                  onPressed: () {},
                  child: Text(titleButton!),
                )),
          ],
        ));
  }

  Container buildRadioButton(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: CustomRadioButton(
        elevation: 0.1,
        fontSize: Dimensions.FONT_SIZE_DEFAULT,
        textColor: GlobalColors.kGreyTextColor,
        selectedTextColor: GlobalColors.flButtonColor,
        buttonBorderColor: GlobalColors.flButtonColor,
        buttonLables: buttonList,
        buttonValues: buttonValue,
        radioButtonValue: (value, index) {
          var now = DateTime.now();

          var today = DateFormat('yyyy-MM-dd').format(now);

          var yesterday = DateFormat('yyyy-MM-dd')
              .format(now.subtract(const Duration(days: 1)));

          var last30Day = DateFormat('yyyy-MM-dd')
              .format(now.subtract(const Duration(days: 30)));

          var thisMonthStart =
              DateFormat('yyyy-MM-dd').format(DateTime(now.year, now.month, 1));
          var thisMonthEnd = DateFormat('yyyy-MM-dd')
              .format(DateTime(now.year, now.month + 1, 0));

          var lastMonthStart = DateFormat('yyyy-MM-dd')
              .format(DateTime(now.year, now.month - 1, 1));
          var lastMonthEnd =
              DateFormat('yyyy-MM-dd').format(DateTime(now.year, now.month, 0));

          var thisYearStart =
              DateFormat('yyyy-MM-dd').format(DateTime(now.year, 1, 1));
          var thisYearEnd =
              DateFormat('yyyy-MM-dd').format(DateTime(now.year + 1, 1, 0));

          if (value == 'all') {
            setState(() {            
            _txtDateStart.text = '';
            _txtDateEnd.text = '';
              titleButton = "all".tr;
            });
          } else if (value == 'today'){
            setState(() { 
            _txtDateStart.text = today;
            _txtDateEnd.text = today;
              titleButton = "today".tr;
            });
          } else if (value == 'yesterday'){
            setState(() { 
            _txtDateStart.text = yesterday;
            _txtDateEnd.text = yesterday;
              titleButton = "yesterday".tr;
            });
          } else if (value == 'this_month') {
            setState(() {
            _txtDateStart.text = thisMonthStart;
            _txtDateEnd.text = thisMonthEnd;
              titleButton = "this_month".tr;
            });
          } else if (value == 'last_month') {
            setState(() {
            _txtDateStart.text = lastMonthStart;
            _txtDateEnd.text = lastMonthEnd;
              titleButton = "last_month".tr;
            });
          } else if (value == 'last_30_days') {
            setState(() {
            _txtDateStart.text = last30Day;
            _txtDateEnd.text = today;
              titleButton = "last_30_days".tr;
            });
          } else if (value == 'this_year') {
            setState(() {
            _txtDateStart.text = thisYearStart;
            _txtDateEnd.text = thisYearEnd;
              titleButton = "this_year".tr;
            });
          }
        },
        horizontal: true,
        buttonSpace: 10,
        initialSelection: 6,
        buttonColor: GlobalColors.bgColor,
        selectedColor: GlobalColors.bgColor,
        buttonWidth: 150,
      ),
    );
  }

   Container buildButtonBottomSheet() {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 1, color: Colors.black.withOpacity(0.1)))),
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  side: const BorderSide(),
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  fixedSize: const Size(160, 45)),
              onPressed: () {
                _txtDateStart.text = '';
                _txtDateEnd.text = '';
              },
              child: Text(
                'reset'.tr,
                style: TextStyle(fontSize: Dimensions.FONT_SIZE_LARGE),
              )),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                side: const BorderSide(color: GlobalColors.primaryColor),
                backgroundColor: GlobalColors.primaryColor,
                fixedSize: const Size(160, 45)),
            onPressed: () {
              context
                  .read<SellReportCubit>()
                  .getProfitDay(_txtDateStart.text, _txtDateEnd.text)
                  .whenComplete(() => Navigator.pop(context));
            },
            child: Text(
              'apply'.tr,
              style: TextStyle(fontSize: Dimensions.FONT_SIZE_LARGE),
            ),
          )
        ],
      ),
    );
  }
}

  FlBorderData get borderData => FlBorderData(
        show: false,
      );

  LinearGradient get _barsGradient => LinearGradient(
        colors: [
          GlobalColors.appBar2,
          GlobalColors.appBar3,
        ],
        begin: Alignment.bottomCenter,
        end: Alignment.topCenter,
      );

  FlTitlesData get titlesData => FlTitlesData(
        show: true,
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            getTitlesWidget: getTitles,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );


  Widget getTitles(double value, TitleMeta meta) {
    final style = TextStyle(
      color: GlobalColors.bgOrange,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    String text;
    switch (value.toInt()) {
      case 0:
        text = 'Mon';
        break;
      case 1:
        text = 'Tue';
        break;
      case 2:
        text = 'Wed';
        break;
      case 3:
        text = 'Thu';
        break;
      case 4:
        text = 'Fri';
        break;
      case 5:
        text = 'Sat';
        break;
      case 6:
        text = 'Sun';
        break;
      default:
        text = '';
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 4,
      child: Text(text, style: style),
    );
  }

  BarTouchData get barTouchData => BarTouchData(
        enabled: false,
        touchTooltipData: BarTouchTooltipData(
          tooltipBgColor: Colors.transparent,
          tooltipPadding: EdgeInsets.zero,
          tooltipMargin: 8,
          getTooltipItem: (
            BarChartGroupData group,
            int groupIndex,
            BarChartRodData rod,
            int rodIndex,
          ) {
            return BarTooltipItem(
              rod.toY.round().toString(),
              const TextStyle(
                color: GlobalColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            );
          },
        ),
      );