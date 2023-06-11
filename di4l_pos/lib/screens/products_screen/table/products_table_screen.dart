import 'package:di4l_pos/screens/products_screen/cubit/products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsTableScreen extends StatefulWidget {
  /// MARK: - Initials;
  static BlocProvider<ProductsCubit> provider() {
    return BlocProvider(
      create: (context) => ProductsCubit(),
      child: ProductsTableScreen(),
    );
  }

  const ProductsTableScreen({Key? key}) : super(key: key);

  @override
  State<ProductsTableScreen> createState() => _ProductsTableScreenState();
}

class _ProductsTableScreenState extends State<ProductsTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
