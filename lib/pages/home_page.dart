import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gym_passion_admin/helpers/colors_gym.dart';
import 'package:gym_passion_admin/helpers/text_styles.dart';
import 'package:gym_passion_admin/navigation/navigation.dart';
import 'package:gym_passion_admin/widgets/side_menu.dart';

class AdminHomePage extends StatelessWidget {
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
              children: [
                Row(
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.bars,
                            color: ColorsGym.cian,
                          ),
                          tooltip: MaterialLocalizations.of(context)
                              .openAppDrawerTooltip,
                          onPressed: () {
                            return Scaffold.of(context).openDrawer();
                          }),
                    )
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
                              'Gym Passion'.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: StylesGym.blackBold14,
                            )),
                      ),
                    ]),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
