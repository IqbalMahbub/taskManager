import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/screen/onboarding/appBottomNav.dart';

import '../../component/TaskAppBar.dart';
import '../../component/canceledTaskList.dart';
import '../../component/compleatedTaskList.dart';
import '../../component/newTaskList.dart';
import '../../component/progressedTaskList.dart';
import '../../utility/utility.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String,String> ProfileData={"email":"","firstName":"","lastName":"","photo":DefaultProfileFic};
ReadAppBarData() async {
  String? emai= await ReadUserData('email');
  String? firstName= await ReadUserData('firstName');
  String? lastName= await ReadUserData('lastName');
  String? photo= await ReadUserData('photo');
  setState(() {
    Map<String,String> ProfileData={"email":"$emai","firstName":"$firstName",
      "lastName":"$lastName","p"
        "hoto":"$photo"};

  });

}

  int TabIndex=0;
  onItemTapped(int index){
    setState(() {
      TabIndex=index;
    });
  }
  final widgetOptions=[
    progressedTaskList(),
    canceledTaskList(),
    compleatedTaskList(),
    newTaskList(),
  ];
  @override
  void initState() {
    ReadAppBarData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:TaskAppBar(context,ProfileData) ,
      body:widgetOptions.elementAt(TabIndex) ,
      bottomNavigationBar: appBottomNav(TabIndex,onItemTapped),
    );
  }
}
