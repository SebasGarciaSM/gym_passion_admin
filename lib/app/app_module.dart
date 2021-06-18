import 'package:flutter_modular/flutter_modular.dart';
import 'package:gym_passion_admin/navigation/navigation.dart';
import 'package:gym_passion_admin/navigation/routes.dart';
import 'package:gym_passion_admin/pages/home_page.dart';
import 'package:gym_passion_admin/pages/login_page.dart';
import 'package:gym_passion_admin/pages/reset_password_page.dart';
import 'package:gym_passion_admin/pages/students/new_student_page.dart';
import 'package:gym_passion_admin/pages/register_payment_page.dart';
import 'package:gym_passion_admin/pages/splash_page.dart';
import 'package:gym_passion_admin/pages/students/student_details_page.dart';
import 'package:gym_passion_admin/pages/students/students_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((_) => Navigation()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Routes.SPLASH.path, child: (_, __) => SplashPage()),
    //ChildRoute(Routes.ADMIN_LOGIN.path, child: (_, __) => AdminLoginPage()),
    ChildRoute(Routes.LOGIN.path, child: (_, __) => LoginPage()),
    ChildRoute(Routes.COACH_RESET_PASSWORD.path,
        child: (_, __) => CoachResetPasswordPage()),
    ChildRoute(Routes.ADMIN_HOME.path, child: (_, __) => AdminHomePage()),
    ChildRoute(Routes.STUDENTS_INDEX.path, child: (_, __) => StudentsPage()),
    ChildRoute(Routes.NEW_STUDENT.path, child: (_, __) => NewStudentPage()),
    ChildRoute(Routes.STUDENT_DETAILS.path,
        child: (_, __) => StudentDetailsPage()),
    ChildRoute(Routes.REGISTER_PAYMENT.path,
        child: (_, __) => RegisterPaymentPage())
  ];
}
