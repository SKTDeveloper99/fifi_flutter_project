import 'package:fifi_flutter_project/app_screens/question_model.dart';
import 'package:fifi_flutter_project/app_screens/splash_screen_finish.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class BeginnerMode extends StatefulWidget {
  const BeginnerMode({Key? key}) : super(key: key);

  @override
  State<BeginnerMode> createState() => _BeginnerModeState();
}

class _BeginnerModeState extends State<BeginnerMode> {
  int currentQuestionIndex = 0;
  int score = 0;
  bool isLastQuestion = false;
  DatabaseReference db = FirebaseDatabase.instance.ref();
  String question = "";
  String answer1 = "";
  String answer2 = "";
  String answer3 = "";
  String answer4 = "";
  bool correct1 = false;
  bool correct2 = false;
  bool correct3 = false;
  bool correct4 = false;
  int listLength = 0;
  List<Question> listExport = [];

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex == listLength - 1) {
      isLastQuestion = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Intermediate Mode Quiz !"),
      ),
      backgroundColor: const Color(0xFF85FF70),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
        child: StreamBuilder(
          stream: db
              .child('Questions/beginner')
              .orderByKey()
              .onValue,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final List<Question> list = [];
              final questionList = Map<String, dynamic>.from(
                  (snapshot.data! as DatabaseEvent).snapshot.value as Map);
              list.addAll(questionList.values.map((value) {
                final nextQuestion = Map<String, String>.from(value);
                List<Answer> loveList = [
                  Answer(nextQuestion["Answer"].toString(), true),
                  Answer(nextQuestion["Answer 1"].toString(), false),
                  Answer(nextQuestion["Answer 2"].toString(), false),
                  Answer(nextQuestion["Answer 3"].toString(), false),
                ];
                loveList.shuffle();
                return Question(nextQuestion["Question"].toString(), loveList);
              }));
              listLength = list.length;
              listExport.addAll(list);
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Question ${currentQuestionIndex + 1} / ${(listLength)}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.all(32),
                  decoration: BoxDecoration(
                    color: Colors.orangeAccent,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    listExport[currentQuestionIndex].questionText,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Flexible(
                  child: ListView.separated(
                    padding: const EdgeInsets.all(8),
                    itemCount: listExport[currentQuestionIndex].answersList.length,
                    itemBuilder: (BuildContext context, int index) {
                      final List<int> colorCodes = <int>[600, 500, 400,300];
                      final List<bool> _selected = List.generate(listExport[currentQuestionIndex].answersList.length, (i) => false);
                      return ListTile(
                        tileColor: _selected[index] ? Colors.blue: Colors.amber[colorCodes[index]],
                        title: Center(child: Text(listExport[currentQuestionIndex].answersList[index].answerText)),
                        onTap: () {
                          setState(
                                () => _selected[index] = !_selected[index],
                          );
                          if(listExport[currentQuestionIndex].answersList[index].isCorrect == true) {
                              setState(() {
                                currentQuestionIndex++;
                                score++;
                              }
                              );
                          }
                          else {
                            currentQuestionIndex++;
                          }
                          if(isLastQuestion == true){
                            setState((){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context) => SplashScreenFinish(score: score * 30,)));
                            });
                          }
                        },
                      );

                    },
                    separatorBuilder: (BuildContext context, int index) => const Divider(height: 25,),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}