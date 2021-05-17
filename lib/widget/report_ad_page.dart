import 'package:flutter/material.dart';

class ReportAddScreen extends StatelessWidget {
  final String title;

  const ReportAddScreen({Key key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suuq"),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              alignment: Alignment.center,
              height: 80,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Text(
                "ddds",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              " Is There Something\n Wrong With This Ad? ",
              style: TextStyle(fontSize: 22),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "Please send us a report if you believe there is a\n                  problem with is ad",
              style: TextStyle(fontSize: 17),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Reason",
                  hintStyle: TextStyle(fontSize: 18),
                  suffixIcon: IconButton(
                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                    onPressed: () {},
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "your email",
                hintStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
            child: TextField(
              decoration: InputDecoration(
                hintText: "your message",
                hintStyle: TextStyle(fontSize: 18),
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          // ignore: deprecated_member_use
          Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: Container(
              height: 45,
              width: double.infinity,
              child: RaisedButton(
                color: Colors.red,
                onPressed: () {},
                child: Text(
                  "Send report",
                  style: TextStyle(fontSize: 19, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
