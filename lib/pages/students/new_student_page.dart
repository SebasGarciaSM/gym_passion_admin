import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_passion_admin/dialogs/alert_1_button_dialog.dart';
import 'package:gym_passion_admin/helpers/colors_gym.dart';
import 'package:gym_passion_admin/helpers/font_awesome.dart';
import 'package:gym_passion_admin/helpers/text_styles.dart';
import 'package:gym_passion_admin/navigation/navigation.dart';
import 'package:gym_passion_admin/widgets/back_arrow.dart';
import 'package:gym_passion_admin/widgets/green_button.dart';
import 'package:gym_passion_admin/widgets/input_text.dart';

class NewStudentPage extends StatefulWidget {
  @override
  _NewStudentPageState createState() => _NewStudentPageState();
}

class _NewStudentPageState extends State<NewStudentPage> {
  final navigation = Modular.get<Navigation>();
  final _sizedBoxInputs = SizedBox(height: 20.0);
  final _sizedBoxDropdown = SizedBox(height: 17.0);
  int _active;

  String dropdownValue = 'José';

  @override
  void initState() {
    _active = 1;
    super.initState();
  }

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
                              Row(
                                children: [
                                  Text('Status',
                                      style: StylesGym.darkGrayMedium14),
                                  Container(
                                    child: Row(
                                      children: [
                                        Radio(
                                            activeColor: ColorsGym.cian,
                                            value: 1,
                                            groupValue: _active,
                                            onChanged: (value) {
                                              setState(() {
                                                _active = value;
                                              });
                                            }),
                                        Text(
                                          'Active',
                                          style: StylesGym.blackMedium14,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Radio(
                                            activeColor: ColorsGym.cian,
                                            value: 2,
                                            groupValue: _active,
                                            onChanged: (value) {
                                              setState(() {
                                                _active = value;
                                              });
                                            }),
                                        Text(
                                          'Inactive',
                                          style: StylesGym.blackMedium14,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              InputText(hint: 'Name', type: TextInputType.name),
                              InputText(
                                  hint: 'Age', type: TextInputType.number),
                              InputText(
                                  hint: 'Height', type: TextInputType.number),
                              InputText(
                                  hint: 'Initial Weight',
                                  type: TextInputType.number),
                              InputText(
                                  hint: 'Current Weight',
                                  type: TextInputType.number),
                              InputText(
                                  hint: 'Goal Weight',
                                  type: TextInputType.number),
                              _paymentStatus(),
                              _sizedBoxDropdown,
                              _registrationDate(),
                              _sizedBoxDropdown,
                              _plan(),
                              _sizedBoxInputs,
                              _enrolledClasses(),
                              SizedBox(
                                height: 30.0,
                              ),
                              _healthLetterButton(),
                              SizedBox(
                                height: 30.0,
                              ),
                              _userTitle(),
                              InputText(
                                  hint: 'Email',
                                  type: TextInputType.emailAddress),
                              InputText(
                                  hint: 'Password',
                                  type: TextInputType.visiblePassword),
                              InputText(
                                  hint: 'Confirm Password',
                                  type: TextInputType.visiblePassword),
                              _role(),
                              SizedBox(
                                height: 50.0,
                              ),
                              GreenButton(
                                  title: 'Register',
                                  onTap: () => {
                                        showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Alert1ButtonDialog(
                                                  onTap: () {
                                                    navigation
                                                        .goToStudentsIndex();
                                                  },
                                                  descriptions:
                                                      "Student\nregistered\nsuccessfully.");
                                            })
                                      }),
                              SizedBox(height: 50.0)
                              //_registerButton(context),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
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
                  child: Text(
                    'New Student',
                    textAlign: TextAlign.center,
                    style: StylesGym.blackBold18,
                  )),
            ),
          ]),
        ],
      ),
    ]);
  }

  Row _paymentStatus() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: DropdownButton(
            isExpanded: true,
            elevation: 0,
            dropdownColor: ColorsGym.cian,
            hint: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child:
                  Text('Payment Status', style: StylesGym.hintInputTextStyle),
            ),
            //value: dropdownValue,
            icon: FontAwesome.downArrow,
            style: TextStyle(color: Colors.white, fontFamily: 'Inter-Medium'),
            underline: Container(
              height: 1.0,
              color: ColorsGym.cian,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Paid', 'Partially Paid', 'Pending']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _registrationDate() {
    return Material(
      shape: Border(
        bottom: BorderSide(
          color: ColorsGym.cian,
        ),
      ),
      child: Stack(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
              height: 50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FontAwesome.downArrow,
                ],
              ),
            )
          ]),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: TextButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.only(left: 4.0)),
                        overlayColor: MaterialStateColor.resolveWith(
                            (states) => Colors.transparent),
                        //padding: EdgeInsets.only(left: 4.0),
                        alignment: Alignment.centerLeft),
                    child: Container(
                      padding: EdgeInsets.zero,
                      height: 20.0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Registration Date',
                              textAlign: TextAlign.left,
                              style: StylesGym.darkGrayMedium14),
                        ],
                      ),
                    ),
                    onPressed: () {}),
              )
            ],
          ),
        ],
      ),
    );
  }

  Row _plan() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: DropdownButton(
            isExpanded: true,
            elevation: 0,
            dropdownColor: ColorsGym.cian,
            hint: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text('Plan', style: StylesGym.hintInputTextStyle),
            ),
            //value: dropdownValue,
            icon: FontAwesome.downArrow,
            style: TextStyle(color: Colors.white, fontFamily: 'Inter-Medium'),
            underline: Container(
              height: 1.0,
              color: ColorsGym.cian,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Basic', 'Pro']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
        ),
      ],
    );
  }

  Container _enrolledClasses() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0),
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FaIcon(
                FontAwesomeIcons.plus,
                color: ColorsGym.cian,
                size: 15.0,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'Enrolled Classes',
                style: StylesGym.hintInputTextStyle,
              )
            ],
          )
        ],
      ),
    );
  }

  Container _healthLetterButton() {
    return Container(
      width: 200.0,
      height: 40.0,
      child: ElevatedButton(
          child: Stack(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FontAwesome.rightArrow,
                  ],
                )
              ],
            ),
            Container(
              child: Center(
                child: Text(
                  'Health Letter',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: ColorsGym.white,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ]),
          style: ElevatedButton.styleFrom(
            primary: ColorsGym.cian,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(5.0),
            ),
          ),
          onPressed: () {}),
    );
  }

  Row _userTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(children: [
          Center(
            child: Container(
                margin: EdgeInsets.only(top: 12.0),
                child: Text(
                  'User',
                  textAlign: TextAlign.center,
                  style: StylesGym.blackBold18,
                )),
          ),
        ]),
      ],
    );
  }

  Container _password() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
          hintText: "Password",
          hintStyle: StylesGym.hintInputTextStyle,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsGym.cian)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsGym.cian),
          ),
        ),
      ),
    );
  }

  Container _confirmPassword() {
    return Container(
      child: TextField(
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 5.0),
          hintText: "Confirm Password",
          hintStyle: StylesGym.hintInputTextStyle,
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorsGym.cian)),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorsGym.cian),
          ),
        ),
      ),
    );
  }

  Row _role() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: DropdownButton(
            isExpanded: true,
            elevation: 0,
            dropdownColor: ColorsGym.cian,
            hint: Padding(
              padding: const EdgeInsets.only(left: 5.0),
              child: Text('Role', style: StylesGym.hintInputTextStyle),
            ),
            //value: dropdownValue,
            icon: FontAwesome.downArrow,
            style: TextStyle(color: Colors.white, fontFamily: 'Inter-Medium'),
            underline: Container(
              height: 1.0,
              color: ColorsGym.cian,
            ),
            onChanged: (String newValue) {
              setState(() {
                dropdownValue = newValue;
              });
            },
            items: <String>['Admin', 'Coach', 'Student']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(value: value, child: Text(value));
            }).toList(),
          ),
        ),
      ],
    );
  }
}
