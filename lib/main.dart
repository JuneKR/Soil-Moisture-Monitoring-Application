import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/screens/MainPage.dart';
import 'package:project/screens/DashBoard.dart';
import 'package:project/screens/Tree1Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static final String title = 'Soil Moisture Monitoring App';

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primaryColor: Colors.blue),
    home: MainPage(),
    routes: <String, WidgetBuilder> {
      '/main': (BuildContext context) => MainPage(),
      '/dashboard': (BuildContext context) => DashBoard(),
      '/tree1': (BuildContext context) => Tree1Page(),

    }
  );
}
