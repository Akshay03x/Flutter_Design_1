import 'package:flutter/material.dart';

Widget CustomForExpand2({required icon}) {
  return Container(
    margin: EdgeInsets.fromLTRB(5, 0, 5, 10),
    child: FloatingActionButton(
      backgroundColor: Colors.white70,
      onPressed: () {},
      child: Icon(
        icon,
        size: 35,
        color: Colors.black,
      ),
    ),
  );
}