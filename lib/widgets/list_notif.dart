import 'package:flutter/material.dart';

class ListNotifWidget extends StatefulWidget {
  const ListNotifWidget({
    super.key,
    required this.no,
    required this.name,
    required this.time,
  });
  final String no;
  final String name;
  final String time;

  @override
  State<ListNotifWidget> createState() => _ListNotifWidgetState();
}

class _ListNotifWidgetState extends State<ListNotifWidget> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffE6F7FF), borderRadius: BorderRadius.circular(12)),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 10),
      child: Row(
        children: [
          Text(
            widget.no,
            style: TextStyle(
              fontFamily: "SFProText",
            ),
          ),
          Container(
            width: media.width * 0.55,
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.name,
                  style: TextStyle(
                    fontFamily: "SFProText",
                  ),
                ),
              ],
            ),
          ),
          Text(
            widget.time,
            style: TextStyle(
              fontFamily: "SFProText",
            ),
          )
        ],
      ),
    );
  }
}