import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/totales.dart';

class TotalesLavictoria extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Totales La Victoria'),
      ),
      body: TotalList()
    );
  }
}

class TotalList extends StatefulWidget {
  @override
  _TotalListState createState() => _TotalListState();
}

class _TotalListState extends State<TotalList> {
  _TotalListState();
  final Firestore db = Firestore.instance;
  List<TotAles> details = [];

  @override
  void initState() {
    getDetailsList().then((data) {
      setState(() {
        details = data;
      });
    });
  super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: (details!= null)? details.length : 0,
        itemBuilder: (context, position){
          String sub='cantidad_total:${details[position].cantidad_total} - unidad:${details[position].unidad}';
           return ListTile(
             leading: CircleAvatar(
              backgroundColor: Theme.of(context).highlightColor,
               child: Text(details[position].item)
             ),

              title: Text(details[position].descripcion),
              subtitle: Text(sub),
          );
    },
    );
     }

//}

  Future<List<TotAles>> getDetailsList() async {
    var data = await db.collection('totales').getDocuments();
    int i = 0;
    if (data != null) {
      details =
          data.documents.map((document) => TotAles.fromMap(document)).toList();
      details.forEach((detail) {
        detail.id = data.documents[i].documentID;
        i++;
      });
    }
    return details;
  }
}