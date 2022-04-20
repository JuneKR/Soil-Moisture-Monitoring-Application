import 'package:flutter/material.dart';
import 'package:project/screens/AddTree.dart';
import 'package:project/widget/HeaderWidget.dart';
import 'package:project/widget/ButtonWidget.dart';
import 'package:project/screens/Tree1Page.dart';


class DashBoard extends StatelessWidget {
  const DashBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* Display AppBar */
      // appBar: AppBar(
      //   title: const Text('Dashboard'),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              height: 150,
              width: 150,
            ),
            // const HeaderWidget(title: 'ดิน'),
            const Text(
              'CHOOSE YOUR TREE',
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Tree',
              onClicked: () => Navigator.pushNamed(context, '/tree'),
              // onClicked: () => Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Tree1Page()),
              // ),
            ),
            // const SizedBox(height: 24),
            // ButtonWidget(
            //   text: 'Tree 2',
            //   onClicked: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => DashBoard()),
            //   ),
            // ),
            // const SizedBox(height: 24),
            // ButtonWidget(
            //   text: 'Tree 3',
            //   onClicked: () => Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => DashBoard()),
            //   ),
            // ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Add Tree',
              onClicked: () => Navigator.pushNamed(context, '/add'),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'About us',
              onClicked: () => Navigator.pushNamed(context, '/about'),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: '< Home',
              onClicked: () => Navigator.pushNamed(context, '/main'),
            )
          ],
        )
      ),
    );
  }
}

