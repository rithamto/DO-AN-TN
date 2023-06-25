import 'package:di4l_pos/common/dimensions.dart';
import 'package:di4l_pos/common/global_configs.dart';
import 'package:di4l_pos/common/global_images.dart';
import 'package:di4l_pos/models/delivery/response/delivery_response.dart';
import 'package:di4l_pos/screens/delivery_screen/cubit/delivery_cubit.dart';
import 'package:di4l_pos/screens/delivery_screen/widgets/footer_delivery_widget.dart';
import 'package:di4l_pos/screens/delivery_screen/widgets/header_delivery_widget.dart';
import 'package:di4l_pos/screens/delivery_screen/widgets/note_delivery_widget.dart';
import 'package:di4l_pos/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class NoteDeliveryScreen extends StatefulWidget {
  final DeliveryPartner? deliveryPartner;
  static BlocProvider<DeliveryCubit> provider(
      {DeliveryPartner? deliveryPartner}) {
    return BlocProvider(
      create: (context) => DeliveryCubit(),
      child: NoteDeliveryScreen(deliveryPartner: deliveryPartner),
    );
  }

  const NoteDeliveryScreen({Key? key, this.deliveryPartner}) : super(key: key);

  @override
  State<NoteDeliveryScreen> createState() => _NoteDeliveryScreenState();
}

class _NoteDeliveryScreenState extends State<NoteDeliveryScreen> {
  var list = [
    "Location 1",
    "Location 2",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderDeliveryWidget(
              deliveryPartner: widget.deliveryPartner,
              logoPartner:
                  GlobalConfigs.kBaseUrl + widget.deliveryPartner!.logo!),
          NoteDeliveryWidget(
            namePartner: widget.deliveryPartner!.fullname!,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomDropDown(
              labelText: "choose_store".tr,
              value: "Location 1",
              items: list,
              onChanged: (dynamic value) {}),
          const Divider(),
          FooterNoteDeliveryWidget(
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
