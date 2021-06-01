import 'package:expense/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  TransactionList(this.transactions);

  final List<Transaction> transactions;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    return Container(
      height: _height,
      child: transactions.isEmpty ? Column(children: [
        Image.asset('assets/images/zzz.jpg', fit: BoxFit.cover,),
        Text('No transactions added yet!', style: TextStyle(fontSize: 20),),
      ],) : ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            elevation: 5,
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                      child: Text("\$${transactions[index].amount}")),
                ),
              ),
              title: Text(transactions[index].title, style: TextStyle(color: Colors.black, fontFamily: 'OpenSans', fontSize: 20, fontWeight: FontWeight.bold),),
              subtitle: Text(DateFormat.yMMMd().format(transactions[index].date), style: TextStyle(color: Colors.grey, ),),
            ),
          );
        },
        ),
    );
  }
}
