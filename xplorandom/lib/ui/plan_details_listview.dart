import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:xplorandom/models/plan_details.dart';
import 'package:xplorandom/ui/plan_details_screen.dart';

class PlanDetailsListView extends StatefulWidget {
  @override
  _PlanDetailsListViewState createState() => new _PlanDetailsListViewState();
}

final PlanDetailsReference = FirebaseDatabase.instance.reference().child('girardot100');

class _PlanDetailsListViewState extends State<PlanDetailsListView> {
  List<PlanDetails> items;
  StreamSubscription<Event> _onNoteAddedSubscription;
  StreamSubscription<Event> _onNoteChangedSubscription;

  @override
  void initState() {
    super.initState();

    items = new List();

    _onNoteAddedSubscription = planDetailsReference.onChildAdded.listen(_onPlanDetailsAdded);
    _onNoteChangedSubscription = planDetailsReference.onChildChanged.listen(_onPlanDetailsUpdated);
  }

  @override
  void dispose() {
    _onNoteAddedSubscription.cancel();
    _onNoteChangedSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'xplorandom',
      home: Scaffold(
        appBar: AppBar(
          title: Text('xplorandom'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: ListView.builder(
              itemCount: items.length,
              padding: const EdgeInsets.all(10.0),
              itemBuilder: (context, position) {
                return Column(
                  children: <Widget>[
                    Divider(height: 25.0),
                    ListTile(
                      title: Text(
                        '${items[position].Plan}',
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.deepOrangeAccent,
                        ),
                      ),
                      subtitle: Text(
                        '${items[position].Precio}',
                        style: new TextStyle(
                          fontSize: 14.0,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      leading: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(3.0)),
                          CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 20.0,
                            child: Text(
                              '${position + 1}',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          //IconButton(
                             //icon: const Icon(Icons.remove_circle_outline),
                             // onPressed: () => _deletePlanDetails(context, items[position], position)),
                        ],
                      ),
                      onTap: () => _navigateToPlanDetails(context, items[position]),
                    ),
                  ],
                );
              }),
        ),
        //floatingActionButton: FloatingActionButton(
         // child: Icon(Icons.add),
         // onPressed: () => _navigateToPlanDetails(context, items[position]),
       // ),
      ),
    );
  }

  void _onPlanDetailsAdded(Event event) {
    setState(() {
      items.add(new PlanDetails.fromSnapshot(event.snapshot));
    });
  }

  void _onPlanDetailsUpdated(Event event) {
    var oldPlanDetailsValue = items.singleWhere((planDetails) => planDetails.Id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldPlanDetailsValue)] = new PlanDetails.fromSnapshot(event.snapshot);
    });
  }

  void _deletePlanDetails(BuildContext context, PlanDetails planDetails, int position) async {
    await planDetailsReference.child(planDetails.Id).remove().then((_) {
      setState(() {
        items.removeAt(position);
      });
    });
  }

  void _navigateToPlanDetails(BuildContext context, PlanDetails planDetails) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlanDetailsScreen(planDetails)),
    );
  }

  //void _createNewPlanDetails(BuildContext context) async {
  //  await Navigator.push(
  //    context,
  //    MaterialPageRoute(builder: (context) => PlanDetailsScreen(PlanDetails(null, '', ''))),
  //  );
  //}
}
