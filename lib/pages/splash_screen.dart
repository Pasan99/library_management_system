import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:library_management_system/routes/router.gr.dart';
import 'package:library_management_system/utilities/user_helper.dart';
import 'package:library_management_system/values/colors.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 1200), vsync: this, value: 0.2);
    _animation =
        CurvedAnimation(parent: _controller, curve: Curves.bounceIn);

    _controller.forward();
    Future.delayed(Duration(milliseconds: 800)).then((value) async {
      Navigator.of(context).pop();
      if (await UserHelper().getCurrentUser() == null){
        AutoRouter.of(context).popAndPush(LoginPageRoute());
      }
      else{
        AutoRouter.of(context).popAndPush(HomePageRoute());
      }
      // await UserHelper().getCurrentUser();
      // final FirebaseAuth _auth = FirebaseAuth.instance;
      // Navigator.of(context).pop();
      // if (_auth.currentUser == null) {
      //   AutoRouter.of(context).popAndPush(
      //       LoginPageRoute());
      // } else {
      //   AutoRouter.of(context).navigate(
      //       HomePageRoute());
      // }

      // AutoRouter.of(context).navigate(HomePageRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: AppColors.MAIN_COLOR,
          child: Center(
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ScaleTransition(
                    scale: _animation,
                    alignment: Alignment.center,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 3,
                        ),
                        Image.asset(
                          "assets/images/ic_logo.png",
                          width: MediaQuery.of(context).size.width,
                          height: 200,
                        ),
                        Container(
                          height: 20,
                        ),
                        Text(
                          "VEHICLE STATS",
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.LIGHT_MAIN_COLOR),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 32, right: 32, left: 32),
                  child: Text("Powered by TeamTriangle", style: TextStyle(fontWeight: FontWeight.w300, fontSize: 12, color: AppColors.LIGHT_MAIN_COLOR),),
                )
              ],
            ),
          ),
        ));
  }
}
