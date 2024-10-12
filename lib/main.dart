import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/screen/onboarding/emailVerificationScreen.dart';
import 'package:taskmanager/screen/onboarding/loginScreen.dart';
import 'package:taskmanager/screen/onboarding/pinVarificationScreen.dart';
import 'package:taskmanager/screen/onboarding/registrationScreen.dart';
import 'package:taskmanager/screen/onboarding/setPasswordScreen.dart';
import 'package:taskmanager/screen/onboarding/splashScreen.dart';
import 'package:taskmanager/screen/taskScreen/homeScreen.dart';
import 'package:taskmanager/screen/taskScreen/taskCreatScreen.dart';
import 'package:taskmanager/utility/utility.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
String? token=  await ReadUserData('token');
if(token==null){
  runApp( Myapp("/login"));
}
else{
  runApp( Myapp('/'));
}
}
class Myapp extends StatelessWidget {
  final String FirstRoute;
  const Myapp(this.FirstRoute);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Task Manager",
      initialRoute:FirstRoute,
      routes: {
        '/':(context)=> HomeScreen(),
        '/login':(context)=> loginScreen(),
        '/registration':(context)=> registrationScreen(),
        '/emailVarification':(context)=> emailVerificationScreen(),
        '/pinVarification':(context)=> pinVarificationScreen(),
        '/setPassword':(context)=> setPasswordScreen(),
        '/taskCreate':(context)=> taskCreatScreen(),

      }
    );
  }
}


