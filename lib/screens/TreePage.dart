import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:getwidget/getwidget.dart';

import '../widget/ButtonWidget.dart';

class TreePage extends StatefulWidget {
  const TreePage({Key? key}) : super(key: key);

  @override
  _TreePageState createState() => _TreePageState();
}

class _TreePageState extends State<TreePage> {

  @override
  void initState() {
    super.initState();
    readData();
  }

  bool isLoading = true;
  List<String> list = [];

  /* Test */
  String moisture = "";
  String percentMoisture = "0%";
  double doubleMoisture = 0;
  /* */

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
        list.add(blogData["moisture"]);
        // moisture.gcd(blogData["moisture"]);
        moisture = blogData["moisture"];
        percentMoisture = blogData["moisture"]+"%";
        doubleMoisture = double.parse(moisture)/100;
        // print(doubleMoisture);
        // print(blogData["moisture"].runtimeType);
        // print(percentMoisture);
      });
      setState(() {
        isLoading = false;
      });
    } catch (error) {
      throw error;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: isLoading
              ? const CircularProgressIndicator()
              // : ListView.builder(
              // padding: const EdgeInsets.all(8),
              // itemCount: list.length,
              // itemBuilder: (BuildContext context, int index) {
              //   return Container(
              //       height: 50,
              //       child: Center(
              //         child: Text(
              //           list[index],
              //           style: TextStyle(color: Colors.green),
              //         ),
              //       )
              //   );
              // })
              : Center(
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
                    // percentage: 0.50,
                    percentage: doubleMoisture,
                    lineHeight: 30,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(percentMoisture, textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      // child: Text(moisture.toString(), textAlign: TextAlign.end,
                      //   style: TextStyle(fontSize: 17, color: Colors.white),
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
                ],)
        )
      ),
    );
  }
}
