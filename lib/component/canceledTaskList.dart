import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/apiclint.dart';
import '../style/style.dart';
import 'TaskList.dart';

class canceledTaskList extends StatefulWidget {
  const canceledTaskList({super.key});

  @override
  State<canceledTaskList> createState() => _canceledTaskListState();
}

class _canceledTaskListState extends State<canceledTaskList> {
  @override
  void initState() {
    callData();
    super.initState();
  }
  List TaskItem=[];
  bool Loading=true;
  UpdateStatus(id)async{
    setState(() {
      Loading=true;
    });
    await TaskUpdateRequest(id, Status);
    await callData();
    setState(() {
      Status='Canceled';
    });
  }


  callData ()async{
    var data= await TaskListRequest("Canceled");
    setState(() {
      Loading=false;
      TaskItem=data;
    });
  }


  DeleteItem(id) async{
    showDialog(context: context,
        builder:(BuildContext){
          return AlertDialog(
            title: Text("Delete"),
            content: Text("Once delete,You ccan't geet it back"),
            actions: [
              OutlinedButton(onPressed: ()async{
                Navigator.pop(context);
                setState(()  {
                  Loading=true;
                });
                await TaskDeleteRequest(id);
                await callData();
              }, child: Text("Yes")),
              OutlinedButton(onPressed: ()async{
                Navigator.pop(context);
              }, child: Text("No"))
            ],
          );
        }

    );
  }


  String Status ="Canceled";

  StatusChanged(id) async{
    showModalBottomSheet(context: context,
        builder: (contex){
          return StatefulBuilder(builder: (BuildContext context,StateSetter
          setSatate){
            return Container(
              padding: EdgeInsets.all(30),
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RadioListTile(title:Text("New"),value: "New", groupValue: Status,
                      onChanged: (value){
                        setState(() {
                          Status=value.toString();
                        });
                      }),
                  RadioListTile(title:Text("Progress"),value: "Progress",
                      groupValue:
                      Status,
                      onChanged: (value){
                        setState(() {
                          Status=value.toString();
                        });
                      }),
                  RadioListTile(title:Text("Completed"),value: "Completed",
                      groupValue: Status,
                      onChanged: (value){
                        setState(() {
                          Status=value.toString();
                        });
                      }),
                  RadioListTile(title:Text("Canceled"),value: "Canceled", groupValue:
                  Status,
                      onChanged: (value){
                        setState(() {
                          Status=value.toString();
                        });
                      }),
                  Container(
                    child: ElevatedButton(
                      style: AppButtonStyle(),
                      child: SuccessButtonChild("Confirm"),
                      onPressed: (){
                        Navigator.pop(context);
                        UpdateStatus(id);

                      },
                    ),
                  )
                ],
              ),
            );
          }

          );
        }

    );
  }


  @override
  Widget build(BuildContext context) {
    return Loading?(Center(child: CircularProgressIndicator(),)):
    (RefreshIndicator(
      onRefresh: ()async{
        await callData();
      },
        child:TaskList(TaskItem,DeleteItem,StatusChanged)

    ));
  }
}
