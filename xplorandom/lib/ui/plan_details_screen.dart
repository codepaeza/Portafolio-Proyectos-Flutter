import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

import 'package:xplorandom/models/plan_details.dart';

class PlanDetailsScreen extends StatefulWidget {
  final PlanDetails planDetails;
  PlanDetailsScreen(this.planDetails);

  @override
  State<StatefulWidget> createState() => new _PlanDetailsScreenState();
}

final planDetailsReference = FirebaseDatabase.instance.reference().child('girardot100');

class _PlanDetailsScreenState extends State<PlanDetailsScreen> {
  TextEditingController _titleController;
  TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();

    _titleController = new TextEditingController(text: widget.planDetails.Plan);
    _descriptionController = new TextEditingController(text: widget.planDetails.Precio);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalles de Plan')),
      body: Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Plan'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Precio'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            RaisedButton(
              child: (widget.planDetails.Id != null) ? Text('Update') : Text('Add'),
              onPressed: () {
                if (widget.planDetails.Id != null) {
                  planDetailsReference.child(widget.planDetails.Id).set({
                    'Plan': _titleController.text,
                    'Precio': _descriptionController.text
                  }).then((_) {
                    Navigator.pop(context);
                  });
                } else {
                  planDetailsReference.push().set({
                    'Plan': _titleController.text,
                    'Precio': _descriptionController.text
                  }).then((_) {
                    Navigator.pop(context);
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}