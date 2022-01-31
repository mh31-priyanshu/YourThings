import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class PhoneLoginProvider with ChangeNotifier{
  String phoneerror = "";
  String otperror = "";
  bool phoneErrorMsg (String phone){
    if(phone.length<10){
      phoneerror = "Enter a valid phone number";
      notifyListeners();
      return false;
    }else{
      phoneerror = "";
      notifyListeners();
      return true;
    }
  }

  bool otpErrorMsg(String error){
    String otperrormsg = "[firebase_auth/invalid-verification-code] The sms verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user.";
    if(error == otperrormsg){
      otperror  = "Incorrect OTP";
      notifyListeners();
      return false;
    }else{
      otperror = "";
      notifyListeners();
      return true;
    }
  }
}