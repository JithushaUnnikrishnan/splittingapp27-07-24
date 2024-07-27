import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:splittingapp/login/splitt_login.dart';

class Sp_signup extends StatefulWidget {
  const Sp_signup({super.key});

  @override
  State<Sp_signup> createState() => _Sp_sugnupState();
}

class _Sp_sugnupState extends State<Sp_signup> {

  final formkey = GlobalKey<FormState>();
  var name = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var phone = TextEditingController();
  Future<dynamic> SplitReg() async {
    await FirebaseFirestore.instance.collection("Register").add({
      "name": name.text,
      "password": password.text,
      "phone": phone.text,
      "email": email.text
    });
    print("success");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Sp_login()));
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: Scaffold(

        body: Container(

          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Signup",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .05,
                ),
                TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty name !";
                    }
                  },
                  decoration: InputDecoration(hintText: "Name"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty email !";
                    }
                  },
                  decoration: InputDecoration(hintText: "Email"),
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
                  decoration: InputDecoration(hintText: "Password"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                TextFormField(
                  controller: phone,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Empty phone !";
                    }
                  },
                  decoration: InputDecoration(hintText: "Phone"),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .02,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()){
                      SplitReg();
                      print("done");
                   }
                  },
                  child: Text("Signup"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
