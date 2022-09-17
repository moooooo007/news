import 'package:flutter/material.dart';
import 'package:news/Moudels/NewsBody.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDiteals extends StatelessWidget {
    static var RoutName = "NewsDiteals";

  @override
  Widget build(BuildContext context) {
    Articles Art = ModalRoute
        .of(context)!
        .settings
        .arguments as Articles;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("News Detalis"),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            )
        ),),
      body: (
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Image.network(Art.urlToImage ?? "assets/images/newserror.png"),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${Art.title}",
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.green),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "${Art.content}",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "${Art.description}",
                  style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Authers By ${Art.author ?? "Unkown"}",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  "Puplished in ${Art.publishedAt ?? "Unkown"}",
                  style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () async{
                urlncher(Art.url!);
                  },
                  child: Text(
                    "View All Articls",
                    style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                    textAlign: TextAlign.right,
                  ),
                ),
              ],
            ),
          )
      ),);
  }
    Future<void> urlncher (String? urlname)async{
      Uri url = Uri.parse("$urlname");
    if (await launchUrl(url)){
      await launchUrl(url);
    }else throw "Something Error Try Again Later";
    }
}

