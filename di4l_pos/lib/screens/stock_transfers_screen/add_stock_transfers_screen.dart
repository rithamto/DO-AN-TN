import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:di4l_pos/common/global_colors.dart';
import 'package:di4l_pos/common/global_styles.dart';
// import 'package:di4l_pos/screens/stock_adjustment_screen/widget/add_stock_adjustment_product.dart';
import 'package:di4l_pos/screens/stock_transfers_screen/cubit/stock_transfers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddStockTransfersScreen extends StatefulWidget {
  const AddStockTransfersScreen({Key? key}) : super(key: key);
  static BlocProvider<StockTransfersCubit> provider() {
    return BlocProvider(
      create: (context) => StockTransfersCubit(),
      child: const AddStockTransfersScreen(),
    );
  }

  @override
  _AddStockTransfersScreenState createState() =>
      _AddStockTransfersScreenState();
}

class _AddStockTransfersScreenState extends State<AddStockTransfersScreen>
    with AfterLayoutMixin<AddStockTransfersScreen> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey();

  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    throw UnimplementedError();
  }

  TextEditingController textController = TextEditingController();
  TextEditingController _dateController = TextEditingController();
  String _selectedValue1 = 'please_select'.tr;
  String _selectedValue2 = 'please_select'.tr;
  @override
  Widget build(BuildContext context) {
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101),
      );
      if (picked != null) {
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (pickedTime != null) {
          setState(() {
            final DateTime combinedDate = DateTime(
              picked.year,
              picked.month,
              picked.day,
              pickedTime.hour,
              pickedTime.minute,
            );
            final DateFormat formatter = DateFormat('dd/MM/yyyy hh:mm a');
            final String formattedDate = formatter.format(combinedDate);
            _dateController.text = formattedDate;
          });
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black, size: 23),
        elevation: 0.5,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        title: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: Text(
            'add_stock_transfers'.tr,
            style: GlobalStyles.normalStyle.copyWith(
              color: GlobalColors.primaryWebColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
      backgroundColor: GlobalColors.kDarkWhite,
      body: SingleChildScrollView(
          child: Container(
        color: GlobalColors.whiteColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 15,
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'business_location'.tr,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '(from)'.tr,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                          fontSize: 16,
                          color: GlobalColors.errorColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownButton<String>(
                    value: _selectedValue1,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedValue1 = newValue!;
                      });
                    },
                    items: <String>[
                      'please_select'.tr,
                      'RESTAURANT (BL0001)',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value.toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: GlobalColors.primaryColor),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'business_location'.tr,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '(to)'.tr,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                          fontSize: 16,
                          color: GlobalColors.errorColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  DropdownButton<String>(
                    value: _selectedValue1,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedValue1 = newValue!;
                      });
                    },
                    items: <String>[
                      'please_select'.tr,
                      'RESTAURANT (BL0001)',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value.toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: GlobalColors.primaryColor),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, right: 18),
              child: Row(
                children: [
                  Row(
                    children: [
                      Text(
                        'adjustment_type'.tr,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '*',
                        style: TextStyle(
                          fontSize: 16,
                          color: GlobalColors.errorColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Icon(
                    Icons.info,
                    color: GlobalColors.appBar4,
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  DropdownButton<String>(
                    value: _selectedValue2,
                    onChanged: (newValue) {
                      setState(() {
                        _selectedValue2 = newValue!;
                      });
                    },
                    items: <String>[
                      'please_select'.tr,
                      'Normal',
                      'Abnormal',
                    ].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value.toString(),
                          style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: GlobalColors.primaryColor),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, top: 10),
              child: Text(
                'date'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, top: 8, bottom: 8, right: 18),
              child: TextField(
                controller: _dateController,
                onTap: () => _selectDate(context),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: GlobalColors.kDarkWhite,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(Icons.date_range),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, top: 10),
              child: Text(
                'reference_no'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, bottom: 8, right: 18),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'reference_no'.tr,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 10.0,
                  ),
                  filled: true,
                  fillColor: GlobalColors.whiteColor,
                ),
                style: TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: 18,
                right: 10,
                top: 10,
              ),
              child: Row(
                children: [
                  Text(
                    'total_amount_recovered'.tr,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.info,
                    color: GlobalColors.appBar4,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, bottom: 8, right: 18),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'total_amount_recovered'.tr,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 10.0,
                  ),
                  filled: true,
                  fillColor: GlobalColors.whiteColor,
                ),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.only(left: 18),
              child: Text(
                'reason'.tr,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18, bottom: 8, right: 18),
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'reason'.tr,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 10.0,
                  ),
                  filled: true,
                  fillColor: GlobalColors.whiteColor,
                ),
                style: const TextStyle(
                  fontSize: 16.0,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.all(18),
                    child: Text(
                      'total_amount'.tr,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            GlobalColors.primaryColor,
                          ),
                        ),
                        child: Text(
                          'save'.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
