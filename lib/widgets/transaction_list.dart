import 'package:expense/models/transaction.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {

  TransactionList(this.transactions, this.deleteTx);

  final List<Transaction> transactions;
  final Function deleteTx;

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;

    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Container(
          height: _height * 0.68,
          child: transactions.isEmpty ? Column(children: [
            Text('No transactions added yet!', style: TextStyle(fontSize: 20),),
            Expanded(child: Image.asset('assets/images/zzz.jpg', fit: BoxFit.contain,)),
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
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: Colors.red,),
                    onPressed: () => deleteTx(transactions[index].id),
                  ),
                ),
              );
            },
          ),
        );
      },

    );
  }
}
