import 'package:di4l_pos/screens/settings_screen/cubit/settings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsTableScreen extends StatefulWidget {
  /// MARK: - Initials;
  static BlocProvider<SettingsCubit> provider() {
    return BlocProvider(
      create: (context) => SettingsCubit(),
      child: const SettingsTableScreen(),
    );
  }

  const SettingsTableScreen({Key? key}) : super(key: key);

  @override
  State<SettingsTableScreen> createState() => _SettingsDesktopScreenState();
}

class _SettingsDesktopScreenState extends State<SettingsTableScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
