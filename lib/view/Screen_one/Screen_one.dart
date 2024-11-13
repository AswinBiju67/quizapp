import 'package:flutter/material.dart';
import 'package:quizapp/view/dummydb.dart';
import 'package:quizapp/view/last_screen/last_screen.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
int currentQuestionIndex = 0;  
int? Answerindex;
int? selectedAnswerIndex;
int? correctAnswerIndex;
bool answered = false;
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(actions: [Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Text("${Dummydb().number[currentQuestionIndex]}/ 13",style: TextStyle(color: Colors.white),),
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
                                Dummydb().questions[currentQuestionIndex]["Question"],
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                                textAlign: TextAlign.center,
                              ),
                )),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Column(children: List.generate(4, (index) =>  Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: () {
              if(answered)return;
              Answerindex=index;
              correctAnswerIndex = Dummydb().questions[currentQuestionIndex]["Answerindex"];
              answered = true;
              setState(() {
                
              });
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color:Answerindex==index?(correctAnswerIndex== index ?Colors.greenAccent:Colors.red):(correctAnswerIndex == index ? Colors.greenAccent : Colors.black), width: 2),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                Dummydb().questions[currentQuestionIndex]["Options"][index],
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.circle_outlined,color: Colors.white,),
                  ],
                ),
              ),
            ),
          ),
        ),),),
        InkWell(
          onTap: () {
            
            setState(() {
              if(currentQuestionIndex<Dummydb().questions.length-1){              
                currentQuestionIndex++;
                Answerindex=null;
                correctAnswerIndex=null;
                answered=false;
              }else{
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => LastScreen(),));}
            });
          },
          child: Container(
            height: 30,
            width: 60,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5)
            ),
            child: Center(child: Text("NEXT",style: TextStyle(color: Colors.white),)),
          ),
        )
      ],
              ),
            ),
    );
  }
}
