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
import 'package:yourthingss/entry/phoneauth/loginphone.dart';
import 'package:yourthingss/entry/signupuser.dart';
import 'package:yourthingss/homescreen/mainscreen.dart';
import 'package:yourthingss/main.dart';

import 'authentication.dart';
// import 'package:myapp/Pages/HomeScreen/home.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailInputController =  TextEditingController();
  TextEditingController pwdInputController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of< LogInPageProvider >(context);
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 40, 0, 7),
                          child: const Text(
                            "Email",
                            style: TextStyle(
                              color: Color(0xff7f7f7f),
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.left,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 40, 5, 7),
                          child: Text(
                            provider.emailError.toString(),
                            style: const TextStyle(
                              color: Color(0xffDC714B),
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child:Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: TextField(
                          controller: emailInputController,
                          decoration: const InputDecoration(
                            hintText: "Enter Your Email",
                            hintStyle: TextStyle(
                              color: Color(0xff3d3d3d),
                            ),
                            fillColor: Color(0xff000D12),
                            filled: true,
                            prefixIcon: Icon(Icons.email_outlined,color: Color(0xff3d3d3d),),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: Color(0xff7f7f7f)
                          ),
                          onChanged: (value){
                            provider.emailErrorMsg(value);
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 30, 0, 7),
                          child: const Text(
                            "Password",
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
                            provider.pwdError.toString(),
                            style: const TextStyle(
                              color: Color(0xffDC714B),
                              fontSize: 13,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child:Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: TextField(
                          controller: pwdInputController,
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                            hintText: "Enter Your Password",
                            hintStyle: TextStyle(
                              color: Color(0xff3d3d3d),
                            ),
                            fillColor: Color(0xff000D12),
                            filled: true,
                            prefixIcon: Icon(Icons.password_outlined,color: Color(0xff3d3d3d),),
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 15),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: Color(0xff7f7f7f)
                          ),
                          onChanged: (value){
                            provider.pwdErrorMsg(value);
                          },
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                          child: RichText(
                            text: TextSpan(
                                text: " Login with phone",
                                recognizer: TapGestureRecognizer()
                                  ..onTap =(){
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context)=>ChangeNotifierProvider(
                                          create: (BuildContext context) => PhoneLoginProvider(),
                                          child: const LoginPhonePage(),
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
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 15, 0, 20),
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Color(0xff7f7f7f),
                              fontSize: 13,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child:Text(
                            provider.errormsg.toString(),
                            style: const TextStyle(
                              color: Color(0xffDC714B),
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child:Text(
                            provider.loginerror.toString(),
                            style: const TextStyle(
                              color: Color(0xffDC714B),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () async{
                        if(provider.validate(emailInputController.text, pwdInputController.text)){
                          try{
                            UserCredential user = await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                email: emailInputController.text,
                                password: pwdInputController.text);
                            await getCurrentUserDataFunction();
                            Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context)=>MainScreen())
                            );
                          }catch(e){
                            provider.loginerrorMsg(e.toString());
                            // ignore: avoid_print
                            print(e.toString());
                          }
                        }

                      }, 
                      child:  Padding(
                        padding: EdgeInsets.symmetric(vertical: 12, horizontal:widthBtn),
                        child: const Text(
                          "Log In",
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
}