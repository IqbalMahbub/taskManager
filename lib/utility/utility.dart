import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'dart:typed_data';

import 'package:shared_preferences/shared_preferences.dart';
String DefaultProfileFic ="data:image/jpeg;base64,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";

Future<void>StoreUserData(UserData) async{
  final prefs= await SharedPreferences.getInstance();
  await prefs.setString('token', UserData['data']['token']);
  await prefs.setString('firstName',UserData['data']['firstName'] );
  await prefs.setString('lastName',UserData['data']['lastName'] );
  await prefs.setString('mobile',UserData['data']['mobile'] );
  await prefs.setString('photo',UserData['data']['photo'] );
}


Future<void>writeEmailVerification(email) async{
  final prefs= await SharedPreferences.getInstance();
  await prefs.setString('EmailVarification',email);
}
Future<void>writOTPVerification(OTP) async{
  final prefs= await SharedPreferences.getInstance();
  await prefs.setString('OTPVarification',OTP);

}



Future<String?>ReadUserData(key) async{
  final prefs= await SharedPreferences.getInstance();
  String? mydata= await prefs.getString(key);
  return mydata;
}

showBase64Image(Base64String){
   UriData? data = Uri.parse(Base64String).data;
  Uint8List MyImag= data!.contentAsBytes();
  return MyImag;
}

Future<bool> RemoveToken() async {
  final prefs= await SharedPreferences.getInstance();
  await prefs.clear();
  return true;
}
