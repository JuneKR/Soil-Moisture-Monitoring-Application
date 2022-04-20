import 'package:flutter/material.dart';

import '../widget/ButtonWidget.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
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
              Image.asset(
                'assets/images/june.jpg',
                height: 200,
                width: 150,
              ),
              const Text('6288031 Aekkaluk Panyacharoensri'),
              const SizedBox(height: 24),
              Image.asset(
                'assets/images/champ.png',
                height: 150,
                width: 150,
              ),
              const Text('6288117 Apisith Roopsom'),
              // const SizedBox(height: 5),
            // const HeaderWidget(title: 'ดิน'),

            // const SizedBox(height: 24),
            // ButtonWidget(
            //   text: 'About us',
            //   onClicked: () => Navigator.pushNamed(context, '/about'),
            // ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: 'Home',
              onClicked: () => Navigator.pushNamed(context, '/main'),
            ),
            const SizedBox(height: 24),
            ButtonWidget(
              text: '< Back',
              onClicked: () => Navigator.pop(context),
            ),
          ],
        )
    ),
  );
}