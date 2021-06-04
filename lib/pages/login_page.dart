import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:library_management_system/routes/router.gr.dart';
import 'package:library_management_system/values/colors.dart';
import 'package:library_management_system/viewmodels/login_page_viewmodel.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formKey = GlobalKey<FormState>();
  FocusNode node1 = FocusNode();
  FocusNode node2 = FocusNode();

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        child: ChangeNotifierProvider(
          create: (context) => LoginPageViewModel(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/img_books_2.jpeg",
                  fit: BoxFit.cover,
                  height: 400,
                  width: MediaQuery.of(context).size.width,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Consumer<LoginPageViewModel>(
                    builder: (context, model, child) {
                      return Form(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              onFieldSubmitted: (val){
                                FocusScope.of(context).requestFocus(node2);
                              },
                              controller: model.userName,
                              focusNode: node1,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.emailAddress,
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'User Name cannot be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "umain_wilfred",
                                border: OutlineInputBorder(),
                                labelText: "User Name",
                                focusColor: Colors.black,
                              ),

                            ),
                            Container(height: 16,),
                            TextFormField(
                              controller: model.password,
                              onFieldSubmitted: (val) async {
                                // if (_formKey.currentState!.validate()) {
                                //   ScaffoldMessenger.of(context)
                                //       .showSnackBar(SnackBar(content: Text('Processing Data')));
                                //   bool result = await model.login();
                                //   if (result){
                                //     AutoRouter.of(context).pop();
                                //     AutoRouter.of(context).popAndPush(HomePageRoute());
                                //   }
                                //   else{
                                //     ScaffoldMessenger.of(context)
                                //         .showSnackBar(SnackBar(content: Text('User name & password did not matched')));
                                //   }
                                // }
                              },
                              focusNode: node2,
                              keyboardType: TextInputType.emailAddress,
                              // The validator receives the text that the user has entered.
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password cannot be empty';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: "*********",
                                border: OutlineInputBorder(),
                                labelText: "Password",
                                  focusColor: Colors.black
                              ),
                              obscureText: true,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 16.0),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: !isLoading ? () async {
                                      if (_formKey.currentState!.validate()) {
                                        setState(() {
                                          isLoading = true;
                                        });
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                                        bool result = await model.login();
                                        setState(() {
                                          isLoading = false;
                                        });
                                        if (result){
                                          AutoRouter.of(context).popAndPush(HomePageRoute());
                                        }
                                        else{
                                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(content: Text('User name & password did not matched')));
                                        }
                                      }
                                    } : null,
                                    style: ElevatedButton.styleFrom(
                                      primary: AppColors.MAIN_COLOR, // background
                                      onPrimary: Colors.white, // foreground
                                    ),
                                    child: isLoading ? SpinKitFadingCircle(size: 24, color: AppColors.TEXT_WHITE,) :  Text('Login'),
                                  ),
                                  Container(width: 16,),
                                  TextButton(
                                    onPressed: () {
                                      AutoRouter.of(context).popAndPush(RegistrationPageRoute());
                                    },
                                    child: Text('Register', style: TextStyle(color: AppColors.MAIN_COLOR),),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
