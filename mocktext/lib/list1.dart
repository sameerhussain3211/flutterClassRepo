import 'package:flutter/material.dart';

class list1 extends StatelessWidget {
  Image? img;
  String? NameMob;
  String? PriceMob;
  String? detail;

  list1({
    required this.img,
    required this.NameMob,
    required this.PriceMob,
    required this.detail,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
              color: const Color.fromARGB(103, 158, 158, 158),
              height: 150,
              child: img),
          Container(
            height: 10,
          ),
          Row(
            children: [
              Container(
                color: const Color.fromARGB(94, 158, 158, 158),
                child: Text(
                  " $NameMob",
                  style: TextStyle(backgroundColor: Colors.white),
                ),
              ),
              Container(
                width: 300,
              ),
              Container(
                color: const Color.fromARGB(104, 158, 158, 158),
                child: Text(
                  " $PriceMob ",
                  style: TextStyle(backgroundColor: Colors.white),
                ),
              ),
              Container(
                width: 10,
              ),
              Container(
                child: Icon(Icons.remove_red_eye_sharp),
              )
            ],
          ),
          Container(
            height: 15,
            color: const Color.fromARGB(118, 158, 158, 158),
            child: Text(
              "$detail",
              style: TextStyle(backgroundColor: Colors.white),
            ),
          ),
          Container(
            height: 10,
          ),
        ],
      ),
    );
  }
}
