import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:news/Moudels/NewsBody.dart';


import '../Moudels/NewsBody.dart';
class newslist extends StatelessWidget {
Sources sssource ;
newslist(this.sssource);
  @override
  Widget build(BuildContext context) {
    return
      Container(
        child: Text("Source ${sssource.name}"),
      );
  }
  Future<NewsBody> GetNews()async{
    try{
      http.Response response
      = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?apikey=fa640ce09d8d4898affd2c40d91b0fa5&sources${sssource.id}"));
      NewsBody newsBody = NewsBody.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return newsBody;

      }else {
        throw Exception(NewsBody.massege)
        );
      }
    } on Exception catch (_){
      Fluttertoast.showToast(
          msg: "Filed Load, Please Check Your Connection",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 18.0
      );
    }
  }
}
