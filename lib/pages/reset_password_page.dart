import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gym_passion_admin/dialogs/alert_1_button_dialog.dart';
import 'package:gym_passion_admin/helpers/colors_gym.dart';
import 'package:gym_passion_admin/helpers/text_styles.dart';
import 'package:gym_passion_admin/navigation/navigation.dart';
import 'package:gym_passion_admin/widgets/back_arrow.dart';
import 'package:gym_passion_admin/widgets/green_button.dart';

class CoachResetPasswordPage extends StatelessWidget {
  final navigation = Modular.get<Navigation>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsGym.darkgray,
      body: SafeArea(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            padding: EdgeInsets.all(10.0),
            child: Expanded(
              child: Container(
                //height: MediaQuery.of(context).size.height,
                // width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: ColorsGym.white.withOpacity(0.95),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          _barTitle(context),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0, vertical: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                _description(),
                                SizedBox(height: 20.0),
                                _code(),
                                SizedBox(height: 50.0),
                                _newPassword(),
                                SizedBox(height: 20.0),
                                _confirmPassword(),
                                SizedBox(height: 150.0),
                                GreenButton(
                                    title: 'Reset',
                                    onTap: () => {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Alert1ButtonDialog(
                                                    onTap: () {
                                                      navigation.goToLogin();
                                                    },
                                                    descriptions:
                                                        "Your password has\nbeen reset.");
                                              })
                                        }),
                                SizedBox(height: 50.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }

  Stack _barTitle(context) {
    return Stack(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(children: [
            IconButton(
                color: ColorsGym.cian,
                icon: BackArrow(),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ]),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(children: [
            Center(
              child: Container(
                  margin: EdgeInsets.only(top: 12.0),
                  child: Text('Reset Password',
                      textAlign: TextAlign.center,
                      style: StylesGym.blackBold18)),
            ),
          ]),
        ],
      ),
    ]);
  }

  Text _description() {
    return Text(
        'Please check your email and enter the code we have sent to you:',
        style: StylesGym.darkGrayMedium14);
  }

  Container _code() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
          hintText: "Code",
          hintStyle: StylesGym.darkGrayMedium14,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(1, 156, 124, 1))),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(1, 156, 124, 1)),
          ),
        ),
      ),
    );
  }

  Container _newPassword() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
          hintText: "New Password",
          hintStyle: StylesGym.darkGrayMedium14,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(1, 156, 124, 1))),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(1, 156, 124, 1)),
          ),
        ),
      ),
    );
  }

  Container _confirmPassword() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
          hintText: "Confirm Password",
          hintStyle: StylesGym.darkGrayMedium14,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(1, 156, 124, 1))),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(1, 156, 124, 1)),
          ),
        ),
      ),
    );
  }

  Widget _resetButton(context) {
    return ElevatedButton(
      child: Container(
        width: 200.0,
        height: 40.0,
        child: Center(
          child: Text(
            'Reset',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontFamily: 'Inter-Bold',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: Color.fromRGBO(0, 159, 0, 1),
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
      ),
      onPressed: () => {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Alert1ButtonDialog(
                  onTap: () {
                    navigation.goToLogin();
                  },
                  descriptions: "Your password has\nbeen reset.");
            })
      },
    );
  }
}
