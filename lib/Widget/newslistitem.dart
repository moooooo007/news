import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:news/Moudels/NewsBody.dart';

class newslistitem extends StatelessWidget {
  Articles articles;

  newslistitem(this.articles);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 10,
          ),
          Image.network(articles.urlToImage ?? "assets/images/newserror.png"),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${articles.title}",
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.green),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "${articles.content}",
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "${articles.author}",
            style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.greenAccent),
            textAlign: TextAlign.left,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "${articles.publishedAt}",
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black),
            textAlign: TextAlign.left,
          ),
        ],
      ),
    );
  }
}
