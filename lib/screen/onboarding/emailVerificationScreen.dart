import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

class emailVerificationScreen extends StatefulWidget {
  const emailVerificationScreen({super.key});

  @override
  State<emailVerificationScreen> createState() => _emailVerificationScreenState();
}

class _emailVerificationScreenState extends State<emailVerificationScreen> {

  Map<String,String> FormValue ={

    "email":"",
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

    else{
      setState(() {Loading=true;});
      Navigator.pushNamedAndRemoveUntil(context,"/pinVarification" ,
              (route) => false);
      // bool res=  await  VerifyEmailRequest(FormValue);
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
          SingleChildScrollView(
            child: Loading ? (Center(child: CircularProgressIndicator(),)):(
            Container(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Your Email Address',style: Head1Text(colorDarkBlue),),
                  SizedBox(height: 1,),
                  Text('A 6 digit pin will send to your email',style: Head6Text
                    (colorLightGray),),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration('Email Address'),),
                  SizedBox(height: 20,),
                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      child: SuccessButtonChild('Next'),
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
        ],
      ),

    );
  }
}
