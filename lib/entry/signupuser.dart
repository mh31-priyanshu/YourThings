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

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  final GlobalKey<FormState> _registerFormKey = GlobalKey<FormState>();
  TextEditingController nameInputController= TextEditingController();
  TextEditingController emailInputController= TextEditingController();
  TextEditingController pwdInputController= TextEditingController();
  TextEditingController cpwdInputController= TextEditingController();

  @override
  void initState() { 
    nameInputController =  TextEditingController();
    emailInputController =  TextEditingController();
    pwdInputController = TextEditingController();
    cpwdInputController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of< SignUpPageProvider >(context);
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
                        "Sign Up",
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
                                                provider.usernameError.toString(),
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
                                              provider.usernameErrorMsg(val);
                                            },
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 7),
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
                                            margin: const EdgeInsets.fromLTRB(0, 20, 5, 7),
                                            child: Text(
                                              provider.emailError.toString(),
                                              style: const TextStyle(
                                                color: Color(0xffDC714B),
                                                fontSize: 13,
                                              ),
                                              textAlign: TextAlign.left,
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
                                              prefixIcon: Icon(
                                                Icons.email_outlined,
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
                                              provider.emailErrorMsg(val);
                                            },
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 7),
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
                                            margin: const EdgeInsets.fromLTRB(0, 20, 5, 7),
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
                                            decoration: const InputDecoration(
                                              hintText: "Enter Your Password",
                                              hintStyle: TextStyle(
                                                color: Color(0xff3d3d3d),
                                              ),
                                              fillColor: Color(0xff000D12),
                                              filled: true,
                                              prefixIcon: Icon(
                                                Icons.password_outlined,
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
                                              provider.pwdErrorMsg(val);
                                            },
                                          ),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(0, 20, 0, 7),
                                            child: const Text(
                                              "Confirm Password",
                                              style: TextStyle(
                                                color: Color(0xff7f7f7f),
                                                fontSize: 13,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.fromLTRB(0, 20, 5, 7),
                                            child:Text(
                                              provider.cpwdError.toString(),
                                              style: const TextStyle(
                                                color: Color(0xffDC714B),
                                                fontSize: 13,
                                              ),
                                              textAlign: TextAlign.left,
                                            ),
                                          ),

                                        ],
                                      ),
                                      // ignore: avoid_unnecessary_containers
                                      Container(
                                        child:Padding(
                                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                                          child: TextField(
                                            controller: cpwdInputController,
                                            decoration: const InputDecoration(
                                              hintText: "Confirm Password",
                                              hintStyle: TextStyle(
                                                color: Color(0xff3d3d3d),
                                              ),
                                              fillColor: Color(0xff000D12),
                                              filled: true,
                                              prefixIcon: Icon(
                                                Icons.password_outlined,
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
                                              provider.cpwdErrorMsg(pwdInputController.text, val);
                                            },
                                          ),
                                        ),
                                      ),
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
                                      ElevatedButton(
                                        onPressed:  () async{
                                          if(provider.validate(nameInputController.text, emailInputController.text, pwdInputController.text, cpwdInputController.text)){
                                            UserCredential user = await FirebaseAuth.instance
                                                .createUserWithEmailAndPassword(
                                                email: emailInputController.text,
                                                password: pwdInputController.text);
                                            await DatabaseServices().updateUserData(nameInputController.text, emailInputController.text,user.user!.uid.toString());
                                            await getCurrentUserDataFunction();
                                            Navigator.pushReplacement(context,
                                                MaterialPageRoute(builder: (context)=>MainScreen())
                                            );
                                            // Provider.value(value: )
                                          }
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 12, horizontal: widthBtn-2),
                                          child: const Text(
                                            "Register",
                                            style: TextStyle(
                                              color: Color(0xff3d3d3d),
                                            ),
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor: MaterialStateProperty.all<Color>(
                                              (const Color(0xffDC9E88))),
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