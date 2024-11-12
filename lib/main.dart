import 'package:flutter/material.dart';
import 'package:quizapp/view/Screen_one/Screen_one.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ScreenOne() ,
    );
  }
}