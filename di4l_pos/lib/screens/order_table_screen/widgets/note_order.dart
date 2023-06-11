import 'package:di4l_pos/common/dimensions.dart';
import 'package:di4l_pos/common/global_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NoteOrder extends StatelessWidget {
  const NoteOrder({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text.rich(
            TextSpan(
              children: text != null
                  ? [
                      TextSpan(
                        text: 'note_order'.tr,
                        style: GlobalStyles.robotoBold(context).copyWith(
                          fontSize: Dimensions.FONT_SIZE_LARGE,
                          color: Theme.of(context).textTheme.bodyLarge!.color,
                        ),
                      ),
                      TextSpan(
                        text: ': ${text}',
                        style: GlobalStyles.robotoRegular(context).copyWith(
                            fontSize: Dimensions.FONT_SIZE_LARGE,
                            color: Theme.of(context).textTheme.bodyLarge!.color,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ]
                  : [],
            ),
            textAlign: TextAlign.start,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
