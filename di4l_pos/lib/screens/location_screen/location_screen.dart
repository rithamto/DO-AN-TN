import 'package:cached_network_image/cached_network_image.dart';
import 'package:di4l_pos/models/shopinfo/response/ShopSettingRp.dart';
import 'package:flutter/material.dart';
import 'package:di4l_pos/common/global_colors.dart';
import 'package:di4l_pos/common/global_styles.dart';
import 'package:di4l_pos/screens/business_screen/cubit/business_cubit.dart';
import 'package:di4l_pos/screens/business_screen/widget/custom_ListTitle.dart';
import 'package:di4l_pos/screens/main_screen/mobile/widgets/my_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:toggle_switch/toggle_switch.dart';
import '../../widgets/error_image_widget.dart';
import '../business_screen/widget/CustomDropMenu.dart';
import '../business_screen/widget/card_list_business_custom_widget.dart';

class LocationSettingScreen extends StatefulWidget {
  static BlocProvider<BusinessCubit> provider() {
    return BlocProvider(
      create: (context) => BusinessCubit(),
      child: const LocationSettingScreen(),
    );
  }

  const LocationSettingScreen({Key? key}) : super(key: key);

  @override
  State<LocationSettingScreen> createState() => _LocationSettingScreenState();
}

class _LocationSettingScreenState extends State<LocationSettingScreen> {
  int _selectedItemIndex = -1;
  bool _isShowBusiness = false;
  bool _isGetBusinesssCalled = false;
  bool isEditing = false;
  String? _selectedItem;
  List<String> _items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: buildBody(),
    );
  }

  SafeArea buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 15),
              decoration: const BoxDecoration(color: GlobalColors.bgButton),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      "location_lst".tr,
                      style: GlobalStyles.titleHeader(context),
                    ),
                  ),
                  BlocBuilder<BusinessCubit, BusinessState>(
                    builder: (context, state) {
                      if (!_isGetBusinesssCalled) {
                        BlocProvider.of<BusinessCubit>(context)
                            .getBusinesss(); // Call the getBusinesss() method
                        _isGetBusinesssCalled =
                            true; // Set the flag to true to indicate that it has been called
                      }
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height: 16),
                            if (state.data != null)
                              SingleChildScrollView(
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  physics:
                                      NeverScrollableScrollPhysics(), // Disable scrolling of the inner ListView
                                  itemCount: state.data!.businesss.length,
                                  itemBuilder: (context, index) {
                                    final business =
                                        state.data!.businesss[index];
                                    int _isActive = 1;

                                    return InfoBusinessWidget(
                                      iconLeading: Icons.store,
                                      title: business.locationId as String,
                                      visible: index == _selectedItemIndex &&
                                          _isShowBusiness,
                                      onTap: () {
                                        setState(() {
                                          if (_selectedItemIndex == index) {
                                            _isShowBusiness =
                                                !_isShowBusiness; // Toggle visibility if the same item is tapped again
                                          } else {
                                            _selectedItemIndex = index;
                                            _isShowBusiness =
                                                true; // Show details for the newly tapped item
                                          }
                                        });
                                      },
                                      widget: Column(
                                        children: [
                                          BlocProvider(
                                            create: (BuildContext context) =>
                                                BusinessCubit(),
                                            child: Builder(builder:
                                                (BuildContext context) {
                                              return StatefulBuilder(
                                                builder: (context, setState) {
                                                  return ToggleSwitch(
                                                    minWidth: 90.0,
                                                    initialLabelIndex:
                                                        business.isActive,
                                                    cornerRadius: 20.0,
                                                    activeFgColor: Colors.white,
                                                    inactiveBgColor:
                                                        Colors.grey,
                                                    inactiveFgColor:
                                                        Colors.white,
                                                    totalSwitches: 2,
                                                    labels: const ['On', 'Off'],
                                                    activeBgColors: const [
                                                      [
                                                        Color.fromRGBO(
                                                            14, 135, 64, 1)
                                                      ],
                                                      [
                                                        Color.fromRGBO(
                                                            255, 0, 0, 1)
                                                      ]
                                                    ],
                                                    onToggle: (index) {
                                                      print(
                                                          'switched to: $index');

                                                      if (business.isActive !=
                                                              index) {
                                                        
                                                        BlocProvider.of<
                                                                    BusinessCubit>(
                                                                context)
                                                            .activeBusiness(
                                                          int.parse(business.id
                                                              .toString()),
                                                        );
                                                      }
                                                      business.isActive = index;
                                                    },
                                                  );
                                                },
                                              );
                                            }),
                                          ),
                                          const SizedBox(height: 5),
                                          Column(
                                            children: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    isEditing = !isEditing;
                                                  });
                                                },
                                                child: Text(isEditing
                                                    ? 'Chế độ xem'
                                                    : 'Chỉnh sửa'),
                                              ),
                                              if (isEditing) ...[
                                                // Giao diện chỉnh sửa thuộc tính
                                                TextField(
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: 'Name',
                                                  ),
                                                  controller:
                                                      TextEditingController(
                                                          text: business.name),
                                                  onChanged: (value) {
                                                    // Update the business name
                                                    business.name = value;
                                                  },
                                                ),
                                                TextField(
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: 'Location ID',
                                                  ),
                                                  controller:
                                                      TextEditingController(
                                                          text: business.id
                                                              .toString()),
                                                  onChanged: (value) {
                                                    // Update the business location ID
                                                    business.id =
                                                        int.parse(value);
                                                  },
                                                ),
                                                TextField(
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: 'Landmark',
                                                  ),
                                                  controller:
                                                      TextEditingController(
                                                          text: business.landmark
                                                              .toString()),
                                                  onChanged: (value) {
                                                    // Update the business location ID
                                                    business.landmark =
                                                        value;
                                                  },
                                                ),
                                                TextField(
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: 'City',
                                                  ),
                                                  controller:
                                                      TextEditingController(
                                                          text: business.city                                                           .toString()),
                                                  onChanged: (value) {
                                                    // Update the business location ID
                                                    business.city =
                                                        value;
                                                  },
                                                ),
                                                TextField(
                                                  decoration:
                                                      const InputDecoration(
                                                    labelText: 'Zipcode',
                                                  ),
                                                  controller:
                                                      TextEditingController(
                                                          text: business.zipCode
                                                              .toString()),
                                                  onChanged: (value) {
                                                    // Update the business location ID
                                                    business.zipCode =
                                                        value;
                                                  },
                                                ),
                                                // Add more text fields or input widgets for other properties
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      isEditing = false;
                                                    });
                                                  },
                                                  child: const Text('Save'),
                                                ),
                                              ] else ...[
                                                ListTile(
                                                  title: const Text("Name"),
                                                  subtitle: Text(
                                                      business.name as String),
                                                  // Display other business properties as needed
                                                ),
                                                ListTile(
                                                  title:
                                                      const Text("Location ID"),
                                                  subtitle: Text(
                                                      business.id.toString()),
                                                  // Display other business properties as needed
                                                ),
                                                ListTile(
                                                  title: const Text("Landmark"),
                                                  subtitle: Text(business
                                                      .landmark as String),
                                                  // Display other business properties as needed
                                                ),
                                                ListTile(
                                                  title: const Text("City"),
                                                  subtitle: Text(
                                                      business.city as String),
                                                  // Display other business properties as needed
                                                ),
                                                ListTile(
                                                  title: const Text("Zip Code"),
                                                  subtitle: Text(business
                                                      .zipCode as String),
                                                  // Display other business properties as needed
                                                ),
                                                ListTile(
                                                  title: const Text("State"),
                                                  subtitle: Text(
                                                      business.state as String),
                                                  // Display other business properties as needed
                                                ),
                                                ListTile(
                                                  title: const Text("Country"),
                                                  subtitle: Text(business
                                                      .country as String),
                                                  // Display other business properties as needed
                                                ),
                                                ListTile(
                                                  title:
                                                      const Text("Price Group"),
                                                  subtitle: Text(business
                                                      .printReceiptOnInvoice
                                                      .toString()),
                                                  // Display other business properties as needed
                                                ),
                                                // Giao diện xem thuộc tính
                                                // Chèn các thành phần xem thuộc tính của bạn ở đây
                                              ],
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  MyAppBar buildAppBar(BuildContext context) {
    return MyAppBar(
      isShowBackButton: true,
      backgroundColor: GlobalColors.bgWebColor,
      title: Text(
        'business_location_prefix'.tr,
        style: GlobalStyles.titleHeader(context).copyWith(
          fontSize: 18,
          color: GlobalColors.primaryWebColor,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
