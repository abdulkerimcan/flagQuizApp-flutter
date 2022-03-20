import 'dart:collection';

import 'package:flag_quiz_app/FinalPage.dart';
import 'package:flag_quiz_app/FlagsDao.dart';
import 'package:flutter/material.dart';

import 'Flags.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var questions = <Flags>[];
  var falseChoices = <Flags>[];
  Flags? correctQuestion = null;
  var allChoices = HashSet<Flags>();

  int questionCount = 0;
  int correctCount = 0;
  int wrongCount = 0;

  String flagimgName = "placeholder.jpg";
  String buttonAtext = "";
  String buttonBtext = "";
  String buttonCtext = "";
  String buttonDtext = "";

  @override
  void initState() {
    super.initState();

    getQuestions();
  }

  Future<void> getQuestions() async {
    questions = await FlagsDao().getRandomly10();
    uploadQuestion();
  }

  Future<void> uploadQuestion() async {
    correctQuestion = questions[questionCount];
    flagimgName = correctQuestion!.flag_img;

    falseChoices = await FlagsDao().getRandomly3(correctQuestion!.flag_id);

    allChoices.clear();
    allChoices.add(falseChoices[0]);
    allChoices.add(falseChoices[1]);
    allChoices.add(falseChoices[2]);
    allChoices.add(correctQuestion!);

    buttonAtext = allChoices.elementAt(0).flag_name;
    buttonBtext = allChoices.elementAt(1).flag_name;
    buttonCtext = allChoices.elementAt(2).flag_name;
    buttonDtext = allChoices.elementAt(3).flag_name;

    setState(() {});
  }

  void questionCountControl() {
    questionCount++;

    if (questionCount != 10) {
      uploadQuestion();
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => FinalPage(trueCount: correctCount)));
    }
  }

  void correctControl(String buttonText) {
    if (correctQuestion!.flag_name == buttonText) {
      correctCount++;
    } else {
      wrongCount++;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Page "),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Correct : $correctCount",
                  style: TextStyle(fontSize: 20,color: Colors.deepPurple,fontWeight: FontWeight.bold),
                ),
                Text(
                  "Wrong : $wrongCount",
                  style: TextStyle(fontSize: 20,color: Colors.deepPurple,fontWeight: FontWeight.bold),
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                questionCount != 10
                    ? Text(
                        "Question ${questionCount + 1}",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold,color: Colors.deepPurple),
                      )
                    : Text(
                        "Question 10",
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold,color: Colors.deepPurple),
                      ),
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, right: 24.0),
                  child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black)
                      ),
                      height: 250,
                      width: 350,
                      child: Image.asset("images/$flagimgName",fit: BoxFit.fill,)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          correctControl(buttonAtext);
                          questionCountControl();
                        },
                        child: Text(buttonAtext),
                      style:
                      ElevatedButton.styleFrom(primary: Colors.deepPurple),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        correctControl(buttonBtext);
                        questionCountControl();
                      },
                      child: Text(buttonBtext),
                      style:
                          ElevatedButton.styleFrom(primary: Colors.deepPurple),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          correctControl(buttonCtext);
                          questionCountControl();
                        },
                        child: Text(buttonCtext),
                      style:
                      ElevatedButton.styleFrom(primary: Colors.deepPurple),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    height: 50,
                    width: 200,
                    child: ElevatedButton(
                        onPressed: () {
                          correctControl(buttonDtext);
                          questionCountControl();
                        },
                        child: Text(buttonDtext),
                      style:
                      ElevatedButton.styleFrom(primary: Colors.deepPurple),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
