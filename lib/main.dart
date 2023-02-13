import 'package:flutter/material.dart';
import 'package:flutter_project2/hide_appbar_testing.dart';
import 'package:flutter_project2/login_page/login_page.dart';
import 'package:flutter_project2/login_page/pre_login_page.dart';
import 'package:flutter_project2/home_screen_page/my_home_page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PreLoginPage(),
    ),
  );
}
