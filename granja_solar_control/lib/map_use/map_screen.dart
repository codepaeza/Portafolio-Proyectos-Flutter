import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:granjasolarcontrol/screens/list_projects.dart';
import '../models/solar_projects.dart';

class MapScreen extends StatefulWidget{
@override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen>{

  Completer<GoogleMapController> _controller = Completer();

  final CameraPosition position = CameraPosition(
    target: LatLng(4.696695, -74.067932),
    zoom: 5.5,
  );

  final Set<Marker> _markers = Set();

  @override
  final double _zoom = 10;
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('La Victoria-Celsia'),
        backgroundColor: Colors.green,
      ),
      body: Container(child: GoogleMap(initialCameraPosition: position, markers: _markers, mapType: MapType.normal, onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },),),
      drawer: _drawer(),
    );
  }

  Widget _drawer(){
    return Drawer(
      elevation: 16.0,
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Consorcio PGY FV"),
            //accountEmail: Text("consorcio_pgyfv@gmail.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.green,
              child: Text("2"),
            ),
            otherAccountsPictures: <Widget>[
              CircleAvatar(
                backgroundColor: Colors.green,
                child: Text("FV"),
              )
            ],
          ),
          ListTile(
            title: new Text("Granja Solar La Victoria"),
            leading: new Icon(Icons.wb_sunny),
          ),
          Divider(),
          ListTile(
            onTap: (){
              _goToLaVictoria();
              Navigator.of(context).pop();
            },
            title: new Text("Obra Eléctrica"),
            trailing: new Icon(Icons.skip_next),
            onLongPress: () {
                 Navigator.push(context, MaterialPageRoute(builder:(context)=>ListProjects()),
    );
    },),

          ListTile(
            onTap: (){
              _goToSince();
              Navigator.of(context).pop();
            },
            title: new Text("Obra Civil"),
            trailing: new Icon(Icons.skip_next),
          ),

        ],
      ),
    );
  }

  Future<void> _goToLaVictoria() async {
    double lat = 4.513011;
    double long = -76.035322;
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('eléctrica'),
          position: LatLng(lat, long),
            infoWindow: InfoWindow(title: 'Granja Solar La Victoria',  snippet: 'Propietario: Celsia')
        ),
      );

    });
  }

  Future<void> _goToSince() async {
    double lat = 4.513011;
    double long = -76.035322;

    //double lat = 9.236196;
    //double long = -75.150171;
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, long), _zoom));
    setState(() {
      _markers.add(
        Marker(
            markerId: MarkerId('Civil'),
            position: LatLng(lat, long),
            infoWindow: InfoWindow(title: 'Granja Solar La Victoria',  snippet: 'Propietario: Celsia')
        ),
      );

    });
  }
}
