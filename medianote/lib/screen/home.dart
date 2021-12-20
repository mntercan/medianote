import 'package:flutter/material.dart';
import 'package:medianote/screen/calendar.dart';
import 'package:medianote/util/widgets.dart';
import 'notes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentTab = 0;
  final List screens = [HomePage(), "sa", NotePage(), HomePage()];
  var currentScreen = HomePage();
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //AppBar
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
          color: Colors.black,
        ),
        title: const Text(
          "Anasayfa",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),


      backgroundColor: const Color(0xfff1f2f2),

      body: PageStorage(
        bucket: bucket,
        child: createHomePage(),
      ),

      //FAB
      floatingActionButton: FloatingActionButton(
        child: Image(
          image: AssetImage("assets/logo.png"),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.lightBlue,
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildNav(),
    );
  }



//BuildNav 
  _buildNav() {
    return BottomAppBar(
      shape: CircularNotchedRectangle(),
      child: Container(
        height: 60,
        padding: EdgeInsets.all(10),
        child: Row(
          children: <Widget>[
            MaterialButton(
              child: Column(
                children: <Widget>[Icon(Icons.home)],
              ),
              minWidth: 75,
              onPressed: () {
                setState(() {});
              },
            ),
            MaterialButton(
              child: Column(
                children: <Widget>[Icon(Icons.note)],
              ),
              minWidth: 75,
              onPressed: () {
                setState(() {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NotePage()));
                });
              },
            ),
            SizedBox(
              width: 70,
            ),
            MaterialButton(
              child: Column(
                children: <Widget>[Icon(Icons.home_work)],
              ),
              minWidth: 75,
              onPressed: () {
                setState(() {});
              },
            ),
            MaterialButton(
              child: Column(
                children: <Widget>[
                  Icon(Icons.calendar_today),
                ],
              ),
              minWidth: 75,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CalendarPage()));
              },
            ),
          ],
        ),
      ),
    );
  }

  createHomePage() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
                image: AssetImage('assets/logo.png'),
                height: 150.0,
                width: 150.0,
                fit: BoxFit.cover),
          ],
        ),
        Container(
          padding: EdgeInsets.all(8),
          child: Card(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    "Bildirimler",
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ),
                HomeNotification(title: "test", content: "content"),
                HomeNotification(title: "test", content: "content"),
                HomeNotification(title: "test", content: "content"),
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "25 Ekim",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "Bugünün aktivitesi",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(4),
                        child: Text(
                          "Halısaha",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text(
                          "Hatırlatıcı",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.all(4),
                          child: Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Container(
                                  width: 15.0,
                                  height: 15.0,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Container(
                                  width: 15.0,
                                  height: 15.0,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Container(
                                  width: 15.0,
                                  height: 15.0,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Container(
                                  width: 15.0,
                                  height: 15.0,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Container(
                                  width: 15.0,
                                  height: 15.0,
                                  decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(4),
                                child: Text("4/5"),
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(4),
                              child: Text("4/5"),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              child: Text("Akşam Halısaha"),
                            ),
                            Container(
                              padding: EdgeInsets.all(4),
                              child: Text("19.00"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ],
    );
  }
}


