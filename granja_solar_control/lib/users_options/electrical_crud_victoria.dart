import 'package:flutter/material.dart';

class ElectricalCrudVictoria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Colors.green,
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.edit)),
                Tab(icon: Icon(Icons.category_rounded)),
                Tab(icon: Icon(Icons.construction_sharp)),
              ],
            ),
            title: Text('Programación-Materiales-Reporte'),
          ),
          body: TabBarView(
            children: [
              Icon(Icons.edit),
              Icon(Icons.file_upload),
              Icon(Icons.equalizer),
            ],
          ),
        ),
      ),
    );
  }
}