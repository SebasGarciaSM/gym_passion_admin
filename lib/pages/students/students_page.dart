import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_passion_admin/dialogs/filter_students_dialog.dart';
import 'package:gym_passion_admin/helpers/colors_gym.dart';
import 'package:gym_passion_admin/helpers/text_styles.dart';
import 'package:gym_passion_admin/navigation/navigation.dart';
import 'package:gym_passion_admin/widgets/side_menu.dart';
import 'package:gym_passion_admin/widgets/switch_flutter.dart';

class StudentsPage extends StatefulWidget {
  @override
  _StudentsPageState createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  bool isSwitched = false;
  final navigation = Modular.get<Navigation>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: SideMenu(),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [_menuButton(), _title(), _filterButton()],
            ),
            Container(
              child: Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    _student('Regina Zamora', 'Basic',
                        Color.fromRGBO(238, 238, 238, 1)),
                    _student('Valeria Estrada', 'Pro',
                        Color.fromRGBO(255, 255, 255, 1)),
                    _student('Cinthya Bautista', 'Basic',
                        Color.fromRGBO(238, 238, 238, 1)),
                    _student('Andrés Flores', 'Basic',
                        Color.fromRGBO(255, 255, 255, 1)),
                    _student('Regina Zamora', 'Basic',
                        Color.fromRGBO(238, 238, 238, 1)),
                    _student('Valeria Estrada', 'Pro',
                        Color.fromRGBO(255, 255, 255, 1)),
                    _student('Cinthya Bautista', 'Basic',
                        Color.fromRGBO(238, 238, 238, 1)),
                    _student('Andrés Flores', 'Basic',
                        Color.fromRGBO(255, 255, 255, 1)),
                    _student('Regina Zamora', 'Basic',
                        Color.fromRGBO(238, 238, 238, 1)),
                    _student('Valeria Estrada', 'Pro',
                        Color.fromRGBO(255, 255, 255, 1)),
                    _student('Cinthya Bautista', 'Basic',
                        Color.fromRGBO(238, 238, 238, 1)),
                    _student('Andrés Flores', 'Basic',
                        Color.fromRGBO(255, 255, 255, 1)),
                  ],
                ),
              ),
            ),
            _newStudentButton()
          ],
        ),
      ),
    );
  }

  Container _newStudentButton() {
    return Container(
      height: 64.0,
      decoration: BoxDecoration(color: Colors.white),
      child: Center(
          child: ElevatedButton(
              child: Container(
                width: 200.0,
                height: 40.0,
                child: Center(
                  child: Text(
                    'New Student',
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
                primary: ColorsGym.green,
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0),
                ),
              ),
              onPressed: () {
                navigation.goToNewStudent();
              })),
    );
  }

  Row _menuButton() {
    return Row(
      children: [
        Builder(
          builder: (context) => IconButton(
              color: Color.fromRGBO(1, 156, 124, 1),
              icon: FaIcon(
                FontAwesomeIcons.bars,
                color: ColorsGym.cian,
              ),
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              onPressed: () {
                return Scaffold.of(context).openDrawer();
              }),
        )
      ],
    );
  }

  Row _title() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(children: [
          Center(
            child: Container(
                margin: EdgeInsets.only(top: 12.0),
                child: Text(
                  'Students'.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.black,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold),
                )),
          ),
        ]),
      ],
    );
  }

  Row _filterButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Builder(
          builder: (context) => IconButton(
              icon: FaIcon(
                FontAwesomeIcons.slidersH,
                color: ColorsGym.cian,
              ),
              onPressed: () {
                return showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return FilterStudentsDialog(
                        text: "Yes",
                      );
                    });
              }),
        )
      ],
    );
  }

  InkWell _student(String name, String plan, Color color) {
    return InkWell(
      onTap: () {
        navigation.goToStudentDetails();
      },
      child: Container(
        height: 64.0,
        decoration: BoxDecoration(color: color),
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Stack(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                //decoration: BoxDecoration(color: Colors.red),
                width: 50.0,
                height: double.infinity,
                child: SwitchFlutter(),
                //onTap: () { setState(() { isSwitched = !isSwitched; }); },
              )
            ],
          ),
          _studentBasicInfo(name, plan),
        ]),
      ),
    );
  }

  Row _studentBasicInfo(String name, String plan) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '$name',
              style: StylesGym.blackMedium14,
            ),
            SizedBox(height: 5.0),
            Text('Plan: $plan',
                textAlign: TextAlign.start, style: StylesGym.blackMedium12)
          ],
        ),
      ],
    );
  }
}
