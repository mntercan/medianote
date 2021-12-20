import 'package:flutter/material.dart';
import 'screen/home.dart';

import 'package:firebase_core/firebase_core.dart';


void main() async {
WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
   
  runApp(App());
}

class App extends StatelessWidget {
  final String title = "Media Note";
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: HomePage(),
    );
  }
}
