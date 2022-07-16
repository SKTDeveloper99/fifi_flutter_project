import 'package:fifi_flutter_project/app_screens/question_model.dart';
import 'package:fifi_flutter_project/game/display_money.dart';
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

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex == listLength - 1) {
      isLastQuestion = true;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beginner Quiz !"),
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
                return Question(
                    nextQuestion["Question"].toString(), loveList);
              }));
              question = list[currentQuestionIndex].questionText;
              answer1 =
                  list[currentQuestionIndex].answersList[0].getAnswer();
              correct1 = list[currentQuestionIndex].answersList[0].getCorrect();
              answer2 =
                  list[currentQuestionIndex].answersList[1].getAnswer();
              correct2 = list[currentQuestionIndex].answersList[1].getCorrect();
              answer3 =
                  list[currentQuestionIndex].answersList[2].getAnswer();
              correct3 = list[currentQuestionIndex].answersList[2].getCorrect();
              answer4 =
                  list[currentQuestionIndex].answersList[3].getAnswer();
              correct4 = list[currentQuestionIndex].answersList[3].getCorrect();
              listLength = list.length;
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
                    question,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 40),
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: Colors.orangeAccent,
                        ),
                        child: Text(
                          answer1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {
                          if (correct1 == true) {
                            score++;
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: Colors.orangeAccent,
                        ),
                        child: Text(
                          answer2,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {
                          if (correct2 == true) {
                            score++;
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: Colors.orangeAccent,
                        ),
                        child: Text(
                          answer3,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {
                          if (correct3 == true) {
                            score++;
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: Colors.orangeAccent,
                        ),
                        child: Text(
                          answer4,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {
                          if (correct4 == true) {
                            score++;
                          }
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 150,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      height: 48,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: const StadiumBorder(),
                          primary: Colors.blue,
                        ),
                        child: Text(
                          isLastQuestion ? "Submit" : "Next",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {
                          if (isLastQuestion == true) {
                            print(score);
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const DisplayMoney()));
                          }
                          else {
                            setState(() {
                              currentQuestionIndex++;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
