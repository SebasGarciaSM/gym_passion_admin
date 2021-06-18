import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_passion_admin/helpers/colors_gym.dart';

class BackArrow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.zero,
      child: ElevatedButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: FaIcon(FontAwesomeIcons.arrowLeft,
            color: ColorsGym.cian, size: 20.0),
        style: ButtonStyle(
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
        ),
      ),
    );
  }
}
