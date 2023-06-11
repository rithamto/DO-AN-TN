import 'package:di4l_pos/screens/main_screen/cubit/main_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainTableScreen extends StatefulWidget {
  /// MARK: - Initials;
  static BlocProvider<MainCubit> provider() {
    return BlocProvider(
      create: (context) => MainCubit(),
      child: const MainTableScreen(),
    );
  }

  const MainTableScreen({Key? key}) : super(key: key);

  @override
  State<MainTableScreen> createState() => _MainDesktopScreenState();
}

class _MainDesktopScreenState extends State<MainTableScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
