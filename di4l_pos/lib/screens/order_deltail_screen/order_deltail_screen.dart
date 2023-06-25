import 'package:di4l_pos/common/global_colors.dart';
import 'package:di4l_pos/common/global_formatter.dart';
import 'package:di4l_pos/common/global_images.dart';
import 'package:di4l_pos/common/global_styles.dart';
import 'package:di4l_pos/common/ui_helpers.dart';
import 'package:di4l_pos/models/sell/response/sell_response.dart';
import 'package:di4l_pos/screens/main_screen/mobile/widgets/my_appbar.dart';
import 'package:di4l_pos/screens/order_deltail_screen/pdf.dart';
import 'package:di4l_pos/widgets/custom_rich_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class OrderDetailScreen extends StatefulWidget {
  final SellData sellData;
  const OrderDetailScreen({Key? key, required this.sellData}) : super(key: key);

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: GlobalColors.kDarkWhite,
      appBar: MyAppBar(
        title: Text(
          'order_details'.tr,
          style: GlobalStyles.robotoBold(context).copyWith(
            color: GlobalColors.primaryWebColor,
            fontSize: 18,
          ),
        ),
        titleCenter: false,
        backgroundColor: Colors.white,
        actions: [
          InkWell(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {},
                  child: SvgPicture.asset(
                    GlobalImages.editIcon,
                    height: 25,
                    width: 25,
                    color: GlobalColors.primaryWebColor,
                  ),
                ),
                Text(
                  'edit'.tr,
                  style: const TextStyle(color: GlobalColors.primaryWebColor),
                )
              ],
            ),
          ),
          const SizedBox(width: 10),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        WebViewContainer(widget.sellData.invoiceUrl)),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(
                  GlobalImages.printIcon,
                  height: 25,
                  width: 25,
                  color: GlobalColors.primaryWebColor,
                ),
                Text(
                  'Print_invoice'.tr,
                  style: const TextStyle(color: GlobalColors.primaryWebColor),
                )
              ],
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Positioned(
            //   bottom: 0,
            //   child: Container(
            //     padding: const EdgeInsets.all(10),
            //     height: 70,
            //     width: size.width,
            //     color: Colors.white,
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceAround,
            //       children: [
            //         CustomButtonBottom(
            //           title: 'huy'.tr,
            //           titleColor: GlobalColors.kGreyTextColor,
            //         ),
            //         CustomButtonBottom(
            //           title: 'Delivered'.tr,
            //           titleColor: Colors.white,
            //           color: GlobalColors.kGreenTextColor,
            //         )
            //       ],
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                children: [
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  Text(
                                    widget.sellData.invoiceNo ?? '',
                                    style: GlobalStyles.robotoRegular(context)
                                        .copyWith(
                                      color: GlobalColors.primaryWebColor,
                                      fontSize: 20,
                                    ),
                                  ),
                                  // SvgPicture.asset(
                                  //   GlobalImages.copyIcon,
                                  //   height: 20,
                                  //   width: 20,
                                  //   color: GlobalColors.kGreyTextColor,
                                  // ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Container(
                                      padding: const EdgeInsets.all(3),
                                      color: Colors.amber.shade100,
                                      child: Text(
                                        widget.sellData.paymentStatus!.tr,
                                        style:
                                            GlobalStyles.robotoRegular(context)
                                                .copyWith(
                                          fontSize: 14,
                                          color: Colors.deepOrange,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 7),
                        Text(
                          widget.sellData.transactionDate ?? '',
                          style: GlobalStyles.robotoRegular(context).copyWith(
                            color: GlobalColors.kGreyTextColor,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Container(
                          height: 0.5,
                          color: GlobalColors.kBorderColorTextField,
                        ),
                        const SizedBox(height: 7),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              GlobalFormatter.formatNumber(
                                  source: widget.sellData.finalTotal ?? ''),
                              style:
                                  GlobalStyles.robotoRegular(context).copyWith(
                                color: GlobalColors.primaryWebColor,
                                fontSize: 30,
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                await Clipboard.setData(ClipboardData(
                                        text: widget.sellData.invoiceUrl
                                            .toString()))
                                    .then((value) => UIHelpers.showSnackBar(
                                        message: "Đã copy"));
                                // copied successfully
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 30,
                                width: size.width * 0.3,
                                decoration: BoxDecoration(
                                  color: GlobalColors.kGreenTextColor,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.grey),
                                ),
                                child: Text(
                                  'Copy_invoice_URL'.tr,
                                  style: GlobalStyles.normalStyle.copyWith(
                                    fontSize: 14,
                                    color: GlobalColors.bgButton,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          widget.sellData.paymentStatus!.tr,
                          style: GlobalStyles.robotoRegular(context).copyWith(
                            fontSize: 14,
                            color: GlobalColors.errorColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.only(left: 20),
                    color: Colors.white,
                    height: size.height * 0.1,
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              border: Border.all(
                                color: GlobalColors.kBorderColorTextField,
                                width: 0.5,
                              )),
                          child: SvgPicture.asset(
                            GlobalImages.userIcon,
                            color: GlobalColors.kGreenTextColor,
                            height: 23,
                            width: 23,
                          ),
                        ),
                        const SizedBox(width: 7),
                        Text(
                          widget.sellData.contact?.name ?? '',
                          style: GlobalStyles.robotoRegular(context).copyWith(
                            color: GlobalColors.primaryWebColor,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(width: 7),
                        // SvgPicture.asset(
                        //   GlobalImages.copyIcon,
                        //   height: 20,
                        //   width: 20,
                        //   color: GlobalColors.kGreyTextColor,
                        // ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  // Container(
                  //   height: size.height * 0.15,
                  //   color: Colors.white,
                  //   padding: const EdgeInsets.all(12),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     children: [
                  //       Container(
                  //         height: 50,
                  //         width: size.width * 0.2,
                  //         decoration: BoxDecoration(
                  //           borderRadius: BorderRadius.circular(8),
                  //           color: GlobalColors.kDarkWhite,
                  //         ),
                  //         child: SvgPicture.asset(GlobalImages.product),
                  //       ),
                  //       SizedBox(
                  //         width: size.width * 0.5,
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //           children: [
                  //             Text(
                  //               widget.sellData.sellLines!.first.productId
                  //                   .toString(),
                  //               style: GlobalStyles.robotoRegular(context)
                  //                   .copyWith(
                  //                 color: GlobalColors.primaryWebColor,
                  //                 fontSize: 18,
                  //               ),
                  //             ),
                  //             Text(
                  //               GlobalFormatter.formatNumber(
                  //                   source: widget.sellData.finalTotal ?? ''),
                  //               style:
                  //                   GlobalStyles.robotoBold(context).copyWith(
                  //                 color: GlobalColors.primaryWebColor,
                  //                 fontSize: 16,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: size.height * 0.3,
                  //         child: Row(
                  //           children: List.generate(
                  //             widget.sellData.sellLines!.length,
                  //             (index) => Container(
                  //               height: size.height,
                  //               width: size.width * 0.15,
                  //               alignment: Alignment.bottomCenter,
                  //               child: RichText(
                  //                 text: TextSpan(
                  //                   text: 'SL : ',
                  //                   style: GlobalStyles.robotoRegular(context)
                  //                       .copyWith(
                  //                     color: GlobalColors.kGreyTextColor,
                  //                     fontSize: 16,
                  //                   ),
                  //                   children: <TextSpan>[
                  //                     TextSpan(
                  //                       text:
                  //                           '${widget.sellData.sellLines![index].quantity}',
                  //                       style: GlobalStyles.robotoBold(context)
                  //                           .copyWith(
                  //                         color: GlobalColors.primaryWebColor,
                  //                         fontSize: 16,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  const SizedBox(height: 10),
                  Container(
                    height: 500,
                    width: size.width,
                    color: Colors.white,
                    child: Column(
                      children: List.generate(
                        widget.sellData.sellLines!.length,
                        (index) => Container(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              children: [
                                CustomRowText(
                                  title: 'gross_product'.tr,
                                  value: GlobalFormatter.formatNumber(
                                      source:
                                          // '${widget.sellData.finalTotal}'),
                                          '${widget.sellData.sellLines![index].quantity}'),
                                  textColor: GlobalColors.kGreyTextColor,
                                ),
                                CustomRowText(
                                  title: 'promotion'.tr,
                                  value: GlobalFormatter.formatNumber(
                                      source:
                                          '${widget.sellData.sellLines![index].lineDiscountAmount}'),
                                  textColor: GlobalColors.kGreyTextColor,
                                ),
                                CustomRowText(
                                  title: 'shipping_charges'.tr,
                                  value: GlobalFormatter.formatNumber(
                                      source:
                                          '${widget.sellData.shippingCharges}'),
                                  textColor: GlobalColors.kGreyTextColor,
                                ),
                                CustomRowText(
                                  title: 'discount_amount'.tr,
                                  value: GlobalFormatter.formatNumber(
                                      source:
                                          '${widget.sellData.discountAmount}'),
                                  textColor: GlobalColors.kGreyTextColor,
                                ),
                                CustomRowText(
                                  title: 'total_amount'.tr,
                                  value: GlobalFormatter.formatNumber(
                                      source: '${widget.sellData.finalTotal}'),
                                  textColor: GlobalColors.kGreyTextColor,
                                  textColorNumber: GlobalColors.errorColor,
                                ),
                                const SizedBox(height: 10),
                                // Container(
                                //   height: 50,
                                //   width: size.width,
                                //   alignment: Alignment.center,
                                //   decoration: BoxDecoration(
                                //     border: Border.all(
                                //       color: GlobalColors.appBar2,
                                //     ),
                                //     borderRadius: BorderRadius.circular(5),
                                //   ),
                                //   child: Row(
                                //     mainAxisAlignment: MainAxisAlignment.center,
                                //     children: [
                                //       SvgPicture.asset(
                                //         'assets/svg/payIcon.svg',
                                //         color: GlobalColors.appBar2,
                                //         height: 25,
                                //         width: 25,
                                //       ),
                                //       const SizedBox(width: 5),
                                //       Text(
                                //         'prepayment'.tr,
                                //         style:
                                //             GlobalStyles.robotoRegular(context)
                                //                 .copyWith(
                                //           color: GlobalColors.appBar2,
                                //           fontSize: 17,
                                //           fontWeight: FontWeight.w400,
                                //         ),
                                //       ),
                                //     ],
                                //   ),
                                // )
                              ],
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
