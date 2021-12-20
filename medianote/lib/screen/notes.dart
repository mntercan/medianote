import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:medianote/model/note.dart';
import 'package:medianote/screen/add_drawnote.dart';
import 'package:medianote/screen/addnote.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:medianote/screen/home.dart';
import 'package:medianote/screen/note_detail.dart';
import 'package:medianote/screen/textNotes.dart';
import 'package:medianote/util/widgets.dart';
import 'note_select.dart';




class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  _NotePageState createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: Padding(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AddNoteSelect()));
            },
            child: Icon(Icons.add),
            backgroundColor: Color(0xff03DAC5),
          ),
        ),
        appBar: AppBar(
          bottom: TabBar(
            unselectedLabelColor: Color(0xff03DAC5),
            indicatorSize: TabBarIndicatorSize.tab,
            indicator: BubbleTabIndicator(
              indicatorHeight: 25.0,
              indicatorColor: Color(0xff03DAC5),
              tabBarIndicatorSize: TabBarIndicatorSize.tab,
            ),
            tabs: [
              Tab(
                text: "Yazılı Notlar",
              ),
              Tab(
                text: "Çizili Notlar",
              ),
            ],
          ),
          leading: GestureDetector(
            child: Icon(Icons.arrow_back),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  print("Kategori");
                },
                child: Icon(Icons.category),
              ),
            )
          ],
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          title: const Text(
            "Notlar",
            style: TextStyle(color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: TabBarView(
          children: [TextNotes(), AddDraw()],
        ),
      ),
    );
  }
}


class AddDraw extends StatelessWidget {
  const AddDraw({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>AddDrawNote()));}, child: Text("Git"))),
    );
  }
}

