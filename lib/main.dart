import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:project/screens/FirstScreen.dart';

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
    home: FirstScreen(),
  );
}
