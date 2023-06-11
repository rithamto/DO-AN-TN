import 'package:di4l_pos/common/dimensions.dart';
import 'package:di4l_pos/common/global_images.dart';
import 'package:di4l_pos/common/global_styles.dart';
import 'package:di4l_pos/route_generator.dart';
import 'package:di4l_pos/screens/table_order_screen/widgets/custom_button_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class OrderFoodSuccessScreen extends StatefulWidget {
  const OrderFoodSuccessScreen({Key? key}) : super(key: key);

  @override
  State<OrderFoodSuccessScreen> createState() => _OrderFoodSuccessScreenState();
}

class _OrderFoodSuccessScreenState extends State<OrderFoodSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('table_order'.tr),
          titleTextStyle: GlobalStyles.robotoBold(context).copyWith(
            fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE,
            color: Colors.black,
          ),
          toolbarHeight: 55,
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 10,
          shadowColor: Colors.white54,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'your_order_has_been_received'.tr,
              style: GlobalStyles.robotoRegular(context)
                  .copyWith(fontSize: Dimensions.FONT_SIZE_EXTRA_LARGE),
            ),
            const SizedBox(
              height: 70,
            ),
            Lottie.asset(
              GlobalImages.orderSuccessTableOrder,
              width: 150,
              fit: BoxFit.fitWidth,
            ),
            const SizedBox(
              height: 70,
            ),
            CustomButton2(
              height: 50,
              width: 300,
              transparent: true,
              buttonText: 'back_to_home'.tr,
              onPressed: () {
                navigator!
                    .pushReplacementNamed(RouteGenerator.tableOrderScreen);
              },
            ),
            const SizedBox(
              height: Dimensions.PADDING_SIZE_DEFAULT,
            ),
            CustomButton2(
              width: 300,
              height: 50,
              buttonText: 'order_details'.tr,
              onPressed: () {
                navigator!.pushNamed(RouteGenerator.newOrderDetail);
              },
            ),
            SizedBox(
              height: MediaQuery.of(context).viewPadding.top,
            ),
          ],
        ),
      ),
    );
  }
}
