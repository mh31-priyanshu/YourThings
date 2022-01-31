import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class PhoneOTPProvider with ChangeNotifier{
  String SMS = "";
  verifyPhoneNumber(String phoneNumber) async{
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91$phoneNumber',
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
            print("AAAAAAAAAAAAAAAAAAAAAAAA${e.message}");
          },
        codeSent: (String verificationId, int? resendToken) {
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}