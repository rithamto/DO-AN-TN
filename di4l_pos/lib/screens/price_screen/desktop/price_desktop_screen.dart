import 'package:di4l_pos/screens/price_screen/cubit/price_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceDesktopScreen extends StatefulWidget {
  /// MARK: - Initials;
  static BlocProvider<PriceCubit> provider() {
    return BlocProvider(
      create: (context) => PriceCubit(),
      child: PriceDesktopScreen(),
    );
  }

  const PriceDesktopScreen({Key? key}) : super(key: key);

  @override
  State<PriceDesktopScreen> createState() => _PriceDesktopScreenState();
}

class _PriceDesktopScreenState extends State<PriceDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
