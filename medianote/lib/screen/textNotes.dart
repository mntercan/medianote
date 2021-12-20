import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medianote/util/widgets.dart';

class TextNotes extends StatefulWidget {
  const TextNotes({Key? key}) : super(key: key);

  @override
  _TextNotesState createState() => _TextNotesState();
}

class _TextNotesState extends State<TextNotes> {

  Future getNotes() async {
    var firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await firestore.collection('notes').get();
    return qn.docs;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: getNotesList()
    );
  }
}
