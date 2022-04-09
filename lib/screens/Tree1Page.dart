import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/screens/DashBoard.dart';
import 'package:project/widget/HeaderWidget.dart';
import 'package:project/widget/ButtonWidget.dart';
import 'package:getwidget/getwidget.dart';

class Tree1Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
    /* Display AppBar */
    // appBar: AppBar(
    //   title: const Text('Tree 1'),
    //   centerTitle: true,
    // ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: 150,
                width: 150,
              ),
              // const HeaderWidget(title: 'ดิน'),
              const Text(
                'Soil moisture of TREE 1',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              GFProgressBar(
                percentage: 0.33,
                lineHeight: 30,
                child: const Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  child: Text('33%', textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
                backgroundColor: Colors.black26,
                progressBarColor: Colors.amber,
              ),

              /* Soil Moisture Status */
              const Text(
                'Soil Moisture Is Relatively Low',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.normal),
              ),

              /* Should Return Watering Status -> Failed water not enough or success */
              const SizedBox(height: 24),
              ButtonWidget(
                text: 'PRESS TO WATER THE PLANTS',
                onClicked: () => Navigator.pushNamed(context,''),
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                text: 'PRESS TO STOP WATER',
                onClicked: () => Navigator.pushNamed(context,''),
              ),
              const Text(
                'Watering will stop automatically when soil moisture reaches 100%',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.normal),
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                text: '< Home',
                onClicked: () => Navigator.pushNamed(context, '/main'),
              ),
              const SizedBox(height: 24),
              ButtonWidget(
                text: '< Back',
                onClicked: () => Navigator.pop(context),
              ),
            ],
          )
      )
  );
}