import 'package:di4l_pos/screens/profile_screen/cubit/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileTableScreen extends StatefulWidget {
  /// MARK: - Initials;
  static BlocProvider<ProfileCubit> provider() {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: ProfileTableScreen(),
    );
  }

  const ProfileTableScreen({Key? key}) : super(key: key);

  @override
  State<ProfileTableScreen> createState() => _ProfileTableScreenState();
}

class _ProfileTableScreenState extends State<ProfileTableScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
