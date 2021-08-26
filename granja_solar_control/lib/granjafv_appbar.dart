import 'package:flutter/material.dart';
import 'package:granjasolarcontrol/consorcio_image.dart';
import 'gradient_back.dart';
import 'solar_image.dart';


class GranjafvAppbar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Stack(
      children: <Widget>[
        GradientBack("Granjas Solares Control Obra"),
        ConsorcioImage('assets/images/consorcio_logo.jpg'),
        SolarImage('assets/images/solar-2796471_1920.jpg')
      ],
    );
  }

}