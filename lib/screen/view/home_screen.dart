import 'package:data_base/utils/db_helper.dart';
import 'package:flutter/material.dart';

class homescreen extends StatefulWidget {
  const homescreen({Key? key}) : super(key: key);

  @override
  State<homescreen> createState() => _homescreenState();
}

class _homescreenState extends State<homescreen> {
  TextEditingController txtcategory = TextEditingController();
  TextEditingController txtamount = TextEditingController();
  TextEditingController txtnotes = TextEditingController();
  TextEditingController txtdate = TextEditingController();
  TextEditingController txttime = TextEditingController();
  int status = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blue,
          title: Text(
            "Database",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: Column(
          children: [
            TextField(
              controller: txtcategory,
              decoration: InputDecoration(
                hintText: "category",
              ),
            ),
            TextField(
              controller: txtamount,
              decoration: InputDecoration(
                hintText: "amount",
              ),
            ),
            TextField(
              controller: txtnotes,
              decoration: InputDecoration(
                hintText: "notes",
              ),
            ),
            TextField(
              controller: txtdate,
              decoration: InputDecoration(
                hintText: "date",
              ),
            ),
            TextField(
              controller: txttime,
              decoration: InputDecoration(
                hintText: "time",
              ),
            ),
            ElevatedButton(
                onPressed: () async {
                  String p1 = txtcategory.text;
                  String p2 = txtamount.text;
                  String p3 = txtnotes.text;
                  String p4 = txtdate.text;
                  String p5 = txttime.text;
                 status = 0;

                 DbHelper dbHelper = DbHelper();
                 dbHelper.insertData(cate: txtcategory, amount: txtamount, notes: txtnotes, date: txtdate, time: txttime, status: status);
                },
                child: Text("income"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),),
            ElevatedButton(
                onPressed: () {
                  String p1 = txtcategory.text;
                  String p2 = txtamount.text;
                  String p3 = txtnotes.text;
                  String p4 = txtdate.text;
                  String p5 = txttime.text;
                  status = 1;
                  DbHelper dbHelper = DbHelper();
                  dbHelper.insertData(cate: txtcategory, amount: txtamount, notes: txtnotes, date: txtdate, time: txttime, status: status);
                },
                child: Text("expense"),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),),
          ],
        ),
      ),
    );
  }
}
