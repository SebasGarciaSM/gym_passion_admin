enum Routes {
  SPLASH,
  ADMIN_LOGIN,
  LOGIN,
  COACH_RESET_PASSWORD,
  ADMIN_HOME,
  STUDENTS_INDEX,
  NEW_STUDENT,
  STUDENT_DETAILS,
  REGISTER_PAYMENT
}

extension RoutesExtension on Routes {
  String get path {
    switch (this) {
      case Routes.SPLASH:
        return '/splash';
      case Routes.ADMIN_LOGIN:
        return '/admin_login';
      case Routes.LOGIN:
        return '/login';
      case Routes.COACH_RESET_PASSWORD:
        return '/coach_reset_password';
      case Routes.ADMIN_HOME:
        return '/admin_home';
      case Routes.STUDENTS_INDEX:
        return '/students_index';
      case Routes.NEW_STUDENT:
        return '/new_student';
      case Routes.STUDENT_DETAILS:
        return '/student_details';
      case Routes.REGISTER_PAYMENT:
        return '/register_payment';
      default:
        return null;
    }
  }
}
