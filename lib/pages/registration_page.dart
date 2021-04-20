import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:library_management_system/routes/router.gr.dart';
import 'package:library_management_system/values/colors.dart';
import 'package:library_management_system/viewmodels/registration_page_viewmodel.dart';
import 'package:provider/provider.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  FocusNode node1 = FocusNode();
  FocusNode nodeA = FocusNode();
  FocusNode nodeB= FocusNode();
  FocusNode nodeC = FocusNode();
  FocusNode node2 = FocusNode();

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
          create: (context) => RegistrationPageViewModel(),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/images/img_login.png",
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Consumer<RegistrationPageViewModel>(
                      builder: (context, model, child) {
                        return Form(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              TextFormField(
                                onFieldSubmitted: (val){
                                  FocusScope.of(context).requestFocus(nodeB);
                                },
                                controller: model.firstName,
                                focusNode: nodeA,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'First Name cannot be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Umain",
                                  border: OutlineInputBorder(),
                                  labelText: "First Name",
                                  focusColor: Colors.black,
                                ),

                              ),
                              Container(height: 16,),
                              TextFormField(
                                onFieldSubmitted: (val){
                                  FocusScope.of(context).requestFocus(nodeC);
                                },
                                controller: model.lastName,
                                focusNode: nodeB,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.name,
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Last Name cannot be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "Wilfred",
                                  border: OutlineInputBorder(),
                                  labelText: "Last Name",
                                  focusColor: Colors.black,
                                ),

                              ),
                              Container(height: 16,),
                              TextFormField(
                                onFieldSubmitted: (val){
                                  FocusScope.of(context).requestFocus(node1);
                                },
                                controller: model.contact,
                                focusNode: nodeC,
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.phone,
                                // The validator receives the text that the user has entered.
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Contact cannot be empty';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  hintText: "0716667272",
                                  border: OutlineInputBorder(),
                                  labelText: "Contact",
                                  focusColor: Colors.black,
                                ),

                              ),
                              Container(height: 16,),
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
                                child: ElevatedButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(SnackBar(content: Text('Processing Data')));
                                      bool result = await model.register();
                                      if (result){
                                        AutoRouter.of(context).popAndPush(HomePageRoute());
                                      }
                                      else{
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(content: Text('User name & password did not matched')));
                                      }
                                    }
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors.MAIN_COLOR, // background
                                    onPrimary: Colors.white, // foreground
                                  ),
                                  child: Text('Register'),
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
