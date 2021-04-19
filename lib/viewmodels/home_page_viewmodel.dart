import 'package:flutter/cupertino.dart';
import 'package:library_management_system/models/book_model.dart';
import 'package:library_management_system/models/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:library_management_system/models/response_model.dart';

class HomePageViewModel extends ChangeNotifier{
  List<BookModel>? books;
  bool isSuccess = false;

  HomePageViewModel(){
    getData();
  }

  Future<void> getData() async {
    books = [];
    try {
      String url1 = AppConstants.BASE_URL + AppConstants.LIST_ALL_BOOKS_PATH;
      var url = Uri.parse(url1);
      http.Response response = await http.get(url);
      print(response.body);
      var booksArray = ResponseModel.fromJson(jsonDecode(response.body)).responseData as List<dynamic>;
      booksArray.forEach((element) {
        books!.add(BookModel.fromJson(element as Map<String, dynamic>));
      });
      isSuccess = true;
    }
    catch(e){
      print(e);
      isSuccess = false;
    }
    notifyListeners();
  }

  reserveBook(int id) async {
    try {
      String url1 = AppConstants.BASE_URL + AppConstants.RESERVE_BOOK_PATH + "?bookId=$id";
      var url = Uri.parse(url1);
      http.Response response = await http.get(url);
      print(response.body);
    }
    catch(e){
      print(e);
    }
    await getData();
  }
}