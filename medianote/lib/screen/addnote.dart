import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_quill/widgets/controller.dart';
import 'package:flutter_quill/widgets/editor.dart';
import 'package:flutter_quill/widgets/toolbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medianote/model/note.dart';
import 'package:medianote/screen/notes.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  _AddNotePageState createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Not Ekle",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: AddNote(),
    );
  }
}

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  final _formKey = GlobalKey<FormState>();
  String category = "Biyoloji";
  QuillController _controller = QuillController.basic();
  TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),

                icon: Icon(Icons.title),
                hintText: 'Başlık',
                labelText: 'Başlık',
              ),
              controller: titleController,
              
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Expanded(
                  child: Container(
                padding: EdgeInsets.all(16),
                child: QuillEditor.basic(
                  controller: _controller,
                  readOnly: false, // true for view only mode
                ),
              )),
            ),
            QuillToolbar.basic(controller: _controller,locale: const Locale('tr'),),
       
            DropdownButton<String>(
              value: category,
              items: <String>['Biyoloji', 'Matematik', 'Kimya', 'Fizik']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (_) {
                setState(() {
                  category = _.toString();
                });
              },
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: ConstrainedBox(
                constraints: BoxConstraints.tightFor(width: 300, height: 50),
                child: ElevatedButton(
                  onPressed: () {
                   
                    if (_formKey.currentState!.validate()) {
                      var json =
                          jsonEncode(_controller.document.toDelta().toJson());
                      Note(category,titleController.text,json,"Melih",Timestamp.now(),Timestamp.now()).addNote();
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => NotePage()));
                    
                    }
                  },
                  child: const Text('Notu Kaydet'),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
