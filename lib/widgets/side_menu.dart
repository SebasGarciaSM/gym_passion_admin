import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gym_passion_admin/dialogs/alert_2_buttons_dialog.dart';
import 'package:gym_passion_admin/helpers/font_awesome.dart';
import 'package:gym_passion_admin/helpers/text_styles.dart';
import 'package:gym_passion_admin/navigation/navigation.dart';

class SideMenu extends StatelessWidget {
  final navigation = Modular.get<Navigation>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //padding: EdgeInsets.zero,
        children: [
          _itemButton(context, FontAwesome.users, 'Students', () {
            navigation.goToStudentsIndex();
          }),
          _logoutButton(context),
        ],
      ),
    );
  }

  ListTile _itemButton(
      BuildContext context, Widget icon, String title, Function onTap) {
    return ListTile(
      leading: icon,
      title: Align(
        alignment: Alignment(-1.3, 0),
        child: Text(
          title,
          style: StylesGym.blackMedium14,
        ),
      ),
      onTap: () {
        navigation.goToStudentsIndex();
      },
    );
  }

  ListTile _logoutButton(BuildContext context) {
    return ListTile(
      leading: FontAwesome.logout,
      title: Align(
        alignment: Alignment(-1.3, 0),
        child: Text(
          'Logout',
          style: TextStyle(
              fontSize: 14.0, color: Colors.black, fontFamily: 'Inter-Medium'),
        ),
      ),
      onTap: () => {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return Alert2ButtonsDialog(
                onTap: () {
                  navigation.goToLogin();
                },
                descriptions: "Are you sure you\nwant to log out?",
                text: "Yes",
              );
            })
      },
    );
  }
}
