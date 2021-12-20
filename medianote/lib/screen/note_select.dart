import 'package:flutter/material.dart';

import 'add_drawnote.dart';
import 'addnote.dart';



class AddNoteSelect extends StatelessWidget {
  const AddNoteSelect({Key? key}) : super(key: key);

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
      body: Column(
        children: [
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(Icons.text_fields),
                        Text("Yazılı Not Ekle")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddNotePage()));
            },
          ),
          GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Card(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Icon(Icons.format_paint),
                        Text("Çizli Not Ekle")
                      ],
                    ),
                  ),
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddDrawNote()));
            },
          )
        ],
      ),
    );
  }
}