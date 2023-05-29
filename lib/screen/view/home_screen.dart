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
          backgroundColor: Colors.black,
          title: Text(
            "DataBase",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: txtcategory,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.black,
                    hintText: "category",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: txtamount,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.black,
                    hintText: "amount",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: txtnotes,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.black,
                    hintText: "notes",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: txtdate,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.black,
                    hintText: "date",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: txttime,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    fillColor: Colors.black,
                    hintText: "time",
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
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
                    dbHelper.insertData(
                        cate: p1,
                        amount: p2,
                        notes: p3,
                        date: p4,
                        time: p5,
                        status: status);
                  },
                  child: Text("income"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
                ElevatedButton(
                  onPressed: () {
                    String p1 = txtcategory.text;
                    String p2 = txtamount.text;
                    String p3 = txtnotes.text;
                    String p4 = txtdate.text;
                    String p5 = txttime.text;
                    status = 1;
                    DbHelper dbHelper = DbHelper();
                    dbHelper.insertData(
                        cate: p1,
                        amount: p2,
                        notes: p3,
                        date: p4,
                        time: p5,
                        status: status);
                  },
                  child: Text("expense"),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
