import 'dart:async';
import 'package:flutter/material.dart';
import 'package:time/currenttime.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.green,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CurrentTime(1),
              CurrentTime(2),
              CurrentTime(3)
            ],
          )));
  }
}