import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:news/Moudels/SourcesResponse.dart';

class tabstyle extends StatelessWidget {
  Sources source;

  bool selected;

  tabstyle({required this.source, required this.selected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: selected ? Colors.green : Colors.white,
      ),
      child: Text(
        source.name ?? "Unkown",
        style: TextStyle(
            fontSize: 20,
            fontWeight: selected ? FontWeight.bold : FontWeight.normal,
            color: selected ? Colors.white : Colors.green),
      ),
    );
  }
}
