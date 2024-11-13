import 'package:flutter/material.dart';
import 'package:quizapp/view/dummydb.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
  String? radiobatton;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(actions: [Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Text("1 / 13",style: TextStyle(color: Colors.white),),
      )],backgroundColor: Colors.black,),
      body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
      children: [
        Expanded(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey,
            ),
            child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                                Dummydb().questions[0]["Question"],
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                              ),
                )),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(children: List.generate(4, (index) =>  Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 2),
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
              Dummydb().questions[0]["Options"][index],
                    style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                  ),
                  Icon(Icons.circle_outlined,color: Colors.white,),
                ],
              ),
            ),
          ),
        ),),),
        Container(
          height: 30,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(5)
          ),
          child: Center(child: Text("NEXT",style: TextStyle(color: Colors.white),)),
        )
      ],
              ),
            ),
    );
  }
}
