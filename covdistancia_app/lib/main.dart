import 'package:covdistancia_app/covid_appbar.dart';
import 'package:covdistancia_app/covid_principal.dart';
import 'package:covdistancia_app/device_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';

import 'dart:async';
import 'dart:math';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
    Widget build(BuildContext context) {
    return MaterialApp(
     // child: PrincipalCovidScreen(
      color: Colors.lightBlue,
        title: 'Covdistancia',
        home: StreamBuilder<BluetoothState>(
          stream: FlutterBlue.instance.state,
          initialData: BluetoothState.unknown,
          builder: (c, snapshot) {
           final state = snapshot.data;
            if (state == BluetoothState.on) {
             //return CovidPrincipal(
              return DeviceScan(
          //title: 'Flutter Demo Home Page'),
    );
      }
            return BluetoothOffScreen(state: state);
        }),
    );
  }
}

class BluetoothOffScreen extends StatelessWidget {
  const BluetoothOffScreen({Key key, this.state}) : super(key: key);

  final BluetoothState state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Icon(
              Icons.bluetooth_disabled,
              size: 200.0,
              color: Colors.white54,
            ),
            Text(
              'Su dispositivo Bluetooth ${state != null ? state.toString().substring(15) : 'está apagado. Enciéndalo'}.',
              style: Theme.of(context)
                  .primaryTextTheme
                  .subhead
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}