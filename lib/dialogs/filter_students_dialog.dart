import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_passion_admin/helpers/colors_gym.dart';

class Constants {
  Constants._();
  static const double padding = 20;
}

class FilterStudentsDialog extends StatefulWidget {
  final String text;

  const FilterStudentsDialog({Key key, this.text}) : super(key: key);

  @override
  _FilterStudentsDialogState createState() => _FilterStudentsDialogState();
}

class _FilterStudentsDialogState extends State<FilterStudentsDialog> {
  String dropdownValue = 'José';

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
      width: 344,
      height: 232,
      child: Stack(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(20.0),
              height: 290.0,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color.fromRGBO(1, 156, 124, 1),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    _title(),
                    _coachSelection(),
                    _classSelection(),
                    SizedBox(height: 20.0),
                    _goButton()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Stack _title() {
    return Stack(
      children: [
        Row(
          children: [
            Text(
              'Filter Students',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Inter-Bold',
                  fontSize: 18.0),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
                height: 25.0,
                width: 25.0,
                padding: EdgeInsets.all(0.0),
                //decoration: BoxDecoration(color: Colors.red),
                child: IconButton(
                    padding: EdgeInsets.zero,
                    icon: FaIcon(
                      FontAwesomeIcons.times,
                      color: ColorsGym.white,
                      size: 20.0,
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    }))
          ],
        ),
      ],
    );
  }

  Row _coachSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownButton(
          dropdownColor: Color.fromRGBO(1, 156, 124, 1),
          hint: Text('Coach', style: TextStyle(color: Colors.white)),
          //value: dropdownValue,
          icon: FaIcon(
            FontAwesomeIcons.chevronDown,
            color: ColorsGym.white,
            size: 20.0,
          ),
          style: TextStyle(color: Colors.white, fontFamily: 'Inter-Medium'),
          underline: Container(
            height: 1.0,
            color: Colors.transparent,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['José', 'Jesús Castillo', 'Erika Navarro']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
      ],
    );
  }

  Row _classSelection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        DropdownButton(
          dropdownColor: Color.fromRGBO(1, 156, 124, 1),
          hint: Text('Class/Schedule', style: TextStyle(color: Colors.white)),
          icon: FaIcon(
            FontAwesomeIcons.chevronDown,
            color: ColorsGym.white,
            size: 20.0,
          ),
          style: TextStyle(color: Colors.white, fontFamily: 'Inter-Medium'),
          underline: Container(
            height: 1.0,
            color: Colors.transparent,
          ),
          onChanged: (String newValue) {
            setState(() {
              dropdownValue = newValue;
            });
          },
          items: <String>['Beginner', 'Advanced', 'Spining']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(value: value, child: Text(value));
          }).toList(),
        ),
      ],
    );
  }

  ElevatedButton _goButton() {
    return ElevatedButton(
      child: Container(
        width: 200.0,
        height: 40.0,
        child: Center(
          child: Text(
            'Go',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 18.0,
                color: Colors.white,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
      style: ElevatedButton.styleFrom(
        side: BorderSide(width: 2.0, color: Colors.white),
        primary: Colors.transparent,
        elevation: 0,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.circular(5.0),
        ),
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }
}
