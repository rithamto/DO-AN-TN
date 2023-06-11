import 'package:di4l_pos/screens/login_screen/cubit/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginTableScreen extends StatefulWidget {
  /// MARK: - Initials;
  static BlocProvider<LoginCubit> provider() {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: const LoginTableScreen(),
    );
  }

  const LoginTableScreen({Key? key}) : super(key: key);

  @override
  State<LoginTableScreen> createState() => _LoginTableScreenState();
}

class _LoginTableScreenState extends State<LoginTableScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
