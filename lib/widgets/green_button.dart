import 'package:flutter/material.dart';
import 'package:gym_passion_admin/helpers/colors_gym.dart';
import 'package:gym_passion_admin/helpers/text_styles.dart';

class GreenButton extends StatelessWidget {
  final String title;
  final Function onTap;

  GreenButton({@required this.title, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 40.0,
      child: ElevatedButton(
          child: Center(
            child: Text(
              '$title',
              textAlign: TextAlign.center,
              style: StylesGym.whiteBold18,
            ),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.zero,
            primary: ColorsGym.green,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
          ),
          onPressed: onTap),
    );
  }
}
