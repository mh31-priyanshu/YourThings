import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourthingss/Provider/loginpageprovider.dart';
import 'package:yourthingss/entry/loginuser.dart';
import 'package:yourthingss/homescreen/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yourthingss/homescreen/mainscreen.dart';

class Userauthentication extends StatefulWidget {
  const Userauthentication({Key? key}) : super(key: key);

  @override
  _UserauthenticationState createState() => _UserauthenticationState();
}

class _UserauthenticationState extends State<Userauthentication> {

  @override
  initState() {
    FirebaseAuth.instance
      .userChanges()
        .listen((User? user) async {
          if (user == null) {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
              create: (_)=> LogInPageProvider(),
              child: const LoginPage(),
            )));
          } else {
            await getCurrentUserDataFunction();
            Navigator.pushReplacement(context, 
              MaterialPageRoute(builder: (context)=> const MainScreen())
            // ignore: avoid_print
            ).catchError((err)=>print(err));
          }
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff141C27),
      body: Center(
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              CircularProgressIndicator(color: Colors.white60,)
            ],
          ),
        ),
      ),
    );
  }
}

class UserModel{
  final String fullName; 
  final String medium;
  final String useruid;
  final int totalthings;
  final int totalthingsdone;
  
  UserModel({
    required this.medium,
    required this.useruid,
    required this.fullName,
    required this.totalthings,
    required this.totalthingsdone
  });

  factory UserModel.fromDocument(DocumentSnapshot doc) {return UserModel(
    medium: doc['medium'],
    useruid: doc['uid'],
    fullName: doc['name'],
    totalthings : doc['totalthings'],
    totalthingsdone : doc['totalthingsdone'],
  );}
}
late UserModel userModel;
Future getCurrentUserDataFunction() async {
    await FirebaseFirestore.instance
      .collection("Users")
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .get().then((DocumentSnapshot documentSnapshot){
        if (documentSnapshot.exists) {
          userModel = UserModel.fromDocument(documentSnapshot);
        } else {
          // ignore: avoid_print
          print("Document does not exist the database");
        }
      }
    );
  }
class DatabaseServices{
  
  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');

  Future updateUserData( String name,String medium,String uid ) async{
    return await usersCollection
    .doc(uid)
    .set({
      'name' : name,
      'medium' : medium,
      'uid' : uid,
      'totalthings' : 0,
      'totalthingsdone': 0
    });
  }
}

final FirebaseAuth _auth = FirebaseAuth.instance;
Future<void> signOut() async {
    await _auth.signOut();
}