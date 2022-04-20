import 'package:firebase_database/firebase_database.dart';
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
  String title = "";
  // int status = 1;
  /* */

  Future<int> updateData(int status) async {
    // *Get data in var and use to update in body
    // var url = "https://soil-moisture-monitoring-app-default-rtdb.firebaseio.com/"+"data.json";
    // var url = "https://soil-moisture-monitoring-app-default-rtdb.firebaseio.com/data/-N04NCXD8qzJr_LsX9jp"+"data.json";
    var url = "https://soil-moisture-monitoring-app-default-rtdb.firebaseio.com/"+"data.json";
    //var url = "https://soil-moisture-monitoring-app-default-rtdb.firebaseio.com/data/"+"-N04LcBAaztrcTNA3Qw0/"+"data.json";
    // try {
    //   final response = await http.put(Uri.parse(url),
    //       body: jsonEncode({"pump":status}));
    // } catch (er) {}
    // print(url);
    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      // body: json.encode({'moisture':'90', 'pump':status,'title':'Tree1'})
        body: json.encode({"-N05Fojqfmw5eicFHwQ8": {'moisture':moisture, "pump":status, 'title': title}})
      // body: jsonEncode(<String, int>{
      //   'pump': 1,
      // }),
    );
    // print(response);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update.');
    }

    return 0;
  }

  updateData2(){
    var url = "https://soil-moisture-monitoring-app-default-rtdb.firebaseio.com/"+"data.json";
    var url2 = "https://soil-moisture-monitoring-app-default-rtdb.firebaseio.com/"+"data.json";
    var url3 = "https://soil-moisture-monitoring-app-default-rtdb.firebaseio.com/data/-N04NCXD8qzJr_LsX9jp/"+"data.json";
    print(url3);
    print(Uri.parse(url2));
    // vlRef = FirebaseDatabase.instance.reference().child("Volunteers/Aadithya");
    // vlRef.update({
    //   "Contributions": int.parse(count)+1,
    // }).then((_) {
    //
    // }).catchError((onError) {
    //   Scaffold.of(context).showSnackBar(SnackBar(content: Text(onError)));
    // });
  }

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
        title = blogData["title"];
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
              : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    height: 150,
                    width: 150,
                  ),
                  const Text(
                    'Soil moisture of your TREE',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 10),
                  GFProgressBar(
                    percentage: doubleMoisture,
                    lineHeight: 30,
                    child: Padding(
                      padding: EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(percentMoisture, textAlign: TextAlign.end,
                        style: TextStyle(fontSize: 17, color: Colors.white),
                      ),
                      ),
                    backgroundColor: Colors.black26,
                    progressBarColor: Colors.green,
                    ),
                  const SizedBox(height: 10),
                  /* Soil Moisture Status */
                  // const Text(
                  //   'Soil Moisture Is Relatively Low',
                  //   textAlign: TextAlign.center,
                  //   overflow: TextOverflow.ellipsis,
                  //   style: TextStyle(fontWeight: FontWeight.normal),
                  // ),
                  const Text(
                    'Soil Moisture Status',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  const SizedBox(height: 10),
                  /* Should Return Watering Status -> Failed water not enough or success */
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    style:ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                              side: BorderSide(color: Colors.green)
                          )
                      )
                    ),
                    onPressed: () => updateData(1),
                    child: const Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Text(
                        "PRESS TO WATER THE PLANTS",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style:ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)
                        ),
                      ),
                    ),
                    onPressed: () => updateData(0),
                    child: const Padding(padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                      child: Text(
                        "PRESS TO STOP WATER",
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Watering will stop automatically when soil moisture reaches 100%',
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
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
                ],)
        )
      ),
    );
  }
}
