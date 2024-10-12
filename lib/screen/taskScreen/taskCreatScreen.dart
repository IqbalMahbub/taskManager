import 'package:flutter/material.dart';
import 'package:taskmanager/api/apiclint.dart';
import 'package:taskmanager/style/style.dart';

class taskCreatScreen extends StatefulWidget {
  const taskCreatScreen({super.key});

  @override
  State<taskCreatScreen> createState() => _taskCreatScreenState();
}

class _taskCreatScreenState extends State<taskCreatScreen> {

  Map<String,String> FormValue={
    "title":"",
    "description":"",
    "status":"New"
  };
  bool Loading =false;
  inputOnChanged(inputKye,inputValue){
    setState(() {
      FormValue.update(inputKye, (value) =>inputValue);
    });
  }

  FormInputValidation() async {
    if(FormValue["title"]!.length==0){
      ErrorToast("title Requierd");
    }
    else if(FormValue['description']!.length==0){
      ErrorToast("description Required");
    }
    else{
      setState(() {Loading=true;});

     //TODO;
      bool res= await TaskCreateRequest(FormValue);
      print(res);
      if(res){
        // Navigate to Dashboard
        Navigator.pushNamedAndRemoveUntil(context,"/ " ,
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
      appBar: AppBar(backgroundColor: colorGreen,title: Text("Create New "
          "Task",style: Head1Text(colorWhite),)
          ,),
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
                            Text('ADD NEW TASK',style: Head1Text
                              (colorDarkBlue),),
                            SizedBox(height: 2,),

                            TextFormField(
                              onChanged: (value){ inputOnChanged('title',
                                  value);},
                              decoration: AppInputDecoration('Task Name'),),
                            SizedBox(height: 2,),

                            TextFormField(
                              onChanged: (value){ inputOnChanged('description',
                                  value);},
                              maxLines: 10,
                              decoration: AppInputDecoration('Description'),),
                            SizedBox(height: 2,),
                            Container(
                              child: ElevatedButton(
                                style: AppButtonStyle(),
                                child: SuccessButtonChild('Create'),
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
