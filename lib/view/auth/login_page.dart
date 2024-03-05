import 'dart:convert';

import 'package:flutter/material.dart';

import '../home_page.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> key = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  var message = "";

  Future login() async {
    String urlLogin = "https://www.demo.shikshahive.com/api/login";
    var response = await http.post(Uri.parse(urlLogin),
        body: {"email": email.text, "password": password.text});

    var dataUser = jsonDecode(response.body);
    if (dataUser.length == 1) {
      //go to home page
      Get.to(() => HomePage());
    } else {
      //show  error message
      setState(() {
        message = "Email or Password is incorrect!";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
              key: key,
              child: Column(
                children: [
                  Text(
                    "Login",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: email,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "this field cannot be empty" : null,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      labelText: "password",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) =>
                        value!.isEmpty ? "this field cannot be empty" : null,
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    message,
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          print("Valid");
                          login();
                        } else {
                          print("Invalid");
                        }
                      },
                      child: Text("Login"))
                ],
              )),
        ),
      ),
    );
  }
}
