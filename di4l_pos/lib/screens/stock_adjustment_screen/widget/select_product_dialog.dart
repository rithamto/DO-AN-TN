import 'package:di4l_pos/common/dimensions.dart';
import 'package:di4l_pos/common/global_colors.dart';
import 'package:di4l_pos/common/global_styles.dart';
import 'package:di4l_pos/enums/select_model_ad_stock_adjustment.dart';
import 'package:di4l_pos/enums/status_type.dart';
import 'package:di4l_pos/screens/products_screen/cubit/products_cubit.dart';
import 'package:di4l_pos/widgets/custom_button/custom_button.dart';
import 'package:di4l_pos/widgets/data/app_loading_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

// ignore: prefer_generic_function_type_aliases
typedef void CategoryCallback(item);

// ignore: must_be_immutable
class SelectProductDialogWidget extends StatefulWidget {
  SelectProductDialogWidget({
    // required this.categories,
    this.item,
    required this.ontap,
    Key? key,
    required this.isShowbutton,
    required this.selectModeAddStockAdjustment,
  }) : super(key: key);
  // ignore: prefer_typing_uninitialized_variables
  var item;
  final CategoryCallback ontap;
  final bool isShowbutton;
  final SelectModeAddStockAdjustment selectModeAddStockAdjustment;
  @override
  State<SelectProductDialogWidget> createState() =>
      _SelectProductDialogWidget();
}

class _SelectProductDialogWidget extends State<SelectProductDialogWidget> {
  @override
  void initState() {
    super.initState();
    switch (widget.selectModeAddStockAdjustment) {
      case SelectModeAddStockAdjustment.product:
        {
          context.read<ProductsCubit>().getProducts();
          break;
        }
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return _product();
  }

  Widget _product() {
    var item = widget.item;
    return Container(
      height: Get.height * 0.95,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(
            width: Get.width,
            height: Get.height * 0.07,
            child: Stack(
              children: [
                SizedBox(
                  width: Get.width,
                  child: Center(
                    child: Text(
                      'products'.tr,
                      style: GlobalStyles.titilliumRegular(context).copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: Get.width,
                  child: IconButton(
                    alignment: Alignment.centerRight,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close_outlined,
                      size: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: Dimensions.PADDING_SIZE_DEFAULT,
          ),
          Flexible(
            child: SizedBox(
              height: Get.height * 0.75,
              child: BlocBuilder<ProductsCubit, ProductsState>(
                  builder: (context, state) {
                if (state.data!.status == StatusType.loading) {
                  return const AppLoadingWidget(
                      widget: null, text: 'Loading...');
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.data!.products.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(
                            bottom: Dimensions.PADDING_SIZE_SMALL),
                        child: Container(
                          decoration: BoxDecoration(
                            color: state.data!.productSelected ==
                                    state.data!.products.elementAt(index)
                                ? Colors.grey[300]
                                : Colors.transparent,
                            border: Border.all(
                              width: 1,
                              color: Colors.grey,
                            ),
                            borderRadius: const BorderRadius.all(
                                Radius.circular(
                                    5.0) //                 <--- border radius here
                                ),
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  item == state.data!.products[index]
                                      ? context
                                          .read<ProductsCubit>()
                                          .productSelected(null)
                                      : context
                                          .read<ProductsCubit>()
                                          .productSelected(
                                              state.data!.products[index]);
                                  item = state.data!.products[index];
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                width: 1,
                                                color: Colors.grey,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(
                                                      5.0) //                 <--- border radius here
                                                  ),
                                            ),
                                            width: Get.width * 0.13,
                                            height: Get.width * 0.13,
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  Dimensions.MARGIN_SIZE_SMALL),
                                              child: SizedBox(
                                                width: Get.width * 0.07,
                                                child: Image.asset(
                                                  "assets/images/food.jpg",
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.data!.products
                                                  .elementAt(index)
                                                  .name
                                                  .toString(),
                                            ),
                                            SizedBox(
                                              height: Dimensions
                                                  .PADDING_SIZE_EXTRA_SMALL,
                                            ),
                                            Text(
                                              state.data!.products
                                                  .elementAt(index)
                                                  .alertQuantity
                                                  .toString(),
                                              style:
                                                  GlobalStyles.titilliumRegular(
                                                      context),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                   
                                  ],
                                ),
                              ),
                              
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),
          ),
          widget.isShowbutton
              ? Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * 0.1,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        type: ButtonType.BUTTON_TEXT,
                        color: Colors.white,
                        label: "back".tr,
                        style: TextStyle(
                            color: GlobalColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.FONT_SIZE_LARGE),
                        borderColor: GlobalColors.primaryColor,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                      ),
                      CustomButton(
                        type: ButtonType.BUTTON_TEXT,
                        color: GlobalColors.primaryColor,
                        label: "save".tr,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: Dimensions.FONT_SIZE_LARGE),
                        borderColor: GlobalColors.primaryColor,
                        onPressed: () {
                          widget.ontap(item);
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
