import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:news/SourcesResponse.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  static var RoutName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List <Sources> Source = [];

  @override
  Widget build(BuildContext context) {
    if (Source.isEmpty){GetApi();};
    return
      Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
                height: 75,
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 35,),
                    const Text("General News",
                      style: const TextStyle(fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white), textAlign: TextAlign.center,),

                  ],
                )
            ),
            const SizedBox(height: 100,),
            Source.isEmpty ? const Center (child: const CircularProgressIndicator(),):
            Text
              (Source[0].name!),
          ],
        ),
      );
  }

  void GetApi() async {
    try{
      http.Response response
      = await http.get(Uri.parse(
          "https://newsapi.org/v2/top-headlines/sources?apikey=fa640ce09d8d4898affd2c40d91b0fa5"));
      SourcesResponse sourcesresponse = SourcesResponse.fromJson(
          jsonDecode(response.body));
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        Source = sourcesresponse.sources!;
        setState(() {
        });
      }else {
        Fluttertoast.showToast(
            msg: sourcesresponse.massege??"",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black,
            textColor: Colors.white,
            fontSize: 18.0
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