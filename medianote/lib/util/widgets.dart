import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medianote/screen/note_detail.dart';
import 'package:medianote/screen/notes.dart';

class HomeNotification extends StatelessWidget {
  const HomeNotification({Key? key, required this.title, required this.content})
      : super(key: key);
  final String? title;
  final String? content;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: SizedBox(
        child: Row(
          children: <Widget>[
            Icon(
              Icons.home_work,
              size: 32,
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Text(
                title.toString(),
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6),
              child: Text(content.toString()),
            ),
          ],
        ),
      ),
    );
  }
}

getNotesList() {
  return StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance
        .collection('notes')
        .orderBy('created_at', descending: true)
        .snapshots(),
    builder: (context, snapshot) {
      if (snapshot.hasData) {
        return Expanded(
            child: ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  DocumentSnapshot doc = snapshot.data!.docs[index];
                  List notes = [doc['title'], doc['content'], doc['category']];
                  return NoteCard(
                    title: doc['title'],
                    content: doc['content'],
                    note_category: doc['category'],
                    noteList: notes,
                  );
                }));
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    },
  );
}

class NoteCard extends StatelessWidget {
  const NoteCard(
      {Key? key,
      required this.title,
      required this.content,
      required this.note_category,
      required this.noteList})
      : super(key: key);
  final String title;
  final String content;
  final String note_category;
  final List noteList;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NoteDetailPage(note: noteList),
              ));
        },
        child: Container(
          child: Card(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 60,
                        color: Color(0xff03DAC5),
                        child: Text(note_category),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 80,
                    width: 390,
                    child: Text(content),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
