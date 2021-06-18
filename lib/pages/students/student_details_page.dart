import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_passion_admin/dialogs/alert_2_buttons_dialog.dart';
import 'package:gym_passion_admin/helpers/colors_gym.dart';
import 'package:gym_passion_admin/helpers/font_awesome.dart';
import 'package:gym_passion_admin/helpers/text_styles.dart';
import 'package:gym_passion_admin/navigation/navigation.dart';
import 'package:gym_passion_admin/widgets/back_arrow.dart';
import 'package:gym_passion_admin/widgets/green_button.dart';

class StudentDetailsPage extends StatefulWidget {
  @override
  _StudentDetailsPageState createState() => _StudentDetailsPageState();
}

class _StudentDetailsPageState extends State<StudentDetailsPage>
    with SingleTickerProviderStateMixin {
  final navigation = Modular.get<Navigation>();
  TabController _controller;
  int _active;
  double _height;
  bool _visible;
  FaIcon _icon;

  @override
  void initState() {
    _active = 1;
    _height = 56.0;
    _visible = false;
    _icon = FontAwesome.downAngleArrow;
    super.initState();
    _controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorsGym.white,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorsGym.white,
          elevation: 0,
          title: Text(
            'Student',
            style: StylesGym.blackMedium14,
          ),
          leading: Container(
              height: double.infinity, width: 56.0, child: BackArrow()),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: Column(
              children: [
                _statusRadios(),
                _tabBar(),
              ],
            ),
          ),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    _editDelete(),
                    _infoContainer(
                        context, 'Name', 'Regina Zamora', ColorsGym.lightgray),
                    _infoContainer(context, 'Age', '30 years', ColorsGym.white),
                    _infoContainer(
                        context, 'Height', '1.60 m', ColorsGym.lightgray),
                    _infoContainer(
                        context, 'Initial\nweight', '79 kg.', ColorsGym.white),
                    _infoContainer(context, 'Current\nweight', '78 kg.',
                        ColorsGym.lightgray),
                    _infoContainer(
                        context, 'Goal\nweight', '75 kg.', ColorsGym.white),
                    _infoContainer(context, 'Payment\nstatus', 'Paid',
                        ColorsGym.lightgray),
                    _infoContainer(context, 'Registration\ndate',
                        '20 February 2021', ColorsGym.white),
                    _infoContainer(
                        context, 'Plan', 'Basic', ColorsGym.lightgray),
                    _infoContainer(context, 'Role', 'Student', ColorsGym.white),
                    _infoContainer(context, 'Email', 'regina@gmail.com',
                        ColorsGym.lightgray),
                    _infoContainer(
                        context, 'Password', '.....', ColorsGym.white),
                    _classesRow(),
                    SizedBox(
                      height: 10.0,
                    ),
                    _classContainer(
                        'Spinning', 'Jesús Castillo', 'Monday 8:00'),
                    _classContainer('Box', 'Alberto Garza', 'Tuesday 10:00'),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(top: 16.0),
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: [
                    _infoContainer(
                        context, 'Name', 'Regina Zamora', ColorsGym.lightgray),
                    _infoContainer(context, 'Plan', 'Basic', ColorsGym.white),
                    _infoContainer(context, 'Next payment', '\$ 500.00',
                        ColorsGym.lightgray),
                    _infoContainer(context, 'Next payment date', '20 June 2021',
                        ColorsGym.white),
                    _registerPaymentButton(),
                    _dateConcept(context),
                    _payment(context),
                    _payment(context),
                    SizedBox(height: 200.0)
                  ],
                ),
              ),
            ),
            Center(
              child: Container(
                height: 20.0,
                color: Colors.blue,
              ),
            )
          ],
        ));
  }

  Widget _statusRadios() {
    return Container(
      height: 35.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Status', style: StylesGym.blackMedium14),
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
                Text('Active')
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
                Text('Inactive')
              ],
            ),
          ),
        ],
      ),
    );
  }

  TabBar _tabBar() {
    return TabBar(
      controller: _controller,
      indicatorColor: ColorsGym.cian,
      indicatorWeight: 4.0,
      tabs: [
        Tab(
          child: Text(
            'Information',
            style: StylesGym.blackMedium14,
          ),
        ),
        Tab(
          child: Text(
            'Payment',
            style: StylesGym.blackMedium14,
          ),
        ),
        Tab(
          child: Text(
            'Health',
            style: StylesGym.blackMedium14,
          ),
        )
      ],
    );
  }

  Container _editDelete() {
    return Container(
      height: 50.0,
      child: Stack(
        children: [
          Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 130.0,
                    height: 25.0,
                    child: ElevatedButton(
                        child: Stack(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FontAwesome.downAngleArrow,
                                ],
                              )
                            ],
                          ),
                          Container(
                            child: Text('Classes',
                                textAlign: TextAlign.center,
                                style: StylesGym.cianBold18),
                          ),
                        ]),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.transparent,
                            shadowColor: Colors.transparent),
                        onPressed: () {}),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Builder(
                    builder: (context) => IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.solidEdit,
                          color: ColorsGym.cian,
                        ),
                        onPressed: () {}),
                  ),
                  Builder(
                    builder: (context) => IconButton(
                        icon: FaIcon(
                          FontAwesomeIcons.solidTrashAlt,
                          color: ColorsGym.cian,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Alert2ButtonsDialog(
                                  onTap: () {
                                    navigation.goToStudentsIndex();
                                  },
                                  descriptions:
                                      "Are you sure you want\nto delete this student?",
                                  text: "Yes",
                                );
                              });
                        }),
                  )
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  Container _infoContainer(
      BuildContext context, String title, String content, Color color) {
    return Container(
      height: 56.0,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0),
            color: color,
            width: MediaQuery.of(context).size.width * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: StylesGym.blackMedium12,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 5.0),
              padding: EdgeInsets.only(left: 10.0),
              color: color,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    content,
                    style: StylesGym.blackBold14,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _classesRow() {
    return Container(
      height: 40.0,
      child: Stack(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      'Classes:',
                      style: StylesGym.blackBold18,
                    )
                  ],
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  icon: FontAwesome.plus,
                  onPressed: () {})
            ],
          )
        ],
      ),
    );
  }

  Container _classContainer(
      String classTitle, String coach, String dateAndHour) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      height: 150.0,
      child: Column(
        children: [
          Container(
            height: 40.0,
            decoration: BoxDecoration(
                color: ColorsGym.darkgray,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10.0),
                    topRight: Radius.circular(10.0))),
            child: Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                        padding: EdgeInsets.zero,
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        icon: FontAwesome.close,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return Alert2ButtonsDialog(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    print('Class deleted.');
                                  },
                                  descriptions:
                                      "Are you sure you want\nto delete this class?",
                                  text: "Yes",
                                );
                              });
                        })
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(left: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            dateAndHour,
                            style: StylesGym.whiteBold18,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: ColorsGym.lightgray,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10.0),
                      bottomRight: Radius.circular(10.0))),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(classTitle, style: StylesGym.blackBold18),
                    SizedBox(height: 15.0),
                    Text(coach, style: StylesGym.blackMedium14)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _registerPaymentButton() {
    return Container(
        margin: EdgeInsets.only(top: 32.0, bottom: 43.0),
        child: GreenButton(
            title: 'Register Payment',
            onTap: () {
              navigation.goToRegisterPayment();
            }));
  }

  Container _dateConcept(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 4.0),
      height: 20.0,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0),
            width: MediaQuery.of(context).size.width * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Date',
                  style: StylesGym.blackBold14,
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Concept',
                    style: StylesGym.blackBold14,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _payment(BuildContext context) {
    return Container(
      height: _height,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10.0),
            color: ColorsGym.lightgray,
            width: MediaQuery.of(context).size.width * 0.25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '2021-05-20',
                  style: StylesGym.blackMedium12,
                )
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(left: 5.0),
                    padding: EdgeInsets.only(left: 10.0),
                    color: ColorsGym.lightgray,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Monthly subscription',
                          style: StylesGym.blackMedium14,
                        ),
                        Visibility(
                            visible: _visible,
                            child: Column(
                              children: [
                                SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    Text(
                                      'Amount: ',
                                      style: StylesGym.blackMedium12,
                                    ),
                                    Text(
                                      '\$500.00',
                                      style: StylesGym.blackMedium12,
                                    ),
                                  ],
                                ),
                                SizedBox(height: 10.0),
                                Row(
                                  children: [
                                    Text(
                                      'Status: ',
                                      style: StylesGym.blackMedium12,
                                    ),
                                    Text(
                                      'Paid',
                                      style: StylesGym.blackMedium12,
                                    ),
                                  ],
                                ),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Container(
                          width: 40.0,
                          height: 56.0,
                          color: ColorsGym.lightgray,
                          child: IconButton(
                            icon: _icon,
                            onPressed: () {
                              setState(() {
                                if (_height == 56.0) {
                                  _height = 112.0;
                                  _icon = FontAwesome.upAngleArrowGray;
                                } else {
                                  _height = 56.0;
                                  _icon = FontAwesome.downAngleArrowGray;
                                }
                                _visible = !_visible;
                              });
                            },
                          )),
                    ),
                    Visibility(
                      visible: _visible,
                      child: Container(
                          width: 40.0,
                          height: 56.0,
                          color: ColorsGym.lightgray,
                          child: IconButton(
                            icon: FontAwesome.delete,
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Alert2ButtonsDialog(
                                      onTap: () {
                                        Navigator.of(context).pop();
                                      },
                                      descriptions:
                                          "Are you sure you want\nto delete this payment?",
                                      text: "Yes",
                                    );
                                  });
                            },
                          )),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
