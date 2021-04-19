
import 'package:auto_route/annotations.dart';
import 'package:library_management_system/pages/home_page.dart';
import 'package:library_management_system/pages/login_page.dart';
import 'package:library_management_system/pages/registration_page.dart';
import 'package:library_management_system/pages/splash_screen.dart';

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: SplashScreen, initial: true, path: ""),
    MaterialRoute(page: HomePage, initial: false, path: "/home"),
    MaterialRoute(page: LoginPage, initial: false, path: "/login"),
    MaterialRoute(page: RegistrationPage, initial: false, path: "/register"),
  ],
)
class $NewRouter {
}
