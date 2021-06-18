import 'package:flutter_modular/flutter_modular.dart';
import 'package:gym_passion_admin/navigation/routes.dart';

class Navigation {
  void goToAdminLogin() {
    Modular.to.pushNamed(Routes.ADMIN_LOGIN.path);
  }

  void goToLogin() {
    Modular.to.pushNamed(Routes.LOGIN.path);
  }

  void goToCoachResetPassword() {
    Modular.to.pushNamed(Routes.COACH_RESET_PASSWORD.path);
  }

  void goToAdminHome() {
    Modular.to.pushNamed(Routes.ADMIN_HOME.path);
  }

  void goToStudentsIndex() {
    Modular.to.pushNamed(Routes.STUDENTS_INDEX.path);
  }

  void goToNewStudent() {
    Modular.to.pushNamed(Routes.NEW_STUDENT.path);
  }

  void goToStudentDetails() {
    Modular.to.pushNamed(Routes.STUDENT_DETAILS.path);
  }

  void goToRegisterPayment() {
    Modular.to.pushNamed(Routes.REGISTER_PAYMENT.path);
  }
}
