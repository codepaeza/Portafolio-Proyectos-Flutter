import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:granjasolarcontrol/map_use/map_screen.dart';
import 'package:granjasolarcontrol/users_options/electrical_crud_victoria.dart';
import '../models/solar_projects.dart';
import 'package:granjasolarcontrol/users_options/program_form.dart';

class ListProjects extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cantidades La Victoria'),
          backgroundColor: Colors.green,
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
  List<SolarProjects> details = [];

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
        String sub='Cantidad Total:${details[position].cantidad_total}  ${details[position].unidad}';
        return ListTile(
          leading: CircleAvatar(
              backgroundColor: Theme.of(context).highlightColor,
              child: Text(details[position].item)
          ),

          title: Text(details[position].descripcion),
          subtitle: Text(sub),
          trailing: IconButton(
            icon: Icon(Icons.queue),
            onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProgramForm(
                        )),
             );
            },
          ),

        );
      },
    );
  }

//}

  Future<List<SolarProjects>> getDetailsList() async {
    var data = await db.collection('solar_projects').getDocuments();
    int i = 0;
    if (data != null) {
      details =
          data.documents.map((document) => SolarProjects.fromMap(document)).toList();
      details.forEach((detail) {
        detail.id = data.documents[i].documentID;
        i++;
      });
    }
    return details;
  }
}