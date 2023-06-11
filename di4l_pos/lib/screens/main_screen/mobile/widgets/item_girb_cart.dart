import 'package:di4l_pos/common/dimensions.dart';
import 'package:di4l_pos/common/global_styles.dart';
import 'package:di4l_pos/models/home/item_main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ItemGridCard extends StatelessWidget {
  /// MARK: - Initials;
  final Item? item;
  // final Function(HomeMenu?)? onPressed;

  const ItemGridCard({
    Key? key,
    this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => navigator!.pushNamed(item!.route!),
      child: SizedBox(
        height: 100,
        width: 100,
        child: Column(
          children: [
            SvgPicture.asset(
              item?.iconlink ?? '',
              width: 45,
              height: 45,
            ),
            Padding(
              padding:
                  const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
              child: Text(
                (item?.title ?? '').tr,
                style: GlobalStyles.robotoRegular(context),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
