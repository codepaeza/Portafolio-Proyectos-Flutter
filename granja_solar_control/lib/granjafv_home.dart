
import 'package:flutter/material.dart';
import 'package:granjasolarcontrol/models/solar_projects.dart';
import 'package:granjasolarcontrol/screens/list_projects.dart';
import 'granjafv_appbar.dart';
import 'graphics/graphic_start.dart';
import './map_use/map_screen.dart';


class GranjafvHome extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GranjafvHome();
  }

}

class _GranjafvHome extends State<GranjafvHome>{
  int indexTap=0;

  final List<Widget> widgetsChildren=[
    GranjafvAppbar(),
    MapScreen(),
    //ListProjects(),
    //TotalesLavictoria(),
    GraphicStart(),

  ];
  void onTapTapped(int index){
    setState(() {
      indexTap=index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: widgetsChildren[indexTap],
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.white,
              primaryColor: Colors.green
          ),
          child: BottomNavigationBar(
              onTap: onTapTapped,
              currentIndex: indexTap,
              items:[
                BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    title: Text("")
                ),
                BottomNavigationBarItem(
                    icon: Icon(Icons.navigation),
                    title: Text("")
                ),
                //BottomNavigationBarItem(
                   // icon: Icon(Icons.list),
                    //title: Text("")
                //),
                BottomNavigationBarItem(
                    icon: Icon(Icons.pie_chart),
                    title: Text("")
                ),

              ]
          )
      ),
    );
  }

}