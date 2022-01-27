import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yourthingss/entry/authentication.dart';
import 'package:yourthingss/homescreen/appdrawer.dart';
import 'package:yourthingss/homescreen/homepage.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          AppDrawer(),
          HomePage(),
        ],
      );
  }
}