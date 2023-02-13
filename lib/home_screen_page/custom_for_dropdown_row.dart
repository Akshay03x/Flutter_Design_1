import 'package:flutter/material.dart';

Widget CustomForExpand3({required icon, required alignment}) {
  return Container(
    alignment: alignment,
    child: TextButton(
      child: Icon(icon, color: Colors.black),
      onPressed: () {},
    ),
  );
}