import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:taskmanager/utility/utility.dart';

import '../style/style.dart';
var BaseUrl ="http://localhost:3001";
var RequestHeader ={"Content-Type":"application/json"};


Future<bool>LoginRequest(FormValues) async {
  var URL=Uri.parse("http://localhost:3001/login");
  var postBody = jsonEncode(FormValues);
  var response= await  http.post(URL,headers: RequestHeader,body: postBody);
  var ResultCode= response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200){
    SuccessToast("Request Success");
   // StoreUserData(ResultBody);
    return true;
  }
  else{
    ErrorToast("Request Fail");
    return false;
  }

}




Future<bool>RegistrationRequest(FormValues) async {
  var URL=Uri.parse("http://localhost:3001/registration");
  var postBody = jsonEncode(FormValues);

  var response= await  http.post(URL,headers: RequestHeader,body: postBody);
  var ResultCode= response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==201){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Try again");
    return false;
  }
}




Future<bool>VerifyEmailRequest(Email) async {
  var URL=Uri.parse("${BaseUrl}/RecoverVerifyEmail/${Email}");


  var response= await  http.get(URL,headers: RequestHeader);
  var ResultCode= response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    await writeEmailVerification(Email);
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail !! Try again");
    return false;
  }
}




Future<bool>VerifyOTPRequest(Email,OTP) async {
  var URL=Uri.parse("${BaseUrl}/RecoverVerifyEmail/${Email}/{$OTP}");


  var response= await  http.get(URL,headers: RequestHeader);

  var ResultCode= response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    await writOTPVerification(OTP);
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail !! Try again");
    return false;
  }
}




Future<bool>SetPasswordRequest(FormValues) async {
  var URL=Uri.parse("${BaseUrl}/RecoverResetPass");
  var postBody = json.encode(FormValues);
  var response= await  http.post(URL,headers: RequestHeader,body: postBody);
  var ResultCode= response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail !! Try again");
    return false;
  }
}




Future<List>TaskListRequest(status) async {
  var URL=Uri.parse("${BaseUrl}/listTaskByStatus/${status}");
  String? token=await ReadUserData("token");
  var RequestHeaderWithToken={"content-Type":"application/json","token":'$token'};
  var response= await  http.get(URL,headers: RequestHeaderWithToken);
  var ResultCode= response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return ResultBody['data'];
  }
  else{
    ErrorToast("Request fail !! Try again");
    return [];
  }
}





Future<bool>TaskCreateRequest(FormValues) async {

  var URL=Uri.parse("${BaseUrl}/createTask");
  var postBody = jsonEncode(FormValues);

  String? token=await ReadUserData("token");
  var RequestHeaderWithToken={"content-Type":"application/json","token":'$token'};
  var response= await  http.post(URL,headers: RequestHeaderWithToken,body:postBody );
  var ResultCode= response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail !! Try again");
    return false;
  }
}



Future<bool>TaskDeleteRequest(id) async {
  var URL=Uri.parse("${BaseUrl}/deleteTask/${id}");
  String? token=await ReadUserData("token");
  var RequestHeaderWithToken={"content-Type":"application/json","token":'$token'};
  var response= await  http.get(URL,headers: RequestHeaderWithToken);
  var ResultCode= response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail !! Try again");
    return false;
  }
}


Future<bool>TaskUpdateRequest(id,status) async {
  var URL=Uri.parse("${BaseUrl}/updateTaskStatus/${id}/${status}");
  String? token=await ReadUserData("token");
  var RequestHeaderWithToken={"content-Type":"application/json","token":'$token'};
  var response= await  http.get(URL,headers: RequestHeaderWithToken);
  var ResultCode= response.statusCode;
  var ResultBody = json.decode(response.body);

  if(ResultCode==200 && ResultBody['status']=="success"){
    SuccessToast("Request Success");
    return true;
  }
  else{
    ErrorToast("Request fail !! Try again");
    return false;
  }
}