import 'package:flutter/material.dart';
import 'package:splittingapp/login/settle%20debts.dart';

class Addbill extends StatefulWidget {
  final List<String> selectedIndividuals;

  Addbill({required this.selectedIndividuals});

  @override
  _AddbillState createState() => _AddbillState();
}

class _AddbillState extends State<Addbill> {
  double totalAmount = 0.0;

  void _splitBill() {
    double splitAmount = totalAmount / widget.selectedIndividuals.length;

    List<Map<String, dynamic>> debts =
        widget.selectedIndividuals.map((individual) {
      return {
        'name': individual,
        'amount': splitAmount,
        'settled': false,
      };
    }).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SettleDebts(debts: debts),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        toolbarHeight: 100,
        title: Text("Add Bill"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Selected Individuals:"),
            ...widget.selectedIndividuals
                .map((individual) => Text(individual))
                .toList(),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: "Total Bill Amount",

              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                totalAmount = double.parse(value);
              },
            ),
            SizedBox(height: 20),
            ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: Colors.white,foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
              onPressed: _splitBill,
              child: Text("Split Bill"),
            ),
          ],
        ),
      ),
    );
  }
}
