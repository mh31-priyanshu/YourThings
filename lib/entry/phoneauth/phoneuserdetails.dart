// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourthingss/Provider/signuppageprovider.dart';
import 'package:yourthingss/entry/authentication.dart';
import 'package:yourthingss/entry/loginuser.dart';
import 'package:yourthingss/homescreen/homepage.dart';
import 'package:yourthingss/homescreen/mainscreen.dart';
import 'package:yourthingss/main.dart';
// import 'package:myapp/Pages/Entry/login.dart';
// import 'package:myapp/Pages/Entry/auth.dart';
// import 'package:myapp/Pages/HomeScreen/home.dart';

class PhoneUserDetailsPage extends StatefulWidget {
  final String PhoneNumber;
  final String UID;
  const PhoneUserDetailsPage({Key? key, required this.PhoneNumber, required this.UID}) : super(key: key);

  @override
  _PhoneUserDetailsPageState createState() => _PhoneUserDetailsPageState();
}

class _PhoneUserDetailsPageState extends State<PhoneUserDetailsPage> {

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController nameInputController= TextEditingController();

  @override
  void initState() {
    nameInputController =  TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double widthBtn = ((MediaQuery.of(context).size.width) / 2) - 80;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        // ignore: avoid_unnecessary_containers
        child: Container(
            child:Column(
              children: [
                // ignore: avoid_unnecessary_containers
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                  child: const Text(
                    "User Details",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Color(0xffDC9E88),
                        fontSize: 22),
                    textAlign: TextAlign.center,
                  ),
                  width: double.infinity,
                ),
                // ignore: avoid_unnecessary_containers
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                    key: _registerFormKey,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(0, 30, 0, 7),
                                    child: const Text(
                                      "Full Name",
                                      style: TextStyle(
                                        color: Color(0xff7f7f7f),
                                        fontSize: 13,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.fromLTRB(0, 30, 5, 7),
                                    child: Text(
                                      "",
                                      style: const TextStyle(
                                        color: Color(0xffDC714B),
                                        fontSize: 13,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // ignore: avoid_unnecessary_containers
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: TextField(
                                  controller: nameInputController,
                                  decoration: const InputDecoration(
                                    hintText: "Enter Your Name",
                                    hintStyle: TextStyle(
                                      color: Color(0xff3d3d3d),
                                    ),
                                    fillColor: Color(0xff000D12),
                                    filled: true,
                                    prefixIcon: Icon(
                                      Icons.person_outline_outlined,
                                      color: Color(0xff3d3d3d),
                                    ),
                                    isDense: true,
                                    contentPadding: EdgeInsets.symmetric(
                                        horizontal: 0, vertical: 15),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                  ),
                                  style: const TextStyle(color: Color(0xff7f7f7f)),
                                  onChanged: (val){
                                    "provider.usernameErrorMsg(val)";
                                  },
                                ),
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.fromLTRB(0, 25, 0, 5),
                              child:Text(
                                "",
                                style: const TextStyle(
                                  color: Color(0xffDC714B),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: (widthBtn*2)+80,
                              height: 40,
                              child: OutlinedButton(
                                onPressed:  () async{
                                  await DatabaseServices().updateUserData(nameInputController.text, widget.PhoneNumber,widget.UID);
                                  await getCurrentUserDataFunction();
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                                },
                                  child: const Text(
                                    "Continue",
                                    style: TextStyle(
                                      color: Color(0xff3d3d3d),
                                    ),
                                  ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(
                                      (const Color(0xffDC9E88))),
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:  [
                      const Text(
                        "Have an Account?",
                        style: TextStyle(
                          color: Color(0xff7f7f7f),
                          fontSize: 14,
                        ),
                      ),
                      RichText(
                        text: TextSpan(
                            text: "  Sign In",
                            recognizer: TapGestureRecognizer()
                              ..onTap =(){
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context)=>const LoginPage())
                                );
                              },
                            style: const TextStyle(
                              color: Color(0xff9f9f9f),
                              fontSize: 15,
                              fontWeight: FontWeight.w800,
                            )
                        ),
                      ),
                    ],
                  ),
                  width: double.infinity,
                )
              ],
            )
        ),
      ),
      backgroundColor: const Color(0xff141C27),
    );
  }
}