
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

ListView TaskList(TaskItems,DeleteItem,StatusChanged){
  return ListView.builder(
    itemCount: TaskItems.length,
      itemBuilder: (context,index){
      Color statusColor =colorGreen;
      if(TaskItems[index]['status']=='New') {
        statusColor = colorBlue;
      }
     else if(TaskItems[index]['status']=='Progress'){
        statusColor=colorOrange;
      }
      else if(TaskItems[index]['status']=='Canceled'){
        statusColor=colorRed;
      }
        return Card(
          child: ItemSizeBox(
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TaskItems[index]['title'],style: Head6Text
                  (colorDarkBlue),),
                Text(TaskItems[index]['description'],style: Head7Text
                  (colorLightGray),),
                Text(TaskItems[index]['createDate'],style: Head9Text
                  (colorDarkBlue),),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    StatusChild(TaskItems[index]['status'], statusColor),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(width: 50,height: 30,child: ElevatedButton
                            (onPressed: (){
                            StatusChanged(TaskItems[index]['_id']);
                          },child: Icon(Icons
                              .edit_attributes_outlined,size: 16,),style: AppStatusButtonStyle(colorGreen),
                          ),),
                          SizedBox(width: 18,),
                          SizedBox(width: 50,height: 30,child: ElevatedButton
                            (onPressed: (){
                            DeleteItem(TaskItems[index]['_id']);
                          },child: Icon(Icons
                              .delete,size: 16,),style: AppStatusButtonStyle(colorRed),),),
                        ],
                      ),
                    )
                  ],
                )

              ],
            )
          ),
        );
      }
  );
}
