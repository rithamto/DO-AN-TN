import 'dart:async';

import 'package:after_layout/after_layout.dart';
import 'package:di4l_pos/screens/products_screen/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsDesktopScreen extends StatefulWidget {
  /// MARK: - Initials;
  static BlocProvider<ProductsCubit> provider() {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: ProductsDesktopScreen(),
    );
  }

  const ProductsDesktopScreen({Key? key}) : super(key: key);

  @override
  State<ProductsDesktopScreen> createState() => _ProductsDesktopScreenState();
}

class _ProductsDesktopScreenState extends State<ProductsDesktopScreen>
    with AfterLayoutMixin {
  /// MARK: - Initials;
  @override
  FutureOr<void> afterFirstLayout(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Text('Products'),
      ),
    );
  }
}
