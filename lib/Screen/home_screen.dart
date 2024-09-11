import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:ionicons/ionicons.dart';
import 'package:remindits/Screen/notif_screen.dart';
import 'package:remindits/Screen/profil_screen.dart';
import 'package:remindits/utils/app_colors.dart';
import 'package:remindits/widgets/artickle.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;

  final List<Widget> _pages = [
    ArtickelWidget(),
    HomeScreen(),
    ProfilPage(),
  ];

  void _onTabChanged(int index) {
    setState(
      () {
        _selectedIndex = index;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.15),
              spreadRadius: 5,
              blurRadius: 10,
              offset: Offset(0, 0),
            ),
          ],
          color: Color(0xffffffff),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: GNav(
            padding: EdgeInsets.all(12),
            tabBorderRadius: 100,
            gap: 8,
            backgroundColor: Colors.white,
            color: AppColors.textColor1,
            activeColor: AppColors.primaryColor1,
            selectedIndex: _selectedIndex,
            onTabChange: _onTabChanged,
            tabs: const [
              GButton(
                icon: FontAwesomeIcons.newspaper,
              ),
              GButton(
                icon: FontAwesomeIcons.home,
              ),
              GButton(
                icon: FontAwesomeIcons.userAlt,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xfffbfbfb),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final currentUser = FirebaseAuth.instance.currentUser;
  final userCollection = FirebaseFirestore.instance.collection('users');
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome back,",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "SFProText",
                    ),
                  ),
                  StreamBuilder<DocumentSnapshot>(
                    stream: FirebaseFirestore.instance
                        .collection("users")
                        .doc(currentUser!.uid)
                        .snapshots(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        final userData =
                            snapshot.data!.data() as Map<String, dynamic>;
                        return Row(
                          children: [
                            Text(
                              userData["firstName"],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "SFProText",
                              ),
                            ),
                            SizedBox(
                              width: media.width * 0.01,
                            ),
                            Text(
                              userData["lastName"],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                fontFamily: "SFProText",
                              ),
                            ),
                          ],
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 9,
              ),
              Center(
                child: Container(
                  width: media.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xffffffff),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(
                            "assets/svg/pushpin-fill.svg",
                            width: 20,
                          ),
                          SizedBox(width: 9),
                          Text(
                            "Pinned Reminders",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: "SFProText",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      StreamBuilder<QuerySnapshot>(
                        stream: FirebaseFirestore.instance
                            .collection('users')
                            .doc(currentUser!.uid)
                            .collection('reminder')
                            .where('isPin', isEqualTo: true)
                            .snapshots(),
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshots) {
                          if (snapshots.connectionState ==
                              ConnectionState.waiting) {
                            return CircularProgressIndicator();
                          }
                          if (snapshots.data!.docs.isEmpty) {
                            return Text("No Pinned Reminders");
                          }
                          final data = snapshots.data;
                          return ListView.builder(
                            shrinkWrap: true,
                            itemCount: data?.docs.length,
                            itemBuilder: (context, index) {
                              Timestamp t = data?.docs[index].get('time');
                              DateTime date =
                                  DateTime.fromMicrosecondsSinceEpoch(
                                      t.microsecondsSinceEpoch);
                              String formattedTime =
                                  DateFormat.jm().format(date);
                              String title = data!.docs[index].get('title');
                              return Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        color: Color(0xffE6F7FF),
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 16, horizontal: 10),
                                    child: Row(
                                      children: [
                                        Text('1'),
                                        Container(
                                          width: media.width * 0.52,
                                          padding:
                                              const EdgeInsets.only(left: 20),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                title,
                                                style: TextStyle(
                                                    fontFamily: "SFProText",
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Text(
                                          formattedTime,
                                          style: TextStyle(
                                            fontFamily: "SFProText",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                "Healthy lifestyle tips",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  fontFamily: "SFProText",
                ),
              ),
              SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // ArtickelWidget(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
