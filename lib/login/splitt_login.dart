import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splittingapp/login/split_signup.dart';

import 'Split_home.dart';

class Sp_login extends StatefulWidget {
  const Sp_login({super.key});

  @override
  State<Sp_login> createState() => _Sp_loginState();
}

class _Sp_loginState extends State<Sp_login> {
  final formkey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  String id = "";
  void spLogin() async {
    final user = await FirebaseFirestore.instance
        .collection('Register')
        .where('email', isEqualTo: email.text)
        .where('password', isEqualTo: password.text)
        .get();
    if (user.docs.isNotEmpty) {
      id = user.docs[0].id;

      SharedPreferences data = await SharedPreferences.getInstance();
      data.setString('id', id);

      Navigator.push(context, MaterialPageRoute(
        builder: (context) {
          return Sp_home();
        },
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
        "Email and password invalid",
        style: TextStyle(color: Colors.red),
      )));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Login",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty email !";
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Email"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                TextFormField(
                  controller: password,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty password !";
                    }
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Password"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      spLogin();
                    }
                  },
                  child: Text("Login"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Sp_signup()));
                    },
                    child: Text(
                      "Signup",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Colors.black),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
