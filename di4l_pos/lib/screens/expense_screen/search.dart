import 'package:flutter/material.dart';
import 'package:di4l_pos/common/global_images.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);
  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext buildContext) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xffFEFEFE),
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
              size: 16,
            )),
        title: Transform(
          transform: Matrix4.translationValues(-20.0, 0.0, 0.0),
          child: SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width,
              child: TextField(
                controller: controller,
                cursorColor: const Color.fromARGB(255, 6, 154, 77),
                decoration: InputDecoration(
                    filled: true,
                    fillColor: const Color(0xffF5F6FA),
                    contentPadding: const EdgeInsets.only(left: 15, top: 15),
                    enabledBorder: const OutlineInputBorder(
                      borderSide:
                          BorderSide(width: 1, color: Color(0xffECECEC)),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(
                          width: 1, color: Color.fromARGB(255, 3, 162, 85)),
                    ),
                    hintText: 'Tìm tên danh mục, ghi chú, giá tiền',
                    hintStyle: const TextStyle(color: Color(0xff898A8F)),
                    suffixIcon: controller.text.isNotEmpty
                        ? TextButton(
                            onPressed: () {
                              controller.clear();
                              setState(() {
                                controller.text.isNotEmpty;
                              });
                            },
                            child: const Image(
                              image: AssetImage(GlobalImages.remove),
                            ),
                          )
                        : null),
              )),
        ),
        centerTitle: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 1, color: Color(0xffE1E2E4)),
          ),
        ),
      ),
      backgroundColor: const Color(0xffF2F3F5),
    );
  }
}
