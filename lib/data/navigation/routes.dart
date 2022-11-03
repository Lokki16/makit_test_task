import 'package:makit_test_task/presentation/template/template.dart';

class AppRoutes {
  static const String routeToAuthorization = 'authorization';
  static const String routeToUsers = 'users';

  static dynamic getRoutes = {
    routeToAuthorization: (context) => const Authorization(),
    routeToUsers: (context) => const Users(),
  };
}
