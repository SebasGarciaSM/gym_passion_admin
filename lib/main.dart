import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gym_passion_admin/app/app_module.dart';
import 'package:gym_passion_admin/navigation/routes.dart';
 
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ModularApp(module:AppModule(), child: MyApp(),));
}
 
class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gym Passion',
      initialRoute: Routes.SPLASH.path,
    ).modular();
  }
}