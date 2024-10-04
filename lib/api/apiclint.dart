import 'dart:convert';
import 'package:http/http.dart' as http;

import '../style/style.dart';
var BaseUrl ="https://task.teamrabbil.com/api/v1";
var RequestHeader ={"Content-Type":"application/json"};


Future<bool>LoginRequest(FormValues) async {
  var URL=Uri.parse("${BaseUrl}/login");
  var postBody = json.encode(FormValues);

  var response= await  http.post(URL,headers: RequestHeader,body: postBody);
  var ResultCode= response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request Fail");
    return false;
  }

}


Future<bool>RegistrationRequest(FormValues) async {
  var URL=Uri.parse("${BaseUrl}/registration");
  var postBody = json.encode(FormValues);

  var response= await  http.post(URL,headers: RequestHeader,body: postBody);
  var ResultCode= response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Try again");
    return false;
  }
}

Future<bool>VerifyEmailRequest(Email) async {
  var URL=Uri.parse("${BaseUrl}/RecoverVerifyEmail/${Email}");


  var response= await  http.post(URL,headers: RequestHeader);
  var ResultCode= response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail !! Try again");
    return false;
  }
}

Future<bool>VerifyOTPRequest(Email,OTP) async {
  var URL=Uri.parse("${BaseUrl}/RecoverVerifyEmail/${Email}/{$OTP}");


  var response= await  http.post(URL,headers: RequestHeader);

  var ResultCode= response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail !! Try again");
    return false;
  }
}

Future<bool>SetPasswordRequest(FormValues) async {
  var URL=Uri.parse("${BaseUrl}/RecoverResetPass");
  var postBody = json.encode(FormValues);
  var response= await  http.post(URL,headers: RequestHeader,body: postBody);
  var ResultCode= response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail !! Try again");
    return false;
  }
}