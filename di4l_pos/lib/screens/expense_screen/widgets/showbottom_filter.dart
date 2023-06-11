import 'package:di4l_pos/common/dimensions.dart';
import 'package:di4l_pos/common/global_colors.dart';
import 'package:di4l_pos/common/global_images.dart';
import 'package:di4l_pos/widgets/custom_button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Filter extends StatelessWidget {
  const Filter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: 40,
          height: 4,
          decoration: BoxDecoration(
            color: const Color(0xffFEFEFE),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height / 1.85,
          margin: const EdgeInsets.only(top: 10),
          padding: const EdgeInsets.only(bottom: 10),
          decoration: const BoxDecoration(
            color: Color(0xffFEFEFE),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(10.0),
                topLeft: Radius.circular(10.0)),
          ),
          child: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const SizedBox(width: 45),
                        const Text('Bộ lọc',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                        IconButton(
                            onPressed: () => navigator!.pop(context),
                            icon: const Icon(Icons.close))
                      ]),
                  Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  width: 1, color: Color(0xffF2F3F4)))),
                      child: Column(children: [
                        Row(children: const [
                          ButtonFilter(text: 'Hôm nay'),
                          ButtonFilter(text: 'Hôm qua')
                        ]),
                        Row(children: const [
                          ButtonFilter(text: 'Tháng này'),
                          ButtonFilter(text: 'Tháng trước')
                        ]),
                        Row(children: const [
                          ButtonFilter(text: '30 ngày'),
                          ButtonFilter(text: 'Năm nay')
                        ]),
                        Row(children: const [
                          ButtonFilter(text: 'Tất cả'),
                          Expanded(flex: 1, child: SizedBox(width: 50))
                        ]),
                        Container(
                          margin: const EdgeInsets.only(left: 10, top: 20),
                          alignment: Alignment.centerLeft,
                          child: const Text('Hoặc tùy chỉnh thời gian',
                              style: TextStyle(color: Color(0xff4D5863))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            onTap: () {},
                            readOnly: true,
                            decoration: const InputDecoration(
                              icon: Text('Từ'),
                              iconColor: Color(0xff919AA5),
                              prefixStyle: TextStyle(color: Colors.amber),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: Icon(Icons.keyboard_arrow_down,
                                  color: Color(0xff434345)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xffDFDFDF),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xffDFDFDF),
                                ),
                              ),
                            ),
                            style: const TextStyle(
                                fontSize: 14, color: Color(0xff545557)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: TextField(
                            onTap: () {},
                            readOnly: true,
                            decoration: const InputDecoration(
                              icon: Text('Đến'),
                              iconColor: Color(0xff919AA5),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                              suffixIcon: Icon(Icons.keyboard_arrow_down,
                                  color: Color(0xff434345)),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xffDFDFDF),
                                ),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xffDFDFDF),
                                ),
                              ),
                            ),
                            style: const TextStyle(
                                fontSize: 14, color: Color(0xff545557)),
                          ),
                        ),
                      ])),
                  Container(
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: const BoxDecoration(
                        border: Border(
                            top: BorderSide(width: 1, color: Color(0xffE6EAEB)),
                            bottom: BorderSide(
                                width: 1, color: Color(0xffE6EAEB)))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Báo cáo chi tiết',
                          style: TextStyle(color: Color(0xff1F2126)),
                        ),
                        TextButton.icon(
                            onPressed: () {},
                            icon: Image.asset(
                              GlobalImages.download,
                              width: 16,
                            ),
                            label: const Text(
                              'Tải ngay',
                              style: TextStyle(color: Color(0xff3770C8)),
                            ))
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CustomButton(
                        type: ButtonType.BUTTON_TEXT,
                        color: Colors.white,
                        label: "back".tr,
                        style: const TextStyle(
                            color: GlobalColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.FONT_SIZE_LARGE),
                        borderColor: GlobalColors.primaryColor,
                        onPressed: () => navigator!.pop(context),
                      ),
                      CustomButton(
                        type: ButtonType.BUTTON_TEXT,
                        color: GlobalColors.primaryColor,
                        label: "save".tr,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.FONT_SIZE_LARGE),
                        borderColor: GlobalColors.primaryColor,
                        onPressed: () async {},
                      ),
                    ],
                  ),
                ]),
          ),
        )
      ],
    );
  }
}

class ButtonFilter extends StatelessWidget {
  const ButtonFilter({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        margin: const EdgeInsets.fromLTRB(8, 15, 8, 0),
        decoration: BoxDecoration(
          color: const Color(0xffF2F3F5),
          border: Border.all(color: const Color(0xffDEDEE0)),
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed: () {},
          child: Text(
            text,
            style: const TextStyle(color: Color(0xff4D5863)),
          ),
        ),
      ),
    );
  }
}
