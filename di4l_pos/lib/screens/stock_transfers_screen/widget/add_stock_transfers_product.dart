import 'package:di4l_pos/common/global_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddStockTransfersProduct extends StatelessWidget {
  const AddStockTransfersProduct({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int numberPaymentInfoRows = 1;
    List<DataRow> paymentInfoRows = List<DataRow>.generate(
      numberPaymentInfoRows,
      (index) => DataRow(
        cells: [
          DataCell(
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'products'.tr,
                      style: TextStyle(
                        fontSize: 16,
                        color: GlobalColors.kGreyTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('null'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'quantity'.tr,
                      style: TextStyle(
                        fontSize: 16,
                        color: GlobalColors.kGreyTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('null'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'unit_price'.tr,
                      style: TextStyle(
                        fontSize: 16,
                        color: GlobalColors.kGreyTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('null'),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      'total_amount'.tr,
                      style: TextStyle(
                        fontSize: 16,
                        color: GlobalColors.kGreyTextColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text('null'),
                  ],
                ),
              ],
            ),
          ),
          DataCell(
            Icon(
              Icons.delete,
              color: GlobalColors.appBar4,
            ),
          ),
        ],
      ),
    );

    return Padding(
      padding: EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Scrollbar(
          thumbVisibility: true,
          child: DataTable(
            headingRowColor: MaterialStateColor.resolveWith(
                (states) => GlobalColors.whiteColor),
            dataRowColor: MaterialStateColor.resolveWith(
                (states) => GlobalColors.whiteColor),
            columnSpacing: 150,
            dataRowHeight: 80,
            headingRowHeight: 40,
            columns: [
              DataColumn(
                label: Text(
                  'products'.tr,
                  style: TextStyle(
                    color: GlobalColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  '',
                  style: TextStyle(
                    color: GlobalColors.blackColor,
                  ),
                ),
              ),
            ],
            rows: paymentInfoRows,
          ),
        ),
      ),
    );
  }
}
