import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:percent_indicator/percent_indicator.dart';

class GraphicStart extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title:Text("Indicadores de Avance"),
            backgroundColor: Colors.green
        ),
        body:Container(
            child:Column(
              children: <Widget>[
                Container(
                    padding: EdgeInsets.all(10),

                    child: CircularPercentIndicator( //circular progress indicator
                      header: Text("Obra Civil La Victoria", style:TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22.0),),
                      radius: 120.0, //radius for circle
                      lineWidth: 15.0, //width of circle line
                      animation: true, //animate when it shows progress indicator first
                      percent: 35.8/100, //vercentage value: 0.6 for 60% (60/100 = 0.6)
                      center: Text("35.8%",style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                      ), //center text, you can set Icon as well
                      footer: Text("Avance Físico", style:TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                      ), //footer text
                      backgroundColor: Colors.orange[100], //backround of progress bar
                      circularStrokeCap: CircularStrokeCap.round, //corner shape of progress bar at start/end
                      progressColor: Colors.lightGreen, //progress bar color
                    )
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: LinearPercentIndicator( //leaner progress bar
                    width: 200, //width for progress bar
                    animation: true, //animation to show progress at first
                    animationDuration: 10000,
                    lineHeight: 30.0, //height of progress bar
                    leading: Padding( //prefix content
                      padding: EdgeInsets.only(right:15),
                      child:Text("Presupuestal", style:TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0), //left content
                    ),
                    //trailing: Padding( //sufix content
                      //padding: EdgeInsets.only(left:15),
                      //child:Text("Eléctrica"), //right content
                    ),
                    percent: 0.106, // 30/100 = 0.3
                    center: Text("10.6%"),
                    linearStrokeCap: LinearStrokeCap.roundAll, //make round cap at start and end both
                    progressColor: Colors.blue, //percentage progress bar color
                    backgroundColor: Colors.orange[100],  //background progressbar color
                  ),
                ),



                Container(
                    padding: EdgeInsets.all(40),

                    child: CircularPercentIndicator( //circular progress indicator
                      header: Text("Obra Eléctrica La Victoria", style:TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 22.0),),
                      radius: 120.0, //radius for circle
                      lineWidth: 15.0, //width of circle line
                      animation: true, //animate when it shows progress indicator first
                      percent: 15.3/100, //vercentage value: 0.6 for 60% (60/100 = 0.6)
                      center: Text("15.3%",style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.0),
                      ), //center text, you can set Icon as well
                      footer: Text("Avance Físico", style:TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0),
                      ), //footer text
                      backgroundColor: Colors.grey[300], //backround of progress bar
                      circularStrokeCap: CircularStrokeCap.round, //corner shape of progress bar at start/end
                      progressColor: Colors.lightGreen, //progress bar color
                    )
                ),

                Container(
                  padding: EdgeInsets.all(10),
                  child: LinearPercentIndicator( //leaner progress bar
                    width: 200, //width for progress bar
                    animation: true, //animation to show progress at first
                    animationDuration: 10000,
                    lineHeight: 30.0, //height of progress bar
                    leading: Padding( //prefix content
                      padding: EdgeInsets.only(right:15),
                      child:Text("Presupuestal", style:TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.0), //left content
                    ),
                    //trailing: Padding( //sufix content
                    // padding: EdgeInsets.only(left:15),
                     // child:Text("Obra Eléctrica"), //right content
                    ),
                    percent: 0.05, // 30/100 = 0.3
                    center: Text("5.0%"),
                    linearStrokeCap: LinearStrokeCap.roundAll, //make round cap at start and end both
                    progressColor: Colors.blueAccent, //percentage progress bar color
                    backgroundColor: Colors.grey[300],  //background progressbar color
                  ),
                )


              ],
            )
        )
    );
  }

}