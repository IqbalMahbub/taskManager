import 'package:flutter/material.dart';
import 'package:taskmanager/style/style.dart';

BottomNavigationBar appBottomNav(currentIndex,onItemTapped){
  return BottomNavigationBar(
      items:[
        BottomNavigationBarItem(icon:Icon( Icons.list_alt),label:"New" ),
        BottomNavigationBarItem(icon:Icon( Icons.access_alarms_rounded),label:"Progress" ),
        BottomNavigationBarItem(icon:Icon( Icons.check_box_outlined),label:"Complete" ),
        BottomNavigationBarItem(icon:Icon( Icons.cancel_outlined),label:"Canceled" ),
      ],
    selectedItemColor:colorGreen,
    unselectedItemColor:colorLightGray ,
    currentIndex:currentIndex ,
    showSelectedLabels: true,
    showUnselectedLabels: true,
    onTap: onItemTapped,
    type:BottomNavigationBarType.fixed,
  );
}
