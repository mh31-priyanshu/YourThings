import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:yourthingss/entry/authentication.dart';

class SignUpPageProvider with ChangeNotifier{
  String? usernameError = "";
  String? emailError = "";
  String? pwdError = "";
  String? cpwdError = "";
  usernameErrorMsg (String name){
    if(name.length<4){
      usernameError = "Enter Name upto 4 characters";
      notifyListeners();
    }else{
      usernameError = "";
      notifyListeners();
    }
  }
  emailErrorMsg (String email){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if(emailValid==false){
      emailError = "Enter a valid email address";
      notifyListeners();
    }else{
      emailError = "";
      notifyListeners();
    }
  }
  pwdErrorMsg (String pwd){
    if(pwd.length<8){
      pwdError = "Enter password upto 8 characters";
      notifyListeners();
    }else{
      pwdError = "";
      notifyListeners();
    }
  }
  cpwdErrorMsg (String pwd,String cpwd){
    if(pwd!=cpwd){
      cpwdError = "It doesn't match the above one";
      notifyListeners();
    }else{
      cpwdError = "";
      notifyListeners();
    }
  }
  String? errormsg = "";
  bool validate (String name,String email, String pwd, String cpwd){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if(name.length<4 || emailValid==false || pwd.length<8 || pwd!=cpwd){
      errormsg = "Enter the above details correctly";
      notifyListeners();
      return false;
    }else{
      errormsg = "";
      notifyListeners();
      return true;
    }
  }
}