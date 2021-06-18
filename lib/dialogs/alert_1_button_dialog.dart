import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gym_passion_admin/helpers/colors_gym.dart';
import 'package:gym_passion_admin/helpers/text_styles.dart';
import 'package:gym_passion_admin/navigation/navigation.dart';

class Constants {
  Constants._();
  static const double padding = 20;
}

class Alert1ButtonDialog extends StatelessWidget {
  final String descriptions;
  final Function onTap;

  Alert1ButtonDialog({this.descriptions, @required this.onTap});

  final navigation = Modular.get<Navigation>();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Constants.padding),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Container(
      height: 224.0,
      width: 270.0,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(30.0),
              height: 224.0,
              width: 270.0,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [
                        Color.fromRGBO(0, 159, 0, 1),
                        Color.fromRGBO(1, 156, 124, 1)
                      ]),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(2, 3),
                        blurRadius: 8),
                  ]),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _description(),
                    SizedBox(height: 40),
                    _okButton()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Text _description() {
    return Text(
      descriptions,
      style: StylesGym.whiteMedium14,
      textAlign: TextAlign.center,
    );
  }

  Widget _okButton() {
    return Container(
      width: 200.0,
      height: 40.0,
      child: ElevatedButton(
        child: Center(
          child: Text(
            'Ok',
            textAlign: TextAlign.center,
            style: StylesGym.whiteBold18,
          ),
        ),
        style: ElevatedButton.styleFrom(
          side: BorderSide(width: 2.0, color: ColorsGym.white),
          primary: Colors.transparent,
          elevation: 0,
          shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(5.0),
          ),
        ),
        onPressed: onTap,
      ),
    );
  }
}
