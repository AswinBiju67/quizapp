import 'package:flutter/material.dart';
import 'package:quizapp/view/Screen_one/Screen_one.dart';

class LastScreen extends StatefulWidget {
  const LastScreen({super.key});

  @override
  State<LastScreen> createState() => _LastScreenState();
}

class _LastScreenState extends State<LastScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: List.generate(3, (index) => 
              Padding(
                padding:  EdgeInsets.only(left: 15,right: 15,bottom: index == 1 ? 30 : 0),
                child: Icon(Icons.star,color: Colors.grey,
                size: index== 1 ? 70 : 40,),
              ),),),
              SizedBox(height: 10,),
              Text("Congratulations",style: TextStyle(color: Colors.yellow,fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              Text("Your Score",style: TextStyle(color: Colors.grey,fontSize: 17,fontWeight: FontWeight.bold),),
              Text("6 / 13",style: TextStyle(color: Colors.yellow,fontSize: 25,fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ScreenOne(),));
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.restart_alt),
                      SizedBox(width: 5,),
                      Text("Retry",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25
                      ),),
                    ],
                  ),
                ),
              )
              
        
            ],
          )),
      ),
    );
  }
}