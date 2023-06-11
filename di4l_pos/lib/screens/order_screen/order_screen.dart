// ignore_for_file: depend_on_referenced_packages, prefer_typing_uninitialized_variables, annotate_overrides, non_constant_identifier_names, camel_case_types, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:di4l_pos/common/global_images.dart';
import 'package:di4l_pos/common/storage/app_prefs.dart';
import 'package:di4l_pos/get_it.dart';
import 'package:di4l_pos/screens/order_screen/subscreen/allOrderTab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:di4l_pos/common/global_colors.dart';
import 'package:di4l_pos/common/global_styles.dart';
import 'package:di4l_pos/screens/order_screen/cubit/order_cubit.dart';
import 'package:di4l_pos/screens/order_screen/widgets/custom_bottom_sheet.dart';
import 'package:di4l_pos/screens/order_screen/widgets/custom_tabbar.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  static MultiBlocProvider providers() {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SalesOrderCubit>(
          create: (BuildContext context) => SalesOrderCubit(),
        ),
      ],
      child: const OrderScreen(),
    );
  }

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // late TabController _tabController;
  TextEditingController textController = TextEditingController();
  ScrollController? ctr = ScrollController();
  final _appPrefs = getIt<AppPref>();
  var user;

  List<String> listItem = [
    'Tải báo cáo',
    'In hóa đơn',
    'Shopee',
    'Sổ bán hàng',
  ];

  @override
  void initState() {
    // WidgetsBinding.instance.endOfFrame.then((value) async {
    //   context.read<SalesOrderCubit>().getSell();
    //   user = await _appPrefs.getUser();
    // });
    super.initState();
  }

  DateTime? dateFillter;
  ValueNotifier<List<DateTime?>> datenotic = ValueNotifier([]);
  SingingCharacter typeSingingCharacter = SingingCharacter.tat_ca;
  DateTime? dateBegin = DateTime.now();
  DateTime? dateEnd = DateTime.now();
  void _dateTimeCaculator(SingingCharacter? valueDate) {
    switch (valueDate) {
      case SingingCharacter.hom_nay:
        dateBegin = DateTime(
          DateTime.now().year,
          DateTime.now().month,
          DateTime.now().day,
          0,
        );
        dateEnd = DateTime.now();

        break;
      case SingingCharacter.tuan_nay:
        dateBegin = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day - DateTime.now().weekday + 1);
        break;
      case SingingCharacter.thang_nay:
        dateBegin = DateTime(DateTime.now().year, DateTime.now().month, 1);
        break;
      case SingingCharacter.tuan_truoc:
        dateBegin = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day - DateTime.now().weekday - 7);
        dateEnd = DateTime(DateTime.now().year, DateTime.now().month,
            DateTime.now().day - DateTime.now().weekday + 1);
        break;
      case SingingCharacter.thang_truoc:
        dateBegin = DateTime(DateTime.now().year, DateTime.now().month - 1, 1);
        dateEnd = DateTime(DateTime.now().year, DateTime.now().month - 1,
            DateTime(DateTime.now().year, DateTime.now().month, 0).day);
        break;
      default:
        {
          dateBegin = null;
        }
    }
  }

  @override
  Widget build(BuildContext context) {
    //datenotic.value = dateFillter;
    final Size size = MediaQuery.of(context).size;
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.black, size: 23),
            elevation: 0.5,
            backgroundColor: Colors.white,
            automaticallyImplyLeading: true,
            title: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                'orders'.tr,
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
                  width: 325,
                  boxShadow: false,
                  textController: textController,
                  onSuffixTap: () {
                    setState(() {
                      textController.clear();
                    });
                  },
                  // ignore: avoid_types_as_parameter_names
                  onSubmitted: (String) {
                    textController = textController;
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10),
                      ),
                    ),
                    builder: (_) {
                      return SingleChildScrollView(
                        child: CustomBottomSheet(
                          size: size,
                          value: typeSingingCharacter,
                        ),
                      );
                    },
                  ).then((value) {
                    _dateTimeCaculator(value);
                    context.read<SalesOrderCubit>().fillterDateTime(
                          dateBegin: dateBegin,
                          dateEnd: dateEnd,
                        );

                    typeSingingCharacter = value;
                  });
                },
                child: SvgPicture.asset(
                  GlobalImages.filterIcon,
                  height: 25,
                  width: 25,
                  color: GlobalColors.primaryWebColor,
                ),
              ),
              //const SizedBox(width: 10),
              // PopupMenuButton(
              //   itemBuilder: (BuildContext context) => [
              //     PopupMenuItem(
              //       child: CustomPopupItem(
              //         iconSvg: GlobalImages.downloadIcon,
              //         title: 'download_report'.tr,
              //       ),
              //     ),
              //     PopupMenuItem(
              //       child: CustomPopupItem(
              //         iconSvg: GlobalImages.printIcon,
              //         title: 'Print_invoice'.tr,
              //       ),
              //     ),
              //     const PopupMenuItem(
              //       child: CustomPopupItem(
              //         iconSvg: GlobalImages.shopeeIcon,
              //         title: 'Shopee',
              //       ),
              //     ),
              //     PopupMenuItem(
              //       child: CustomPopupItem(
              //         iconSvg: GlobalImages.bookIcon,
              //         title: 'notes'.tr,
              //       ),
              //     ),
              //   ],
              //   offset: const Offset(0, 50),
              //   child: SvgPicture.asset(
              //     GlobalImages.ellipsisIcon,
              //     height: 25,
              //     width: 25,
              //     color: GlobalColors.primaryWebColor,
              //   ),
              // ),
              const SizedBox(width: 20),
            ],
            bottom: TabBar(
              physics: const ClampingScrollPhysics(),
              // controller: _tabController,
              indicatorColor: GlobalColors.kGreenTextColor,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.grey.shade700,
              labelColor: GlobalColors.kGreenTextColor,
              isScrollable: true,
              labelPadding: const EdgeInsets.all(0),
              tabs: <Widget>[
                CustomTabBar(title: 'all'.tr),
                // CustomTabBar(title: 'Đợi xử lý'.tr),
                // CustomTabBar(title: 'Processing'.tr),
                // CustomTabBar(title: 'Delivered'.tr),
                CustomTabBar(title: 'return_orders'.tr),
                //CustomTabBar(title: 'cancel_orders'.tr),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              allOrderTab.providers(
                textController,
                false,
                datenotic,
              ),
              allOrderTab.providers(
                textController,
                true,
                datenotic,
              ),
            ],
          ),
          // floatingActionButton: ClipRRect(
          //   borderRadius: BorderRadius.circular(25),
          //   child: InkWell(
          //     onTap: () => navigator?.pushNamed(
          //       RouteGenerator.selectPorductForOrder,
          //     ),
          //     child: Container(
          //       height: 50,
          //       width: 200,
          //       alignment: Alignment.center,
          //       color: GlobalColors.appBar1,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.center,
          //         children: [
          //           const Icon(
          //             FontAwesomeIcons.plus,
          //             color: Colors.white,
          //             size: 17,
          //           ),
          //           const SizedBox(width: 8),
          //           Text(
          //             'create_order'.tr,
          //             style: GlobalStyles.normalStyle.copyWith(
          //               fontWeight: FontWeight.w500,
          //               fontSize: 18,
          //               color: Colors.white,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // )
        ));
  }
}

class CustomPopupItem extends StatelessWidget {
  final String title;
  final String iconSvg;
  const CustomPopupItem({
    Key? key,
    required this.title,
    required this.iconSvg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          iconSvg,
          height: 25,
          width: 25,
        ),
        const SizedBox(width: 5),
        Text(
          title,
        ),
      ],
    );
  }
}
