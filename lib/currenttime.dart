import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurrentTime extends StatefulWidget {
  int type;
  CurrentTime(this.type);
  @override
  State<StatefulWidget> createState() => TimeState(type);

}

class TimeState extends State {
  String t = "";

  String d = "";
  String h = "";
  String m = "";
  String s = "";

  String morning = "";

  int type;

  TimeState(this.type);

  @override
  void initState() {
    super.initState();
    Timer timer = Timer.periodic(const Duration(seconds: 1), (_) {
      setState(() {});
    });
  }

  String convertWeekday(int d) {
    switch (d) {
      case 1:return "Monday";
      case 2:return "Tuesday";
      case 3:return "Wednesday";
      case 4:return "Thursday";
      case 5:return "Friday";
      case 6:return "Saturday";
      case 7:return "Sunday";
    }
    return "";
  }

  getTime() {
    var now = DateTime.now();

    d = convertWeekday(now.weekday);
    h = convertAmerican(now.hour).toString().padLeft(2, '0');
    m = now.minute.toString().padLeft(2, '0');
    s = now.second.toString().padLeft(2, '0');

    t = setTime();
  }

  String setTime() {
    switch(type) {
      case 1: return "$d, $h:$m $morning";
      case 2: return "$h:$m $morning";
      case 3: return "$h:$m:$s $morning";
    }
    return "";
  }

  int convertAmerican(int h) {
    morning = h<12? "AM":"PM";
    return h%12;
}

  @override
  Widget build(BuildContext contextconst ) {
    getTime();
    return Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Text(
            t,
            style:const TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white)));
  }
}