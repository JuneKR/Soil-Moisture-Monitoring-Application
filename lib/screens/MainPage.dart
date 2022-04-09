import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/widget/HeaderWidget.dart';
import 'package:project/widget/ButtonWidget.dart';
import 'package:project/screens/DashBoard.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPage createState() => _MainPage();
}

class _MainPage extends State<MainPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) => Scaffold(
    key: scaffoldKey,
    /* Display AppBar */
    // appBar: AppBar(
    //   title: Text(MyApp.title),
    //   centerTitle: true,
    // ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // HeaderWidget(title: 'ดิน'),
          Image.asset(
            'assets/images/logo.png',
            height: 350,
            width: 350,
          ),
          ButtonWidget(
            text: 'click to start',
            onClicked: () => Navigator.pushNamed(context, '/dashboard'),
            // onClicked: () => Navigator.push(
            //   context,
            //   MaterialPageRoute(builder: (context) => SecondScreen()),
            //   // '/a'
            // ),
          ),
        ],
      )
    )
  );
}

// class FirstScreen extends StatelessWidget {
//   const FirstScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//         backgroundColor: Colors.green,
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             // Navigate to the second screen using a named route.
//             Navigator.pushNamed(context, '/second');
//           },
//           child: const Text('About us')
//         ),
//       ),
//     );
//   }
// }
