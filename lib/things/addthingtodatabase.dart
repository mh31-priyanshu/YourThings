import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:yourthingss/entry/authentication.dart';

  final CollectionReference usersCollection = FirebaseFirestore.instance.collection('Users');

  Future addThings(String uid, String thing, String description,DateTime date,DateTime time) async{
    
    DocumentReference documentReference = usersCollection.doc(uid).collection('Things').doc();

    getCurrentUserDataFunction();
    usersCollection.doc(uid).update({'totalthings':userModel.totalthings+1});
    getCurrentUserDataFunction();

    return await  documentReference.set({
      'thing' : thing,
      'description' : description,
      'date' : date,
      'time' : time,
      'id' : documentReference.id,
      'thingdone' : false,
      'created' : DateTime.now()
    });
  }

  Future<void> getdoclength() async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
      .collection('Users')
      .doc(userModel.useruid)
      .collection('Chats')
      .doc(userModel.useruid)
      .get();
  }


  Future markThingAsOngoing(String uid,String docid) async {
    usersCollection.doc(uid).collection('Things').doc(docid).update({'thingdone':false});
    await getCurrentUserDataFunction();
    usersCollection.doc(uid).update({'totalthingsdone':userModel.totalthingsdone-1});
    await getCurrentUserDataFunction();
  }


  Future markThingAsDone(String uid,String docid) async {

    usersCollection.doc(uid).collection('Things').doc(docid).update({'thingdone':true});
    await getCurrentUserDataFunction();
    usersCollection.doc(uid).update({'totalthingsdone':userModel.totalthingsdone+1});
    await getCurrentUserDataFunction();
  }

  void deleteThing(BuildContext context,String uid,String docid){

    var alertDialog = CupertinoAlertDialog(
      title: const Text("Delete"),
      content: const Text("Do you want to delete this thing?"),
      actions: [
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: const CupertinoDialogAction(
            child: Text("No")
          ),
        ),
        GestureDetector(
          onTap: (){
            usersCollection.doc(uid).collection('Things').doc(docid).delete();
            Navigator.pop(context);
          },
          child: const CupertinoDialogAction(
            child: Text("Yes")
          ),
        ),
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context){
        return alertDialog;
      }
    );
  }


