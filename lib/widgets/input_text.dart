import 'package:flutter/material.dart';
import 'package:gym_passion_admin/helpers/colors_gym.dart';
import 'package:gym_passion_admin/helpers/text_styles.dart';

class InputText extends StatelessWidget {
  final TextInputType type;
  final String hint;

  InputText({@required this.hint, @required this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: TextField(
        keyboardType: type,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
          hintText: hint,
          hintStyle: StylesGym.darkGrayMedium14,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsGym.cian)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsGym.cian),
          ),
        ),
      ),
    );
  }
}
