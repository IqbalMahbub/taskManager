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

      bool res=  await  LoginRequest(FormValue);
      print(res);
      if(res){
        // Navigate to Dashboard
        Navigator.pushNamedAndRemoveUntil(context,"/" ,
                (route) => false);
      }
      else{
        ErrorToast("Fail to Login");
      }
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

                    Text('Learn with Iqbal Mahbub',style: Head6Text
                      (colorLightGray),),
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
                    ),
                    SizedBox(height: 20,),
                    Container(
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          SizedBox(height: 20,),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, "/emailVarification"
                                  );
                            },
                            child: Text('Forget Password',style: Head7Text
                              (colorRed),),
                          ),
                          SizedBox(height: 20,),
                          InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, "/registration");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Don't have a account!!",style: Head7Text
                                  (colorDarkBlue),),
                                SizedBox(width: 10,),
                                Text("Sign UP",style: Head7Text(colorGreen),)
                              ],
                            ),
                          )
                        ],
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
