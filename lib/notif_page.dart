import 'package:flutter/material.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Color(0xffffffff),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 23,
                ),
                SizedBox(height: 23),
                ListNotif(
                  name: "Drink Water",
                  time: "30 minutes",
                  title: "Its time to drink water",
                  desc: "Hello Irfa, Its time to drink water",
                ),
                SizedBox(
                  height: 15,
                ),
                ListNotif(
                  name: "Eat",
                  time: "5 Hours",
                  title: "Its time to Eat",
                  desc: "Hello Irfa, Its time to Eat",
                ),
                SizedBox(
                  height: 15,
                ),
                ListNotif(
                  name: "Stretching",
                  time: "1 hour",
                  title: "Its time to stretch",
                  desc: "Hello Irfa, Its time to Stretch",
                ),
                SizedBox(
                  height: 15,
                ),
                ListNotif(
                  name: "Drink Water",
                  time: "30 minutes",
                  title: "Its time to drink water",
                  desc: "Hello Irfa, Its time to drink water",
                ),
                SizedBox(
                  height: 15,
                ),
                ListNotif(
                  name: "Eat",
                  time: "5 Hours",
                  title: "Its time to Eat",
                  desc: "Hello Irfa, Its time to Eat",
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListNotif extends StatelessWidget {
  const ListNotif({
    super.key,
    required this.name,
    required this.time,
    required this.title,
    required this.desc,
  });

  final String name;
  final String time;
  final String desc;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        width: 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xffffffff),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "Remind Every " + time,
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "- Title : " + title,
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "- Description : " + desc,
                  style: TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ]));
  }
}
