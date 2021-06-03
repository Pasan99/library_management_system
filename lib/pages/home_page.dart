import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:library_management_system/routes/router.gr.dart';
import 'package:library_management_system/utilities/user_helper.dart';
import 'package:library_management_system/values/colors.dart';
import 'package:library_management_system/viewmodels/home_page_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Library Management System"),
          leading: Container(),
          centerTitle: true,
          elevation: 0,
          actions: [
            InkWell(
              onTap: () async {
                await UserHelper().logout();
                AutoRouter.of(context).pop();
                AutoRouter.of(context).popAndPush(LoginPageRoute());
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Icon(Icons.logout),
              ),
            )
          ],
        ),
        body: Consumer<HomePageViewModel>(
          builder: (context, model, child) {
            return model.books != null && model.books!.length > 0 ? ListView(
              children: model.books!.map((book) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Material(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                    child: Row(
                      children: [
                        ClipRRect(
                          child: Image.asset(
                            "assets/images/ic_book.png",
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        Expanded(
                            flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Wrap(

                                    children: [
                                      Text(book.description, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                                    ],
                                  ),
                                  Container(height: 4,),
                                  Row(
                                    children: [
                                      Text(book.authorName, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),),
                                    ],
                                  )
                                ],
                              ),
                            )
                        ),
                        Expanded(
                            flex: 1,
                            child: ElevatedButton(
                              onPressed: book.count > 0 && !book.isReserving ? () async {
                                setState(() {
                                  book.isReserving = true;
                                });
                                await model.reserveBook(book.bookId);
                                setState(() {
                                  book.isReserving = false;
                                });
                              } : null,
                              child: book.isReserving ? SpinKitFadingCircle(size: 24, color: AppColors.TEXT_WHITE,) : Text("${book.count > 0 ? "Reserve" : "Reserved"} (${book.count})", style: TextStyle(fontSize: 12),),
                            )
                        )
                      ],
                    ),
                  ),
                ),
              )).toList()
            ) : Center(
              child: SpinKitRing(size: 24, color: Colors.black,),
            );
          }
        ),
      ),
    );
  }
}
