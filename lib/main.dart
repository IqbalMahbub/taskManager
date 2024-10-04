import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/screen/onboarding/emailVerificationScreen.dart';
import 'package:taskmanager/screen/onboarding/loginScreen.dart';
import 'package:taskmanager/screen/onboarding/pinVarificationScreen.dart';
import 'package:taskmanager/screen/onboarding/registrationScreen.dart';
import 'package:taskmanager/screen/onboarding/setPasswordScreen.dart';
import 'package:taskmanager/screen/onboarding/splashScreen.dart';
import 'package:taskmanager/screen/taskScreen/newTaskListScreen.dart';

void main(){
  runApp(const Myapp());
}
class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task Manager",
      initialRoute:'/login',
      routes: {
        '/':(context)=> splashScreen(),
        '/login':(context)=> loginScreen(),
        '/registration':(context)=> registrationScreen(),
        '/emailVarification':(context)=> emailVerificationScreen(),
        '/pinVarification':(context)=> pinVarificationScreen(),
        '/setPassword':(context)=> setPasswordScreen(),
        '/newTasklistScreen':(context)=> newTaskListScreen(),

      }

    );
  }
}


