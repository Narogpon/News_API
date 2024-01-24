// ignore_for_file: prefer_const_constructors

import 'package:apiapp/page/login.dart';
import 'package:apiapp/page/newspage.dart';
import 'package:apiapp/page/welcome.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DrawerNav extends StatelessWidget {
  Color color;
  DrawerNav({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: color,
            ),
            child: Text(
              'Breaking news ข่าว สด ใหม่',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('หน้าหลัก'),
            onTap: () {
              Get.to(() => WelcomeScreen());
            },
          ),
          ListTile(
            leading: Icon(Icons.newspaper),
            title: Text('ข่าว'),
            onTap: () {
              Get.to(() => NewsPage());
            },
          ),
          ListTile(
            leading: Icon(Icons.login),
            title: Text('หน้าล็อกอิน'),
            onTap: () {
              Get.to(() => LoginPage());
            },
          ),
        ],
      ),
    );
  }
}
