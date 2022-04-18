import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/screens/AboutUs.dart';
import 'package:project/screens/GetData.dart';
import 'package:project/screens/MainPage.dart';
import 'package:project/screens/DashBoard.dart';
import 'package:project/screens/Tree1Page.dart';
import 'package:project/screens/AddTree.dart';
import 'package:project/screens/AboutUs.dart';
import 'package:project/screens/TreePage.dart';
// import 'package:project/FirebaseDemo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Soil Moisture Monitoring App';

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    theme: ThemeData(primaryColor: Colors.blue),
    home: const MainPage(),
    routes: <String, WidgetBuilder> {
      '/main': (BuildContext context) => const MainPage(),
      '/dashboard': (BuildContext context) => const DashBoard(),
      '/tree1': (BuildContext context) => Tree1Page(),
      '/add': (BuildContext context) => const AddTree(),
      '/about': (BuildContext context) => const AboutUs(),
      // '/demo': (BuildContext context) => FirebaseDemo(),
      '/get': (BuildContext context) => const GetData(),
      '/tree': (BuildContext context) => const TreePage(),
    }
  );
}

