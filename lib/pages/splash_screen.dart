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
    Future.delayed(Duration(milliseconds: 1600)).then((value) async {
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
    return Stack(
      children: [
        Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Library", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),),
                Text("App", style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            )
          ),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
              image: AssetImage(
                "assets/images/img_books.jpg",
              ),
            ),
          ),
        )

      ],
    );
  }
}
