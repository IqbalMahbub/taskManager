import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:taskmanager/utility/utility.dart';

import '../../style/style.dart';

class pinVarificationScreen extends StatefulWidget {
  const pinVarificationScreen({super.key});

  @override
  State<pinVarificationScreen> createState() => _pinVarificationScreenState();
}

class _pinVarificationScreenState extends State<pinVarificationScreen> {


  Map<String,String> FormValue ={

    "OTP":"",
  };
  bool Loading =false;
  inputOnChanged(inputKye,inputValue){
    setState(() {
      FormValue.update(inputKye, (value) =>inputValue);
    });
  }

  FormInputValidation() async {
    if(FormValue["OTP"]!.length==0){
      ErrorToast("Email Requierd");
    }
    else{
      setState(() {Loading=true;});
      Navigator.pushNamedAndRemoveUntil(context,"/setPassword" ,
              (route) => false);
      String? emailAdderess= await ReadUserData("EmailVerification") ;
      // bool res=  await  VerifyOTPRequest(emailAddress,FormValue['OTP']);
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
            padding: EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('PIN Verification',style: Head1Text(colorDarkBlue),),
                SizedBox(height: 1,),
                Text('A 6 digit pin was send to your email',style: Head6Text
                  (colorLightGray),),
                SizedBox(height: 20,),
                 PinCodeTextField(appContext: context,
                     length: 6,
                     pinTheme: AppOTPStyle(),
                 animationDuration: Duration(milliseconds: 300),
                   enableActiveFill: true,
                   onCompleted: (v){},
                   onChanged: (value){},
                 ),
                SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild('Verify'),
                    onPressed: (){
                      FormInputValidation();
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
