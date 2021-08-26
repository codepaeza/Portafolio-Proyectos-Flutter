import 'package:flutter/material.dart';
import 'package:vertical_card_pager/vertical_card_pager.dart';
import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:xplorandom/models/plan_details.dart';
import 'package:xplorandom/ui/plan_details_screen.dart';


/*
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final PlanDetailsReference = FirebaseDatabase.instance.reference().child('girardot100'); //Linea agregada 12 ago 2021

class _MyHomePageState extends State<MyHomePage> {
  List<PlanDetails> items;  //Linea agregada 12 ago 2021

  @override
  Widget build(BuildContext context) {

    //ListView.builder( //agregado 12 ago 2021
     // itemCount: items.length,//agregado 12 ago 2021
      //  itemBuilder: (context, index) { //agregado 12 ago 2021
       //   final item = items[index]; //agregado 12 ago 2021

          final List<String> titles = [
            //'${items[index].Plan}' //agregado 12 ago 202

            "PLAN 1",
            "PLAN 2",
            "PLAN 3",
            "PLAN 4",
            "PLAN 5",
            "PLAN 6",
          ];
        }
    );
    final List<Widget> images = [
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.black,
      ),
      Container(
        color: Colors.cyan,
      ),
      Container(
        color: Colors.blue,
      ),
      Container(
        color: Colors.grey,
      ),
    ];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: VerticalCardPager(
                  textStyle: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  titles: titles,
                  images: images,
                  onPageChanged: (page) {},
                  align: ALIGN.CENTER,
                  onSelectedItem: (index) {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

*/
