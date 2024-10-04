import 'package:flutter/material.dart';

class newTaskListScreen extends StatefulWidget {
  const newTaskListScreen({super.key});

  @override
  State<newTaskListScreen> createState() => _newTaskScreenState();
}

class _newTaskScreenState extends State<newTaskListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text("New tassk Screen") ,),
      body: Center(

      ),
    );
  }
}
