import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../api/apiclint.dart';
import '../../style/style.dart';
class registrationScreen extends StatefulWidget {
  const registrationScreen({super.key});

  @override
  State<registrationScreen> createState() => _registrationScreenState();
}

class _registrationScreenState extends State<registrationScreen> {
  Map<String,String> FormValue ={
    "email":"",
    "firstName":"",
    "lastName":"",
    "mobile":"",
    "password":"",
    "photo":"",
    "cpassword":""
  };
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
    else if(FormValue['firstName']!.length==0){
      ErrorToast("firstName Required");
    }
    else if(FormValue['lastName']!.length==0){
      ErrorToast("lastName Required");
    }
    else if(FormValue['mobile']!.length==0){
      ErrorToast("mobile Required");
    }
    else if(FormValue['firstName']!.length==0){
      ErrorToast("firstName Required");
    } else if(FormValue['password']!=FormValue['cpassword']){
      ErrorToast("did not match password");
    }
    else{
      setState(() {loading=true;});
     // Navigator.pushNamedAndRemoveUntil(context,'/login' ,(route) => false);

      bool res=  await  RegistrationRequest(FormValue);
      if(res){
        // Navigate to Dashboard
        Navigator.pushNamedAndRemoveUntil(context,'/login' ,(route) => false);
      }
      else{
        ErrorToast("Fail to Login");
      }
      setState(() {loading=false;});
    }
  }

  bool loading =false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Stack(
        children: [
          ScreenBackground(context),
          SingleChildScrollView(
            child: loading?(Center(child: CircularProgressIndicator(),)):(
            Container(
              padding: EdgeInsets.all(50),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text( 'Join with US',style: Head1Text(colorDarkBlue),),
                  SizedBox(height: 1),
                  Text('Learn with Rabbil hasan',style: Head6Text(colorLightGray),),
                  SizedBox(height: 20,),
                  TextFormField(
                    onChanged: (value){ inputOnChanged('email',
                        value);},
                    decoration: AppInputDecoration('Email Address'),),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration('First Name'),  onChanged: (value){ inputOnChanged('firstName',
                      value);},),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration('Last Name'), onChanged: (value){ inputOnChanged('lastName',
                      value);}),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration('Mobile No.'), onChanged: (value){ inputOnChanged('mobile',
                      value);}),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration('Password'), onChanged: (value){ inputOnChanged('password',
                      value);}),
                  SizedBox(height: 20,),
                  TextFormField(decoration: AppInputDecoration('Confirm '
                      'Password'), onChanged: (value){ inputOnChanged('cpassword',
                      value);}),
                  SizedBox(height: 20,),
                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      child: SuccessButtonChild('Registration'),
                      onPressed: (){
                        FormInputValidation();
                      },
                    ),
                  )
                ],
              ),
            ))

          )
        ],
      ),

    );
  }
}
