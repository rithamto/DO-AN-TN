import 'package:flutter/material.dart';
import 'table_data_revenue_expense.dart';

class RevenueExpenseDetail extends StatelessWidget {
  const RevenueExpenseDetail({
    Key? key,
    required this.title,
    required this.amount_money,
    required this.classify,
    required this.funds,
  }) : super(key: key);
  final String title, amount_money, classify, funds;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10.0, bottom: 5.0),
      height: MediaQuery.of(context).size.height / 2.5,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0), topLeft: Radius.circular(10.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width / 2.7,
              ),
              Expanded(
                child: Text('Chi tiết $title'),
              ),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  icon: const Icon(Icons.clear))
            ],
          ),
          Container(
            margin: const EdgeInsets.only(left: 10.0, right: 10.0),
            padding: const EdgeInsets.only(bottom: 10.0),
            decoration: const BoxDecoration(
                border:
                    Border(bottom: BorderSide(width: 1, color: Colors.grey))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Wrap(
                  spacing: 8.0, // gap between adjacent chips
                  runSpacing: 4.0, // gap between lines
                  children: <Widget>[
                    Icon(
                      Icons.payment_outlined,
                      color: title == 'khoản chi'
                          ? Color(0xffEF4444)
                          : Color(0xff30AF49),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hôm qua',
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text('13:08 - 06/03/2023')
                        ]),
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text(
                    amount_money,
                    style: title == 'khoản chi' ? chi : thu,
                  ),
                  Container(
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.all(3.0),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(209, 166, 200, 164),
                          borderRadius: BorderRadius.circular(7.0)),
                      child: Text(
                        title == 'khoản chi' ? 'Đã trả' : 'Đã nhận',
                        style: thu,
                      ))
                ]),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Phân loại',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  Text(classify),
                  funds != ''
                      ? Text(
                          'Nguồn tiền',
                          style: TextStyle(fontSize: 13, color: Colors.grey),
                        )
                      : Text(''),
                  Text(funds),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration:
                BoxDecoration(border: Border.all(width: 1, color: Colors.grey)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                    width: MediaQuery.of(context).size.width / 2.25,
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton.icon(
                        style: TextButton.styleFrom(primary: Colors.grey),
                        onPressed: () {},
                        icon: const Icon(Icons.delete_outline),
                        label: const Text('Xóa'))),
                Container(
                    width: MediaQuery.of(context).size.width / 2.25,
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 1,
                            color: const Color.fromARGB(255, 26, 87, 28)),
                        borderRadius: BorderRadius.circular(10)),
                    child: TextButton.icon(
                        style: TextButton.styleFrom(
                            primary: const Color.fromARGB(255, 26, 87, 28)),
                        onPressed: () {},
                        icon: const Icon(
                            Icons.drive_file_rename_outline_outlined),
                        label: const Text('Chỉnh sửa'))),
              ],
            ),
          )
        ],
      ),
    );
  }
}
