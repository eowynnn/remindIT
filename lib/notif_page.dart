import 'package:flutter/material.dart';
import 'package:layout/main.dart';

class NotifPage extends StatelessWidget {
  const NotifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 23,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shadowColor: Colors.transparent,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HomePage();
                      }));
                    },
                    child:
                        Image(image: AssetImage('assets/png/Arrow_left.jpg'))),
                SizedBox(height: 23),
                ListNotif(),
                SizedBox(
                  height: 15,
                ),
                ListNotif(),
                SizedBox(
                  height: 15,
                ),
                ListNotif(),
                SizedBox(
                  height: 15,
                ),
                ListNotif(),
                SizedBox(
                  height: 15,
                ),
                ListNotif(),
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
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 145,
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
                  "Drink water",
                  style: TextStyle(fontSize: 14),
                ),
                Text(
                  "Remind Every 30 minute",
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "- Title : Its time to drink",
                  style: TextStyle(fontSize: 12),
                ),
                Text(
                  "- Description : Hello Irfa, its time to Drink",
                  style: TextStyle(fontSize: 12),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          )
        ]));
  }
}
