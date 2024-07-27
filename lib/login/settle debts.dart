import 'package:flutter/material.dart';

class SettleDebts extends StatefulWidget {
  final List<Map<String, dynamic>> debts;

  SettleDebts({required this.debts});

  @override
  _SettleDebtsState createState() => _SettleDebtsState();
}

class _SettleDebtsState extends State<SettleDebts> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.greenAccent,
        toolbarHeight: 100,
      ),
      body: ListView.builder(
        itemCount: widget.debts.length,
        itemBuilder: (context, index) {
          final debt = widget.debts[index];
          return Card(
            child: ListTile(
              leading: Text(debt['name'],style: TextStyle(fontSize: 16),),
              title: Text("Amount: \$${debt['amount'].toStringAsFixed(2)}"),

            ),
          );
        },
      ),
    );
  }
}
