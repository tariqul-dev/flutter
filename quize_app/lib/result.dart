import 'package:flutter/material.dart';
import 'package:quize_app/home.dart';

class ResultPage extends StatefulWidget {
  final int marks;
  ResultPage({Key key, @required this.marks}) : super(key: key);
  @override
  _ResultPageState createState() => _ResultPageState(marks);
}

class _ResultPageState extends State<ResultPage> {
  final int marks;
  _ResultPageState(this.marks);

  List<String> images = [
    "assets/images/success.png",
    "assets/images/good.png",
    "assets/images/bad.png",
  ];

  String resImage;
  String message;

  @override
  void initState() {
    super.initState();

    if (marks >= 70) {
      resImage = images[0];
      message = "Congratutations!!\nAmazing performance\nScore : $marks";
    } else if (marks >= 50) {
      resImage = images[1];
      message = "Good!!\nYou need to study more\nScore : $marks";
    } else {
      resImage = images[2];
      message = "Bad!!\nPoor performance\nScore : $marks";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Result",
        ),
        automaticallyImplyLeading: false,
      ),
      backgroundColor: Colors.teal.shade900,
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.all(38.0),
              child: Material(
                elevation: 10.0,
                color: Colors.teal.shade700,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .75,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Material(
                          elevation: 7.0,
                          color: Colors.teal.shade300,
                          child: Container(
                            width: 250.2,
                            height: 250.2,
                            child: ClipRect(
                              child: Image(
                                image: AssetImage(
                                  resImage,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Text(
                            message,
                            style: TextStyle(
                              fontFamily: "Quando",
                              fontSize: 18.0,
                              letterSpacing: 2,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(28.0),
                child: MaterialButton(
                  shape: Border.all(
                    style: BorderStyle.solid,
                    color: Colors.blue,
                  ),
                  child: Text(
                    "Continue",
                    style: TextStyle(
                      fontSize: 20.2,
                      fontFamily: "Alike",
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ));
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
