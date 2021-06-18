import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:gym_passion_admin/helpers/colors_gym.dart';

class SwitchFlutter extends StatefulWidget {
  @override
  _SwitchFlutterState createState() => _SwitchFlutterState();
}

class _SwitchFlutterState extends State<SwitchFlutter> {
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return FlutterSwitch(
        activeColor: ColorsGym.green,
        inactiveColor: Colors.transparent,
        toggleColor: Colors.white,
        switchBorder: Border.all(color: ColorsGym.green, width: 3.0),
        toggleBorder: Border.all(
          color: ColorsGym.green,
          width: 3.0,
        ),
        width: 40.0,
        height: 25.0,
        toggleSize: 19.0,
        value: status,
        borderRadius: 50.0,
        padding: 0,
        onToggle: (val) {
          setState(() {
            status = val;
          });
        });
  }
}
