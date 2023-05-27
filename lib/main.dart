// ignore_for_file: prefer_const_constructors, unused_import, use_key_in_widget_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_api_moid/view_data.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _Home();
}

class _Home extends State<Home> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cnic = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> insertrecord() async {
    if (name.text != '' ||
        email.text != '' ||
        cnic.text != '' ||
        phone.text != '' ||
        password.text != '') {
      try {
        String uri = "http://localhost/Flutter_Project_API/insert_records.php";
        var request = await http.post(Uri.parse(uri), body: {
          "name": name.text,
          "email": email.text,
          "cnic": cnic.text,
          "phone": phone.text,
          "password": password.text
        });
        var response = jsonDecode(request.body);
        if (response["success"] == "true") {
          print("RECORD INSERTED");
          name.text = '';
          email.text = '';
          cnic.text = '';
          phone.text = '';
          password.text = '';
        } else {
          print("There is a problem");
        }
      } catch (e) {
        print(e);
      }
    } else {
      print("Please enter all of your records");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Insert Record')),
      body: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: name,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Enter Name'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: email,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Enter Email'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: cnic,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Enter CNIC'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: phone,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Enter Phone Number'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: password,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              label: Text('Enter Password'),
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () {
              insertrecord();
            },
            child: Text('INSERT'),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: Builder(builder: (context) {
            return ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => view_data(),
                    ));
              },
              child: Text("VIEW DATA"),
            );
          }),
        ),
      ]),
    );
  }
}
