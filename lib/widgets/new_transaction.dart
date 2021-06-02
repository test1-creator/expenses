import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {

  NewTransaction(this.addTx);

  final Function addTx;

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void submitData() {
    if(amountController.text.isEmpty) {
      return;
    }

    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if(enteredTitle.isEmpty || enteredAmount <= 0)
      return;
    else
      widget.addTx(enteredTitle, enteredAmount, _selectedDate);

    Navigator.pop(context);
  }

  //opnes up a date picker to select a date from a calendar
  void _presentDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((picketDate) {
      if(picketDate == null) {
        return;
      }
      setState(() {
        _selectedDate = picketDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: MediaQuery.of(context).viewInsets.bottom + 30),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                onSubmitted: (_) => submitData(),
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
              ),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => submitData(),
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
              ),

              //date picker button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Picked Date: ${DateFormat.yMd().format(_selectedDate)}", style: TextStyle(fontSize: 15),),
                  TextButton(
                    onPressed: _presentDatePicker,
                    child: Text('Choose date', style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'OpenSans', color: Colors.purple, fontSize: 15),),
                  ),
                ],
              ),

              //Add transaction button
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: submitData,
                      child: Text(
                        'Add Transaction',
                        style: TextStyle(fontSize: 20),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.purple),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
