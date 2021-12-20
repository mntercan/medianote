import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:medianote/screen/notes.dart';

class Note {
  late String? category;
  late String title;
  late String content;
  late String author;
  late Timestamp created_at;
  late Timestamp last_update;

  Note(String category, String title, String content, String author,
      Timestamp created_at, Timestamp last_update) {
    this.category = category;
    this.title = title;
    this.content = content;
    this.author = author;
    this.created_at = created_at;
    this.last_update = last_update;
  }

  addNote() {
    FirebaseFirestore.instance.collection('notes').add({
      'category': this.category,
      'title': this.title,
      'content': this.content,
      'author': this.author,
      'created_at': this.created_at,
      'last_update': this.last_update
    });
  }
}
