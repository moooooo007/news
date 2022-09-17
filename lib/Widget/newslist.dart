import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:news/Moudels/SourcesResponse.dart';
import 'package:news/Moudels/NewsBody.dart';
import 'newslistitem.dart';

class newslist extends StatelessWidget {
  Sources sssource;

  newslist(this.sssource);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NewsBody?>(
      future: GetNews(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return const Text("Error, Try Again Later");
        } else if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.articles!.length,
              itemBuilder: (context, index) {
                return newslistitem(snapshot.data!.articles!.elementAt(index));
              });
        } else if (snapshot.connectionState == ConnectionState.none) {
          {
            return const Text("Error, Try Again Later");
          }
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Future<NewsBody?> GetNews() async {
    try {
      http.Response response = await http.get(Uri.parse(
          "https://newsapi.org/v2/everything?apiKey=fa640ce09d8d4898affd2c40d91b0fa5&sources=${sssource.id}"));
      NewsBody newsBody = NewsBody.fromJson(jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        return newsBody;
      } else {
        throw Exception(newsBody.massege ?? "");
      }
    } on Exception catch (_) {
      Fluttertoast.showToast(
          msg: "loading error, Please Check Your Connection",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 18.0);
    }
  }
}
