import '../models/favorite.dart';
import '../shared/firestore_helper.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/event_detail.dart';
import 'login_screen.dart';
import '../shared/authentication.dart';

class EventScreen extends StatelessWidget {
  final String uid;
  EventScreen(this.uid);
  @override
  Widget build(BuildContext context) {
    Authentication auth = new Authentication();
    return Scaffold(
        appBar: AppBar(
          title: Text('Event'),
          actions:[
            IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: () {
                auth.signOut().then((result) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginScreen()));
                });
              },
            )
          ],
        ),
        body: EventList(uid)
    );
  }
}

class EventList extends StatefulWidget {
  final String uid;
  EventList(this.uid);
  @override
  _EventListState createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  //final String uid;
  _EventListState();
  final Firestore db = Firestore.instance;
  List<EventDetail> details = [];
  List<Favorite> favorites = [];
  @override
  void initState() {
    getDetailsList().then((data){
      setState(() {
        details = data;
      });
    });
    FirestoreHelper.getUserFavorites(widget.uid).then((data){
      setState(() {
        favorites = data;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: (details!= null)? details.length : 0,
      itemBuilder: (context, position){
        String sub='Date: ${details[position].date} - Start: ${details[position].startTime} - End: ${details[position].endTime}';
        Color starColor = (isUserFavorite(details[position].id)?Colors.amber:Colors.grey);
        return ListTile(
          title: Text(details[position].description),
          subtitle: Text(sub),
          trailing: IconButton(
            icon: Icon(Icons.star, color: starColor),
            onPressed: () {toggleFavorite(details[position]);},
          ),
        );
      },
    );
  }

  Future<List<EventDetail>> getDetailsList() async {
    var data = await db.collection('event_details').getDocuments();
    int i = 0;
    if (data!= null) {
      details = data.documents.map((document)=> EventDetail.fromMap(document)).toList();
      details.forEach((detail){
        detail.id = data.documents[i].documentID;
        i++;
      });
    }
    return details;

  }

  toggleFavorite(EventDetail ed) async{
    if (isUserFavorite(ed.id)) {
      Favorite favorite = favorites
          .firstWhere((Favorite f) => (f.eventId == ed.id));
      String favId = favorite.id;
      await FirestoreHelper.deleteFavorite(favId);
    }
    else {
      await FirestoreHelper.addFavorite(ed, widget.uid);
    }
    List<Favorite> updatedFavorites = await FirestoreHelper.getUserFavorites(widget.uid);
    setState(() {
      favorites = updatedFavorites;
    });
  }

  bool isUserFavorite (String eventId) {
    Favorite favorite = favorites
        .firstWhere((Favorite f) => (f.eventId == eventId),
        orElse: () => null  );

    if (favorite==null)
      return false;
    else
      return true;
  }
}