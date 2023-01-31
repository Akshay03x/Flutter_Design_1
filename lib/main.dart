import 'package:flutter/material.dart';
import 'package:flutter_project2/login_page/login_page.dart';
import 'package:flutter_project2/login_page/pre_login_page.dart';
import 'package:flutter_project2/my_home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PreLoginPage(),
    ),
  );
}
