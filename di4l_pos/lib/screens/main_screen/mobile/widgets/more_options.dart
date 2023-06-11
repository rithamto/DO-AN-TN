import 'package:di4l_pos/common/global_styles.dart';
import 'package:di4l_pos/route_generator.dart';
import 'package:di4l_pos/screens/main_screen/cubit/main_cubit.dart';
import 'package:di4l_pos/screens/main_screen/mobile/widgets/item_girb_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class MoreOptionsWidget extends StatefulWidget {
  static BlocProvider<MainCubit> provider() {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: const MoreOptionsWidget(),
    );
  }

  const MoreOptionsWidget({Key? key}) : super(key: key);

  @override
  State<MoreOptionsWidget> createState() => _MoreOptionsWidgetState();
}

class _MoreOptionsWidgetState extends State<MoreOptionsWidget> {
  @override
  void initState() {
    super.initState();
    context.read<MainCubit>().getMenu();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.48,
      width: Get.width,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          SizedBox(
            height: Get.height * 0.07,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () =>
                      navigator!.pushNamed(RouteGenerator.editMoreScreen),
                  child: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'edit'.tr,
                          style:
                              GlobalStyles.titilliumRegular(context).copyWith(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 50),
                  child: Text(
                    'more'.tr,
                    style: GlobalStyles.titilliumRegular(context).copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.close_outlined,
                    size: 25,
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<MainCubit, MainState>(builder: (context, state) {
            return Flexible(
              child: SizedBox(
                height: Get.height * 0.45,
                child: GridView.builder(
                  itemCount: state.data!.menuData?.items.length ?? 0,
                  primary: false,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 15,
                    maxCrossAxisExtent: 110,
                  ),
                  itemBuilder: (context, index) => ItemGridCard(
                    item: state.data!.menuData!.items.elementAt(index),
                  ),
                ),
              ),
            );
          })
        ],
      ),
    );
  }
}
