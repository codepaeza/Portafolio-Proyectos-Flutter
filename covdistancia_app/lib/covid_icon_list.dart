import 'package:flutter/material.dart';
import 'covid_icon.dart';

class CovidIconList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //new CovidIcon('assets/img/covid_img_2.jpg', 'El COVID-19 está presente'),
        new CovidIcon('assets/img/covid_img.jpg', 'Tomar distancia está e nuestras manos'),

      ]
    );
  }

}
