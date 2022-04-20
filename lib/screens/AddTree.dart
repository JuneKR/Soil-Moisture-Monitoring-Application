import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:project/widget/ButtonWidget.dart';

import '../widget/ButtonWidget.dart';

class AddTree extends StatefulWidget {
  const AddTree({Key? key}) : super(key: key);

  @override
  _AddTreeState createState() => _AddTreeState();
}

class _AddTreeState extends State<AddTree> {
  final _form = GlobalKey<FormState>();

  late String title;
  late String moisture;
  late int pump;
  
  void writeData() async {
    _form.currentState?.save();

    // Please replace the Database URL
    // which we will get in “Add Realtime
    // Database” step with DatabaseURL
    var url = "https://soil-moisture-monitoring-app-default-rtdb.firebaseio.com/"+"data.json";
    // var url = "https://soil-moisture-monitoring-app-default-rtdb.firebaseio.com/";
    // (Do not remove “data.json”,keep it as it is)
    try {
      final response = await http.post(
        Uri.parse(url),
        body: json.encode({"title": title,"moisture": moisture,"pump": pump}),
      );
      print(response);
      print(response.body);
    } catch (error) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Add Tree',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        // appBar: AppBar(
        //   title: const Text("Add Tree"),
        // ),
        body: Form(
          key: _form,
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 150,
                  width: 150,
                ),
                const SizedBox(height: 24),
                /* Form 1 */
                TextFormField(
                  decoration: const InputDecoration(hintText: "Enter Title"),
                  onSaved: (value) {
                    title = value!;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Enter Moisture Content"),
                  onSaved: (value) {
                    moisture = value!;
                    pump = 0;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: 140,
                  child: ElevatedButton(
                      style:ButtonStyle(
                          foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                          backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                  side: BorderSide(color: Colors.blue)
                              )
                          )
                      ),
                      onPressed: writeData,
                      child: const Text(
                        "SUBMIT",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                        textAlign: TextAlign.center,
                      )
                  ),
                ),

                /* End Form 1 */
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
            ),
          ),
        ),
      ),
    );
  }
}
