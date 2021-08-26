import 'package:covdistancia_app/blue_botton.dart';
import 'package:covdistancia_app/covid_appbar.dart';
import 'package:covdistancia_app/covid_icon_list.dart';
import 'package:covdistancia_app/covid_image.dart';
import 'package:flutter/material.dart';

class CovidPrincipal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[

            CovidAppBar(),
            CovidImage(),
            CovidIconList(),
            ],
        );


  }

}