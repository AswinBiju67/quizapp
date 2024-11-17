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
int? selectedAnswerIndex;
int score=0;
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
              if(selectedAnswerIndex==null){
                selectedAnswerIndex=index;
                if(selectedAnswerIndex==Dummydb().questions[currentQuestionIndex]["Answerindex"]){
                  score++;
                }
              setState(() {
              });
              }
              
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border.all(
                    color:getcolor(index), width: 2),
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
        if(selectedAnswerIndex!=null)
        InkWell(
          onTap: () {
            if(selectedAnswerIndex!=null){            
             setState(() {
              if(currentQuestionIndex<Dummydb().questions.length-1){              
                currentQuestionIndex++;
                selectedAnswerIndex=null;
              }else{
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => LastScreen(score: score,),));}
            });
                
            }
          },
          child: Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(5)
            ),
            child: Center(child: Text(currentQuestionIndex==12?"Get Score":"Next",style: TextStyle(color: Colors.white),)),
          ),
        )
      ],
              ),
            ),
    );
  }
  Color getcolor(int clickindex){
    if(selectedAnswerIndex !=null){
      if(Dummydb().questions[currentQuestionIndex]["Answerindex"]==clickindex){
         return Colors.green;
      }
    }
    if(selectedAnswerIndex==clickindex){
      if(selectedAnswerIndex == Dummydb().questions[currentQuestionIndex]["Answerindex"]){
        return Colors.green;
      }
      else{
        return Colors.red;
      }
    }else{
      return Colors.grey;
    }
    }
}
