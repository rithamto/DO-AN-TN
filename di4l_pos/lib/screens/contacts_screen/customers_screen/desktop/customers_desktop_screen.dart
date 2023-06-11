// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:di4l_pos/common/global_colors.dart';
import 'package:di4l_pos/common/global_styles.dart';
import 'package:di4l_pos/screens/contacts_screen/customers_screen/cubit/customers_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class CustomersDesktopScreen extends StatefulWidget {
  /// MARK: - Initials;
  static BlocProvider<CustomersCubit> provider() {
    return BlocProvider(
      create: (context) => CustomersCubit(),
      child: const CustomersDesktopScreen(),
    );
  }

  const CustomersDesktopScreen({Key? key}) : super(key: key);

  @override
  State<CustomersDesktopScreen> createState() => _CustomerTableScreenState();
}

class _CustomerTableScreenState extends State<CustomersDesktopScreen>
    with AfterLayoutMixin {
  /// MARK: - Initials;
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {
    context.read<CustomersCubit>().getContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1.0,
            color: GlobalColors.borderWebColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(8.0),
          ),
        ),
        child: Column(
          children: [
            ListTile(
              onTap: null,
              leading: null,
              title: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      "supplier_name".tr.toUpperCase(),
                      style: GlobalStyles.boldStyle.copyWith(fontSize: 17),
                    ),
                  ),
                  Expanded(
                    child: Text(
                      "supplier_phone".tr.toUpperCase(),
                      style: GlobalStyles.boldStyle.copyWith(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: GlobalColors.borderWebColor),
            Expanded(
              child: BlocBuilder<CustomersCubit, CustomersState>(
                builder: (context, state) {
                  // final _customers = state.data?.customers ?? [];
                  return ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        key: Key(index.toString()),
                        onTap: null,
                        leading: null,
                        title: Row(
                          children: <Widget>[
                            const Expanded(child: Text("First Name")),
                            const Expanded(child: Text("Last Name")),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                          height: 1, color: GlobalColors.borderWebColor);
                    },
                    itemCount: 100,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
