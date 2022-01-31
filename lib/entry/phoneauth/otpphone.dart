// import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yourthingss/Provider/phoneloginprovider.dart';
import 'package:yourthingss/Provider/signuppageprovider.dart';
import 'package:yourthingss/entry/authentication.dart';
import 'package:yourthingss/entry/loginuser.dart';
import 'package:yourthingss/entry/phoneauth/phoneuserdetails.dart';
import 'package:yourthingss/entry/signupuser.dart';
import 'package:yourthingss/homescreen/mainscreen.dart';
import 'package:yourthingss/entry/authentication.dart';

class OTPPhonePage extends StatefulWidget {
  final String PhoneNumber;
  const OTPPhonePage({Key? key, required this.PhoneNumber}) : super(key: key);

  @override
  _OTPPhonePageState createState() => _OTPPhonePageState();
}

class _OTPPhonePageState extends State<OTPPhonePage> {
  TextEditingController OTPInputController =  TextEditingController();
  String _VerificationCode = "";
  @override
  Widget build(BuildContext context) {
    double widthBtn = ((MediaQuery.of(context).size.width)/2)-80;
    final provider = Provider.of< PhoneLoginProvider >(context);
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
                "Verify Phone Number",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Color(0xffDC9E88),
                    fontSize: 22
                ),
                textAlign: TextAlign.center,
              ),
              width: double.infinity,
            ),
            // ignore: avoid_unnecessary_containersmko
            Container(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Column(
                  children:  [
                    // ignore: avoid_unnecessary_containers
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 60, 0, 7),
                      child: const Text(
                        "OTP",
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
                          controller: OTPInputController,
                          decoration: const InputDecoration(
                            hintText: "Enter OTP received",
                            hintStyle: TextStyle(
                              color: Color(0xff3d3d3d),
                            ),
                            fillColor: Color(0xff000D12),
                            filled: true,
                            prefixIcon: Icon(Icons.password,color: Color(0xff3d3d3d),),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 0, 30),
                          child: RichText(
                            text: TextSpan(
                                text: " Didn't received the OTP?",
                                recognizer: TapGestureRecognizer()
                                  ..onTap =(){
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
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child:Text(
                        provider.otperror.toString(),
                        style: const TextStyle(
                          color: Color(0xffDC714B),
                          fontSize: 14,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try{
                          UserCredential user;
                          user = await FirebaseAuth.instance
                              .signInWithCredential(PhoneAuthProvider.credential(
                              verificationId: _VerificationCode, smsCode: OTPInputController.text));
                                if(user != null){
                                  final snapShot = await FirebaseFirestore.instance
                                      .collection('Users')
                                      .doc(user.user!.uid.toString())
                                      .get();
                                  if(!snapShot.exists || snapShot == null){
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>PhoneUserDetailsPage(PhoneNumber: widget.PhoneNumber, UID: user.user!.uid.toString(),)));
                                  }else{
                                    await getCurrentUserDataFunction();
                                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MainScreen()));
                                  }
                                }
                        }catch(e){
                          provider.otpErrorMsg(e.toString());
                          print(e);
                        }
                      },
                      child:  Padding(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal:widthBtn),
                        child: const Text(
                          "Verify",
                          style: TextStyle(
                            color: Color(0xff3d3d3d),
                          ),
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>((const Color(0xffDC9E88))),
                        overlayColor: MaterialStateProperty.all<Color>((const Color(0xFF202020))),
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

  verifyPhoneNumber() async{
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91${widget.PhoneNumber}',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          if(value.user != null){
            print('user logged in');
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _VerificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        setState(() {
          _VerificationCode = verificationId;
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    verifyPhoneNumber();
  }
}