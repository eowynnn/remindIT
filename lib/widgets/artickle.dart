import 'package:flutter/material.dart';
import 'package:remindits/Screen/artickel_screen.dart';

class ArtickelWidget extends StatelessWidget {
  const ArtickelWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      height: 140,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Color(0xffE6F7FF),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 23, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ideal Hours for Sleep",
                  style: TextStyle(
                    fontFamily: "SFProText",
                  ),
                ),
                Text("8hours 30minutes",
                    style: TextStyle(
                      color: Color(0xFF16C1E3),
                      fontFamily: "SFProText",
                    )),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 35,
                  width: 106,
                  decoration: BoxDecoration(
                      color: Color(0xff42DCF9),
                      borderRadius: BorderRadius.circular(20)),
                  child: Material(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.push(context, _createRoute(ArtickelPage()));
                      },
                      child: Center(
                        child: Text(
                          "Learn More",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.symmetric(
                  vertical: 16, horizontal: media.width * 0.02),
              child: Image(image: AssetImage("assets/png/Icon-Bed.png")))
        ],
      ),
    );
  }
}

Route _createRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
