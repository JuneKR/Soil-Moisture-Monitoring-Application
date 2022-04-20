import 'package:flutter/material.dart';
import 'package:project/main.dart';
import 'package:project/screens/DashBoard.dart';
import 'package:project/widget/HeaderWidget.dart';
import 'package:project/widget/ButtonWidget.dart';
import 'package:getwidget/getwidget.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

// Might Apply GetData.dart to this page since click update button but is doen't load or update data in screen

class Tree1Page extends StatelessWidget {
  // var Tree1Page({Key? key}) : super(key: key);

  /* Get Data */
  // void initState() {
    // super.initState();
    // initState();
    // readData();
  // }
  // readData();

  // bool isLoading = true;
  // List<String> list = [];
  String moisture = "";
  String percentMoisture = "";
  double doubleMoisture = 0;
  Future<void> readData() async {

    // Please replace the Database URL
    // which we will get in “Add Realtime Database”
    // step with DatabaseURL

    var url = "https://soil-moisture-monitoring-app-default-rtdb.firebaseio.com/"+"data.json";
    // Do not remove “data.json”,keep it as it is
    try {
      final response = await http.get(Uri.parse(url));
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      extractedData.forEach((blogId, blogData) {
        // list.add(blogData["moisture"]);
        // moisture.gcd(blogData["moisture"]);
        moisture = blogData["moisture"];
        doubleMoisture = int.parse(moisture).toDouble()/100;
        percentMoisture = moisture+"%";
        print(doubleMoisture);
        print(blogData["moisture"]);
        print(percentMoisture);
      });
      // setState(() {
      //   isLoading = false;
      // });
    } catch (error) {
      throw error;
    }
  }
  /* End Get Data */


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
                percentage: 0.50,
                // percentage: doubleMoisture,
                lineHeight: 30,
                child: Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 5),
                  // child: Text(percentMoisture, textAlign: TextAlign.end,
                  //   style: TextStyle(fontSize: 17, color: Colors.white),
                  // ),
                  child: Text(moisture.toString(), textAlign: TextAlign.end,
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                ),
                backgroundColor: Colors.black26,
                progressBarColor: Colors.green,
              ),

              /* Soil Moisture Status */
              const Text(
                'Soil Moisture Is Relatively Low',
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.normal),
              ),

              /* Should Return Watering Status -> Failed water not enough or success */
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                  onPressed: readData,
                  child: const Text(
                    "UPDATE MOISTURE CONTENT",
                    style: TextStyle(color: Colors.white),
                    textAlign: TextAlign.center,
                  )),
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