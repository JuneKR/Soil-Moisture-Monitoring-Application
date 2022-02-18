import 'package:flutter/material.dart';
import 'package:project/widget/HeaderWidget.dart';
import 'package:project/widget/ButtonWidget.dart';
import 'package:project/screens/ThirdScreen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HeaderWidget(title: 'ดิน'),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Tree 1',
              onClicked: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ThirdScreen()),
              ),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Tree 2',
              onClicked: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              ),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Tree 3',
              onClicked: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              ),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'About us',
              onClicked: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondScreen()),
              ),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: '< Home',
              onClicked: () => Navigator.pop(context),
            ),
          ],
        )
      ),
    );
  }
}