import 'package:flutter/material.dart';
import 'package:xplorandom/screens/xplorandom_int_page.dart';

import 'screens/my_home_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:xplorandom/ui/plan_details_listview.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XPLORANDOM APP',
      home: XplorandomInitPage(),
    );
  }


}
