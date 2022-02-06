import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tdd_boilerplate/core/event/event.dart';
import 'package:flutter_tdd_boilerplate/features/setting/presentation/bloc/setting_bloc.dart';
import 'package:flutter_tdd_boilerplate/features/setting/presentation/screen/setting_screen.dart';

class RootController extends StatefulWidget {
  const RootController({Key? key}) : super(key: key);

  @override
  _RootControllerState createState() => _RootControllerState();
}

class _RootControllerState extends State<RootController> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SettingScreen();
  }
}
