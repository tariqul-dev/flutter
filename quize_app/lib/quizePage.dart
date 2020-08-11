import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quize_app/result.dart';

class Quize extends StatelessWidget {
  final jsonFile;
  Quize({Key key, @required this.jsonFile}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: DefaultAssetBundle.of(context).loadString(jsonFile),
        builder: (context, snapshot) {
          var data = json.decode(snapshot.data.toString());
          if (data != null) {
            return QuizeQuestion(
              data: data,
            );
          } else {
            return Text(
              "Loading ...",
            );
          }
        },
      ),
    );
  }
}

class QuizeQuestion extends StatefulWidget {
  final data;
  QuizeQuestion({Key key, @required this.data}) : super(key: key);
  @override
  _QuizeQuestionState createState() => _QuizeQuestionState(data);
}

class _QuizeQuestionState extends State<QuizeQuestion> {
  final data;
  int i = 1;
  int marks = 0;
  int timer = 30;
  String showTime = "30";
  bool isCanceled = false;

  Color btnColor = Colors.cyan;
  Color right = Colors.green;
  Color wrong = Colors.red;

  Map<String, Color> btnColorDict = {
    'a': Colors.teal,
    'b': Colors.teal,
    'c': Colors.teal,
    'd': Colors.teal,
  };

  _QuizeQuestionState(this.data);

  @override
  void initState() {
    setTimer();
    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  // Timer function
  void setTimer() async {
    Timer.periodic(Duration(seconds: 1), (Timer t) {
      setState(() {
        if (timer < 1) {
          t.cancel();
          nextQuestion();
        } else if (isCanceled == true) {
          t.cancel();
        } else {
          timer = timer - 1;
        }
        showTime = timer.toString();
      });
    });
  }

  // next question logic
  void nextQuestion() {
    setState(() {
      isCanceled = false;
      timer = 30;
      showTime = timer.toString();
      if (i < 10) {
        print(i);
        i++;
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ResultPage(marks: marks),
            ));
      }
      btnColorDict['a'] = Colors.teal;
      btnColorDict['b'] = Colors.teal;
      btnColorDict['c'] = Colors.teal;
      btnColorDict['d'] = Colors.teal;
    });
    setTimer();
  }

  // checking answer function
  void checkAnswer(btnName) {
    if (data[1][i.toString()][btnName] == data[2][i.toString()]) {
      btnColor = right;
      if (isCanceled == false) {
        marks += 10;
      }
    } else {
      btnColor = wrong;
    }

    if (isCanceled == false) {
      setState(() {
        btnColorDict[btnName] = btnColor;
        Timer(Duration(seconds: 2), () {
          nextQuestion();
        });
      });
      isCanceled = true;
    }
  }

  // button design
  Widget optionButton(btnName) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 19.3,
        horizontal: 8.0,
      ),
      child: MaterialButton(
        onPressed: () => checkAnswer(btnName),
        child: Text(
          data[1][i.toString()][btnName],
          style: TextStyle(
            color: Colors.white,
            fontSize: 16.0,
            fontFamily: "Alike",
            fontWeight: FontWeight.w600,
          ),
          maxLines: 1,
        ),
        color: btnColorDict[btnName],
        minWidth: 180.3,
        height: 70.0,
        splashColor: Colors.cyan,
        highlightColor: Colors.cyanAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              "Warning!!",
            ),
            content: Text(
              "You can not go back now. You must play",
            ),
            actions: [
              FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  "OK",
                ),
              )
            ],
          ),
        );
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Quize Question",
          ),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.brown.shade900,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // questions display
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.all(10.2),
                child: Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  alignment: Alignment.center,
                  child: Material(
                    elevation: 10.0,
                    borderRadius: BorderRadius.circular(20.0),
                    color: Colors.brown,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        height: 400,
                        alignment: Alignment.center,
                        child: Text(
                          data[0][i.toString()],
                          style: TextStyle(
                            fontFamily: "Quando",
                            fontSize: 16.0,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            // options display
            Expanded(
              flex: 6,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                alignment: Alignment.bottomLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            optionButton('a'),
                            optionButton('b'),
                          ],
                        ),
                        Column(
                          children: [
                            optionButton('c'),
                            optionButton('d'),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // timer display
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.topCenter,
                child: Text(
                  showTime,
                  style: TextStyle(
                    fontSize: 40.3,
                    fontFamily: "Alike",
                    fontWeight: FontWeight.w700,
                    letterSpacing: 4,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
