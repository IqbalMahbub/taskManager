import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

Future<void>StoreUserData(UserData) async{
  final prefs= await SharedPreferences.getInstance();
  await prefs.setString('token', UserData['data']['token']);
  await prefs.setString('firstName',UserData['data']['firstName'] );
  await prefs.setString('lastName',UserData['data']['lastName'] );
  await prefs.setString('mobile',UserData['data']['mobile'] );
  await prefs.setString('photo',UserData['data']['photo'] );


}

Future<void>ReadUserData(kye) async{
  final prefs= await SharedPreferences.getInstance();
  String mydata=


}