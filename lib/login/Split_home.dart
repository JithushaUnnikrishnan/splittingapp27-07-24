import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'addbill.dart';

class Sp_home extends StatefulWidget {
  const Sp_home({super.key});

  @override
  State<Sp_home> createState() => _Sp_homeState();
}

class _Sp_homeState extends State<Sp_home> {
  Map<String, bool> selectedIndividuals = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        toolbarHeight: 100,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Home"),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white,foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                List<String> selectedList = selectedIndividuals.keys
                    .where((key) => selectedIndividuals[key]!)
                    .toList();
                if (selectedList.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Addbill(selectedIndividuals: selectedList),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("Please select at least one individual")),
                  );
                }
              },
              child: Text("Add Bill"),
            ),
          ],
        ),
      ),
      body: FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection("Register").get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.greenAccent,
              ),
            );
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          final split = snapshot.data?.docs ?? [];
          return ListView.builder(
            itemCount: split.length,
            itemBuilder: (context, index) {
              final doc = split[index];
              final name = doc["name"];

              if (!selectedIndividuals.containsKey(name)) {
                selectedIndividuals[name] = false;
              }
              return Card(
                child: ListTile(
                  leading: Text(name,style: TextStyle(fontSize: 16),),
                  trailing: Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.greenAccent,
                    value: selectedIndividuals[name],
                    onChanged: (bool? value) {
                      setState(() {
                        selectedIndividuals[name] = value!;
                      });
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
