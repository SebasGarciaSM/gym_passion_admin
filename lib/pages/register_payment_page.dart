import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gym_passion_admin/dialogs/alert_1_button_dialog.dart';
import 'package:gym_passion_admin/helpers/colors_gym.dart';
import 'package:gym_passion_admin/helpers/font_awesome.dart';
import 'package:gym_passion_admin/helpers/text_styles.dart';
import 'package:gym_passion_admin/navigation/navigation.dart';
import 'package:gym_passion_admin/widgets/back_arrow.dart';
import 'package:gym_passion_admin/widgets/green_button.dart';
import 'package:gym_passion_admin/widgets/input_text.dart';

class RegisterPaymentPage extends StatefulWidget {
  @override
  _RegisterPaymentPageState createState() => _RegisterPaymentPageState();
}

class _RegisterPaymentPageState extends State<RegisterPaymentPage> {
  final navigation = Modular.get<Navigation>();

  String dropdownValue = 'José';

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
                                SizedBox(height: 40.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: DropdownButton(
                                        isExpanded: true,
                                        elevation: 0,
                                        dropdownColor: ColorsGym.cian,
                                        hint: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text('Date',
                                              style:
                                                  StylesGym.hintInputTextStyle),
                                        ),
                                        //value: dropdownValue,
                                        icon: FontAwesome.downArrow,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Inter-Medium'),
                                        underline: Container(
                                          height: 1.0,
                                          color: ColorsGym.cian,
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            dropdownValue = newValue;
                                          });
                                        },
                                        items: <String>[
                                          'Paid',
                                          'Partially Paid',
                                          'Pending'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                              value: value, child: Text(value));
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                InputText(
                                    hint: 'Amount', type: TextInputType.number),
                                SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: DropdownButton(
                                        isExpanded: true,
                                        elevation: 0,
                                        dropdownColor: ColorsGym.cian,
                                        hint: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text('Concept',
                                              style:
                                                  StylesGym.hintInputTextStyle),
                                        ),
                                        //value: dropdownValue,
                                        icon: FontAwesome.downArrow,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Inter-Medium'),
                                        underline: Container(
                                          height: 1.0,
                                          color: ColorsGym.cian,
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            dropdownValue = newValue;
                                          });
                                        },
                                        items: <String>[
                                          'Paid',
                                          'Partially Paid',
                                          'Pending'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                              value: value, child: Text(value));
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: DropdownButton(
                                        isExpanded: true,
                                        elevation: 0,
                                        dropdownColor: ColorsGym.cian,
                                        hint: Padding(
                                          padding:
                                              const EdgeInsets.only(left: 5.0),
                                          child: Text('Status',
                                              style:
                                                  StylesGym.hintInputTextStyle),
                                        ),
                                        icon: FontAwesome.downArrow,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Inter-Medium'),
                                        underline: Container(
                                          height: 1.0,
                                          color: ColorsGym.cian,
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            dropdownValue = newValue;
                                          });
                                        },
                                        items: <String>[
                                          'Paid',
                                          'Partially Paid',
                                          'Pending'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                              value: value, child: Text(value));
                                        }).toList(),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 50.0),
                                GreenButton(
                                    title: 'Register',
                                    onTap: () => {
                                          showDialog(
                                              context: context,
                                              builder: (BuildContext context) {
                                                return Alert1ButtonDialog(
                                                    onTap: () {
                                                      navigation
                                                          .goToStudentDetails();
                                                    },
                                                    descriptions:
                                                        "Payment\nregistered\nsuccessfully.");
                                              })
                                        }),
                                SizedBox(height: 30.0),
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
                  child: Text('Register Payment',
                      textAlign: TextAlign.center,
                      style: StylesGym.blackBold18)),
            ),
          ]),
        ],
      ),
    ]);
  }
}
