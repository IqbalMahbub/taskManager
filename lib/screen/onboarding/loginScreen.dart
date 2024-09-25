import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<loginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            padding: EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Get Started With',style: Head1Text(colorDarkBlue),),
                SizedBox(height: 2,),
                Text('Learn with Rabbil hasan',style: Head6Text(colorLightGray),),
                SizedBox(height: 2,),
                TextFormField(decoration: AppInputDecoration('Email Address'),),
                SizedBox(height: 2,),
                TextFormField(decoration: AppInputDecoration('Password'),),
                SizedBox(height: 2,),
                Container(
                  child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild('Login'),
                    onPressed: (){

                    },
                  ),
                )
          ],
            ),
          )
        ],
      ),

    );
  }
}
