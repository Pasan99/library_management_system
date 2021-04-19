import 'package:flutter/material.dart';
import 'package:library_management_system/routes/router.gr.dart';
import 'package:library_management_system/values/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
final _appRouter = NewRouter();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Library Management System',
      theme: ThemeData(
        primaryColor: AppColors.MAIN_COLOR,
        primaryColorLight: AppColors.LIGHT_MAIN_COLOR,
        splashColor: AppColors.LIGHT_MAIN_COLOR,
        accentColor: AppColors.LIGHT_MAIN_COLOR,
        brightness: Brightness.light,
        fontFamily: 'Roboto',
        bottomSheetTheme: BottomSheetThemeData(
            backgroundColor: Colors.black.withOpacity(0)),
      ),
      routerDelegate: _appRouter.delegate(
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
