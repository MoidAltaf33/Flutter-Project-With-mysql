import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:project_api_moid/update_data.dart';

class view_data extends StatefulWidget {
  const view_data({super.key});

  @override
  State<view_data> createState() => _view_data();
}

class _view_data extends State<view_data> {
  List userdata = [];
  Future<void> getrecord() async {
    String uri = "http://localhost/Flutter_Project_API/view_record.php";
    try {
      var reponse = await http.get(Uri.parse(uri));
      setState(() {
        userdata = jsonDecode(reponse.body);
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteRecord(String id) async {
    try {
      String uri = "http://localhost/Flutter_Project_API/delete_records.php";
      var request = await http.post(Uri.parse(uri), body: {"id": id});
      var response = jsonDecode(request.body);
      if (response["success"] == "true") {
        print("Record delete");
      } else {
        print("Some issue in deleting the Record.");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    getrecord();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("View"),
        ),
        body: ListView.builder(
            itemCount: userdata.length,
            itemBuilder: (context, index) {
              return Card(
                margin: EdgeInsets.all(10),
                child: Column(children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => update_record(
                                userdata[index]["name"],
                                userdata[index]["email"],
                                userdata[index]["cnic"],
                                userdata[index]["phone"],
                                userdata[index]["password"]),
                          ));
                    },
                    leading: Icon(Icons.person),
                    title: Text("Name: " + userdata[index]["name"]),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        deleteRecord(userdata[index]["id"]);
                      },
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => update_record(
                                userdata[index]["name"],
                                userdata[index]["email"],
                                userdata[index]["cnic"],
                                userdata[index]["phone"],
                                userdata[index]["password"]),
                          ));
                    },
                    leading: Icon(Icons.email_rounded),
                    title: Text("Email: " + userdata[index]["email"]),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => update_record(
                                userdata[index]["name"],
                                userdata[index]["email"],
                                userdata[index]["cnic"],
                                userdata[index]["phone"],
                                userdata[index]["password"]),
                          ));
                    },
                    leading: Icon(Icons.numbers),
                    title: Text("CNIC: " + userdata[index]["cnic"]),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => update_record(
                                userdata[index]["name"],
                                userdata[index]["email"],
                                userdata[index]["cnic"],
                                userdata[index]["phone"],
                                userdata[index]["password"]),
                          ));
                    },
                    leading: Icon(Icons.lock),
                    title: Text("Password: " + userdata[index]["password"]),
                  )
                ]),
              );
            }));
  }
}
