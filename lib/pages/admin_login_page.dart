import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gym_passion_admin/navigation/navigation.dart';

class AdminLoginPage extends StatelessWidget {
  final navigation = Modular.get<Navigation>();
  String error;

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
          children: <Widget>[Center(child: _loginForm(context))],
        ),
      ),
    );
  }

  Widget _loginForm(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: Center(
                child: Text(
              'Welcome!'.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                  fontFamily: 'Inter-Bold',
                  fontWeight: FontWeight.bold),
            )),
          ),
          SizedBox(height: 35.0),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            margin: EdgeInsets.symmetric(horizontal: 32.0),
            height: 340.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.95),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //_errorMessage(),
                _name(),
                SizedBox(height: 20.0),
                _email(),
                SizedBox(height: 20.0),
                _gymName(),
                SizedBox(height: 50.0),
                _loginButton()
              ],
            ),
          )
        ],
      ),
    );
  }

  Row _errorMessage() {
    return Row(
      children: [
        Icon(Icons.close_rounded,
            color: Color.fromRGBO(1, 156, 124, 1), size: 20.0),
        Expanded(
          child: Text('The email or password is incorrect.',
              style: TextStyle(
                  fontSize: 12.0,
                  color: Color.fromRGBO(175, 172, 172, 1),
                  fontFamily: 'Inter-Medium')),
        )
      ],
    );
  }

  Container _name() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
            hintText: "Name",
            hintStyle: TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(1, 156, 124, 1))),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(1, 156, 124, 1)),
            )),
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
          hintStyle: TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(1, 156, 124, 1))),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(1, 156, 124, 1)),
          ),
        ),
      ),
    );
  }

  Container _gymName() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
            hintText: "Gym Name",
            hintStyle: TextStyle(fontSize: 16, color: Color(0xFFB3B1B1)),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Color.fromRGBO(1, 156, 124, 1))),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(1, 156, 124, 1)),
            )),
      ),
    );
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
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontFamily: 'Inter',
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
      onPressed: () {
        navigation.goToAdminHome();
      },
    );
  }
}
