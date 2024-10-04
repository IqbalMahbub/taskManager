import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

import '../../api/apiclint.dart';

class loginScreen extends StatefulWidget {
  const loginScreen({super.key});

  @override
  State<loginScreen> createState() => _splashScreenState();
}

class _splashScreenState extends State<loginScreen> {


  //FromValue
  Map<String,String> FormValue ={

    "email":"",
    "password":""
  };
  bool Loading =false;
  inputOnChanged(inputKye,inputValue){
    setState(() {
      FormValue.update(inputKye, (value) =>inputValue);
    });
  }

  FormInputValidation() async {
    if(FormValue["email"]!.length==0){
      ErrorToast("Email Requierd");
    }
    else if(FormValue['password']!.length==0){

      ErrorToast("password Required");
    }
    else{
      setState(() {Loading=true;});
        Navigator.pushNamedAndRemoveUntil(context,"/newTasklistScreen" ,
            (route) => false);
      // bool res=  await  LoginRequest(FormValue);
      // if(res){
      //   // Navigate to Dashboard
      // }
      // else{
      //   ErrorToast("Fail to Login");
      // }
      setState(() {Loading=false;});
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          Container(
            alignment: Alignment.center,
            child: Loading?(Center(child: CircularProgressIndicator(),)) : (
            SingleChildScrollView(
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(50),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Get Started With',style: Head1Text(colorDarkBlue),),
                    SizedBox(height: 2,),

                    Text('Learn with Rabbil hasan',style: Head6Text(colorLightGray),),
                    SizedBox(height: 2,),

                    TextFormField(
                      onChanged: (value){ inputOnChanged('email',
                          value);},
                      decoration: AppInputDecoration('Email Address'),),
                    SizedBox(height: 2,),

                    TextFormField(
                      onChanged: (value){ inputOnChanged('password',
                          value);},
                      decoration: AppInputDecoration('Password'),),
                    SizedBox(height: 2,),

                    Container(
                      child: ElevatedButton(
                        style: AppButtonStyle(),
                        child: SuccessButtonChild('Login'),
                        onPressed: (){
                          FormInputValidation();
                        },
                      ),
                    )
                  ],
                ),
              )
            )
            )
          )

        ],
      ),

    );
  }
}
