import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/floating_action_button_green.dart';
//import 'package:cached_network_image/cached_network_image.dart';

class  CardImageWithFabIcon extends StatelessWidget {
//Para hacer genérico el widget, se declaran las variables que están hardcodeadas
  final double height; //Los datos que son requeridos deben estar en modo final
  final double width; //Los datos que son requeridos deben estar en modo final
  final double left; //Se podria poner si declararla final porque no es obligartoria en el constructor(no es @required)
  final String pathImage;
  final VoidCallback onPressedFabIcon; //Función que llama al Floating Action Button (Fab)
  final IconData iconData;
  bool internet=true;

//SE modifica el constructor, con las nuevas condiciones para hacer más genérico el Widget
  CardImageWithFabIcon({
    Key key,
    @required this.height,
    @required this.width,
    @required this.pathImage,
    @required this.onPressedFabIcon,
    @required this.iconData,
    this.left,
    this.internet,
});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    final card = Container(
      height: height,
      width: width,
      margin: EdgeInsets.only(
        //top: 80.0,
        left: left

      ),

      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
            image: NetworkImage(pathImage)   //Se tená assset image, porque se estaba tomando e la carpeta assets
          //image:internet?CachedNetworkImageProvider(pathImage):AssetImage(pathImage)  //AssetImage es la opción al leer a imagen desde el dispositivo en la aplicación - NetworkImage desde la red
        ),
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        shape: BoxShape.rectangle,
        boxShadow: <BoxShadow>[
          BoxShadow (
            color:  Colors.black38,
            blurRadius: 15.0,
            offset: Offset(0.0, 7.0)
          )
        ]

      ),
    );

    return Stack(
      alignment: Alignment(0.9,1.1),
      children: <Widget>[
        card,
        FloatingActionButtonGreen(iconData: iconData,onPressed: onPressedFabIcon,)
      ],
    );
  }

}