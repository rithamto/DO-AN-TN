import 'package:di4l_pos/screens/branch_screen/cubit/branch_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BranchDesktopScreen extends StatefulWidget {
  /// MARK: - Initials;
  static BlocProvider<BranchCubit> provider() {
    return BlocProvider(
      create: (context) => BranchCubit(),
      child: const BranchDesktopScreen(),
    );
  }

  const BranchDesktopScreen({Key? key}) : super(key: key);

  @override
  State<BranchDesktopScreen> createState() => _BranchDesktopScreenState();
}

class _BranchDesktopScreenState extends State<BranchDesktopScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
