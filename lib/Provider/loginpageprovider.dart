import 'package:flutter/cupertino.dart';

class LogInPageProvider with ChangeNotifier{
  String? emailError = "";
  String? pwdError = "";
  String? errormsg = "";
  String? loginerror = "";
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
      pwdError = "Password must be upto 8 characters";
      notifyListeners();
    }else{
      pwdError = "";
      notifyListeners();
    }
  }
  bool validate (String email, String pwd){
    bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
    if(emailValid==false || pwd.length<8){
      errormsg = "Enter the above details correctly";
      notifyListeners();
      return false;
    }else{
      errormsg = "";
      notifyListeners();
      return true;
    }
  }

  loginerrorMsg(String error){
    String passworderror = "[firebase_auth/wrong-password] The password is invalid or the user does not have a password.";
    String emailerror = "[firebase_auth/user-not-found] There is no user record corresponding to this identifier. The user may have been deleted.";
    if(error == passworderror){
      loginerror = "Password is Incorrect";
      notifyListeners();
      return false;
    }else if(error == emailerror){
      loginerror = "Invalid Address";
      notifyListeners();
      return false;
    }else{
      loginerror = "";
      notifyListeners();
      return true;
    }
  }
}