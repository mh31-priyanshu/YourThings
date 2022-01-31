// import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourthingss/Provider/loginpageprovider.dart';
import 'package:yourthingss/Provider/phoneloginprovider.dart';
import 'package:yourthingss/Provider/signuppageprovider.dart';
import 'package:yourthingss/entry/authentication.dart';
import 'package:yourthingss/entry/loginuser.dart';
import 'package:yourthingss/entry/phoneauth/otpphone.dart';
import 'package:yourthingss/entry/signupuser.dart';
import 'package:yourthingss/homescreen/mainscreen.dart';
import 'package:yourthingss/entry/authentication.dart';

class LoginPhonePage extends StatefulWidget {
  const LoginPhonePage({Key? key}) : super(key: key);

  @override
  _LoginPhonePageState createState() => _LoginPhonePageState();
}

class _LoginPhonePageState extends State<LoginPhonePage> {
  TextEditingController phoneInputController =  TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhoneLoginProvider>(context);
    double widthBtn = ((MediaQuery.of(context).size.width)/2)-80;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // ignore: avoid_unnecessary_containers
      body:  SingleChildScrollView(child:Container(
        child: Column(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
              child: const Text(
                "Sign In",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xffDC9E88),
                    fontSize: 22
                ),
                textAlign: TextAlign.center,
              ),
              width: double.infinity,
            ),
            // ignore: avoid_unnecessary_containers
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Column(
                  children:  [
                    // ignore: avoid_unnecessary_containers
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 60, 0, 7),
                      child: const Text(
                        "Phone Number",
                        style: TextStyle(
                          color: Color(0xff7f7f7f),
                          fontSize: 13,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      width: double.infinity,
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child:Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: TextField(
                          controller: phoneInputController,
                          decoration: const InputDecoration(
                            hintText: "Enter Your Phone Number",
                            hintStyle: TextStyle(
                              color: Color(0xff3d3d3d),
                            ),
                            fillColor: Color(0xff000D12),
                            filled: true,
                            prefixIcon: Icon(Icons.call,color: Color(0xff3d3d3d),),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          style: const TextStyle(
                              color: Color(0xff7f7f7f)
                          ),
                        ),
                      ),
                    ),

                    Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 18, 0, 30),
                          child: RichText(
                            text: TextSpan(
                                text: " Login with email",
                                recognizer: TapGestureRecognizer()
                                  ..onTap =(){
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
                                          create: (BuildContext context) => LogInPageProvider(),
                                          child: const LoginPage(),
                                        ))
                                    );
                                  },
                                style: const TextStyle(
                                  color: Color(0xff7f7f7f),
                                  fontSize: 13,
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                      child:Text(
                        provider.phoneerror.toString(),
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
                        onPressed: () {
                          if(provider.phoneErrorMsg(phoneInputController.text)){
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
                                  create: (_)=> PhoneLoginProvider(),
                                  child: OTPPhonePage(PhoneNumber: phoneInputController.text,),
                                )),
                            );
                          }
                        },
                          child: const Text(
                            "Get OTP",
                            style: TextStyle(
                              color: Color(0xff3d3d3d),
                            ),
                          ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>((const Color(0xffDC9E88))),
                          overlayColor: MaterialStateProperty.all<Color>((const Color(0xFF202020))),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            // ignore: avoid_unnecessary_containers, sized_box_for_whitespace
            Container(
              margin: const EdgeInsets.fromLTRB(0, 200, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  const Text(
                    "Don't have an Account?",
                    style: TextStyle(
                      color: Color(0xff7f7f7f),
                      fontSize: 14,
                    ),
                  ),
                  // ignore: unnecessary_const
                  RichText(
                    text: TextSpan(
                        text: "  Sign Up",
                        recognizer: TapGestureRecognizer()
                          ..onTap =(){
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
                                  create: (BuildContext context) => SignUpPageProvider(),
                                  child: const SignupPage(),
                                ))
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
          ],),
      ),),
      backgroundColor: const Color(0xff141C27),
    );
  }
}