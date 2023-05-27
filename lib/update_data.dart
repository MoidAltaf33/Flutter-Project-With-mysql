import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class update_record extends StatefulWidget {
  String name;
  String email;
  String cnic;
  String phone;
  String password;
  update_record(this.name, this.email, this.cnic, this.phone, this.password);
  @override
  State<update_record> createState() => _update_record();
}

class _update_record extends State<update_record> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController cnic = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> updaterecord() async {
    try {
      String uri = "http://localhost/Flutter_Project_API/update_records.php";
      var request = await http.post(Uri.parse(uri), body: {
        "name": name.text,
        "email": email.text,
        "cnic": cnic.text,
        "phone": phone.text,
        "password": password.text
      });
      var response = jsonDecode(request.body);
      if (response["success"] == "true") {
        print("Record Updated Successfully");
      } else {
        print("Some issue in Update.");
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState

    name.text = widget.name;
    email.text = widget.email;
    cnic.text = widget.cnic;
    phone.text = widget.phone;
    password.text = widget.password;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UPDATE Record"),
      ),
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
              updaterecord();
            },
            child: Text('UPDATE'),
          ),
        ),
      ]),
    );
  }
}
