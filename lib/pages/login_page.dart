import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_passion_admin/helpers/colors_gym.dart';
import 'package:gym_passion_admin/navigation/navigation.dart';
import 'package:gym_passion_admin/helpers/text_styles.dart';
import 'package:gym_passion_admin/widgets/green_button.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final navigation = Modular.get<Navigation>();

  bool _enablePassword;
  Color _changeColor;

  @override
  void initState() {
    _enablePassword = true;
    _changeColor = ColorsGym.darkgray;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/img/gymbg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[_loginForm(context)],
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    final navigation = Modular.get<Navigation>();
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 104.0),
            child: Center(
                child: Text(
              'Welcome!'.toUpperCase(),
              textAlign: TextAlign.center,
              style: StylesGym.whiteBold25,
            )),
          ),
          SizedBox(height: 35.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            margin: EdgeInsets.symmetric(horizontal: 32.0),
            height: 272.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _email(),
                SizedBox(height: 20.0),
                _password(),
                SizedBox(height: 50.0),
                GreenButton(
                    title: 'Login',
                    onTap: () {
                      navigation.goToAdminHome();
                    })
              ],
            ),
          ),
          SizedBox(height: 50.0),
          TextButton(
            child: Text(
              'Forgot Password?',
              style: StylesGym.whiteUnderlineMedium14,
            ),
            onPressed: () {
              navigation.goToCoachResetPassword();
            },
          )
        ],
      ),
    );
  }

  Container _email() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
          hintText: "Email",
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

  Widget _password() {
    return Stack(children: [
      Container(
        child: TextField(
          obscureText: _enablePassword,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 5.0, right: 50.0),
              hintText: "Password",
              hintStyle: StylesGym.darkGrayMedium14,
              enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: ColorsGym.cian)),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: ColorsGym.cian),
              )),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              padding: EdgeInsets.zero,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (_changeColor == ColorsGym.darkgray) {
                        _enablePassword = false;
                        _changeColor = ColorsGym.cian;
                      } else {
                        _changeColor = ColorsGym.darkgray;
                        _enablePassword = true;
                      }
                    });
                    print('Pressed');
                  },
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: FaIcon(
                    FontAwesomeIcons.solidEye,
                    color: _changeColor,
                  ))),
        ],
      ),
    ]);
  }

  ElevatedButton _loginButton() {
    return ElevatedButton(
      child: Container(
        width: 200.0,
        height: 40.0,
        child: Center(
          child: Text(
            'Login',
            textAlign: TextAlign.center,
            style: StylesGym.whiteBold18,
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        primary: ColorsGym.green,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
      ),
      onPressed: () {
        navigation.goToAdminHome();
      },
    );
  }
}
