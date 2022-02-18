import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/screens/SecondScreen.dart';
import 'package:project/widget/HeaderWidget.dart';
import 'package:project/widget/ButtonWidget.dart';

class ThirdScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Tree 1'),
      centerTitle: true,
    ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HeaderWidget(title: 'ดิน'),
              const SizedBox(height: 24),
              ButtonWidget(
                text: '< Home',
                onClicked: () => Navigator.pop(context),
              ),
            ],
          )
      )
  );
}