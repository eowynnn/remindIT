import 'package:flutter/material.dart';
import 'package:layout/notif_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back,",
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          "Irfa Rizkya Fardhan",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 45,
                      height: 45,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF16C1E3),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 13,
                ),
                Text("Upcoming Notifications"),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NotifWidget(
                      title: "25min",
                      subtitle: "Drink",
                    ),
                    NotifWidget(
                      title: "30min",
                      subtitle: "Eat",
                    ),
                    NotifWidget(
                      title: "42min",
                      subtitle: "Streching",
                    )
                  ],
                ),
                SizedBox(
                  height: 14,
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  height: 57,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffD5F5FC),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Today",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      Container(
                        // padding:
                        //     EdgeInsets.symmetric(vertical: 5.5, horizontal: 16),
                        width: 88,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Color(0xff42DCF9))),
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return NotifPage();
                            }));
                          },
                          child: Text("Check",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text("Healthy lifestyle tips"),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ArtickelWidget(),
                    SizedBox(
                      height: 15,
                    ),
                    ArtickelWidget(),
                    SizedBox(
                      height: 15,
                    ),
                    ArtickelWidget(),
                    SizedBox(
                      height: 15,
                    ),
                    ArtickelWidget()
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ArtickelWidget extends StatelessWidget {
  const ArtickelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffE6F7FF),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 23, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Ideal Hours for Sleep"),
              Text("8hours 30minutes"),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 35,
                width: 95,
                padding: EdgeInsets.symmetric(vertical: 7.5, horizontal: 15),
                decoration: BoxDecoration(
                    color: Color(0xff42DCF9),
                    borderRadius: BorderRadius.circular(20)),
                child: Text(
                  "Learn More",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}

class NotifWidget extends StatelessWidget {
  const NotifWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
      width: 95,
      height: 65,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 0), // changes position of shadow
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 14, color: Color(0xff00B4D8)),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            subtitle,
            style: TextStyle(
              fontSize: 12,
              color: Color(0xff7B6F72),
            ),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
