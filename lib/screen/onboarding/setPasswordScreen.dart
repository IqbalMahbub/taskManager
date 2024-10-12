import 'package:flutter/material.dart';
import 'package:taskmanager/utility/utility.dart';

import '../../api/apiclint.dart';
import '../../style/style.dart';

class setPasswordScreen extends StatefulWidget {
  const setPasswordScreen({super.key});

  @override
  State<setPasswordScreen> createState() => _setPasswordScreenState();
}

class _setPasswordScreenState extends State<setPasswordScreen> {
  Map<String,String> FormValue ={
    "email":"",
    "OTP":"",
    "password":"",
    "cpassword":""
  };
  bool Loading =false;
  @override
  void initState() {
   callStoreData();
    super.initState();
  }
  callStoreData() async{
    String? OTP=await ReadUserData("OTPVarification");
    String? Email=await ReadUserData("EmailVarification");
    inputOnChanged('email', Email);
    inputOnChanged('OTP', OTP);
  }
  inputOnChanged(inputKye,inputValue){
    setState(() {
      FormValue.update(inputKye, (value) =>inputValue);
    });
  }
  FormInputValidation() async {
    if(FormValue["password"]!.length==0){
      ErrorToast("Password Requierd");
    }
    else if(FormValue['password']!=FormValue['cpassword']){
      ErrorToast("Password not match");
    }
    else{
      setState(() {Loading=true;});

      bool res=  await  SetPasswordRequest(FormValue);
      if(res){
        Navigator.pushNamedAndRemoveUntil(context,"/login" , (route) => false);
      }
      else{
        setState(() {Loading=false;});
      }

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
                Text('Set Password',style: Head1Text(colorDarkBlue),),
                SizedBox(height: 1,),
                Text('Minimum length password 8 character with latter and '
                    'number combination ',style: Head6Text
                  (colorLightGray),),
                SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration('Password'),),
                SizedBox(height: 20,),
                TextFormField(decoration: AppInputDecoration
                  ('Confirm Password'),),
                SizedBox(height: 20,),
                Container(
                  child: ElevatedButton(
                    style: AppButtonStyle(),
                    child: SuccessButtonChild('Confirm'),
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
