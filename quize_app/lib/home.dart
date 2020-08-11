import 'package:flutter/material.dart';
import 'package:quize_app/about.dart';
import 'package:quize_app/quizePage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> proImages = [
    "assets/images/py.png",
    "assets/images/java.png",
    "assets/images/js.png",
    "assets/images/cpp.png",
    "assets/images/linux.png",
  ];


  List <String> allJsonFiles = [
    "assets/json/python.json",
    "assets/json/java.json",
    "assets/json/js.json",
    "assets/json/cpp.json",
    "assets/json/linux.json",
  ];

  List<String> langName = [
    "Python",
    "Java",
    "JavaScript",
    "C++",
    "Linux",
  ];

  List <Color> cardColor = [
    Colors.redAccent.shade400,
    Colors.blue,
    Colors.cyan,
    Colors.deepOrange,
    Colors.teal,
  ];
  List<String> des = [
    "Python is one of the most popular and fastest programming language since half a decade.\nIf You think you have learnt it.. \nJust test yourself !!",
    "Java has always been one of the best choices for Enterprise World. If you think you have learn the Language...\nJust Test Yourself !!",
    "Javascript is one of the most Popular programming language supporting the Web.\nIt has a wide range of Libraries making it Very Powerful !",
    "C++, being a statically typed programming language is very powerful and Fast.\nit's DMA feature makes it more useful. !",
    "Linux is a OPEN SOURCE Operating System which powers many Servers and Workstation.\nIt is also a top Priority in Developement Work !",
  ];

  // Card designing
  Widget subjectCard(_image, _langName, _des, _color, jsonFile) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.2,
        horizontal: 30.4,
      ),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Quize(jsonFile: jsonFile,),
          ));
        },
        borderRadius: BorderRadius.circular(25.0),
        child: Material(
          elevation: 10.2,
          borderRadius: BorderRadius.circular(25.0),
          color: _color,
          child: Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Material(
                    elevation: 6.2,
                    borderRadius: BorderRadius.circular(75.0),
                    child: Container(
                      height: 150.0,
                      width: 150.0,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage(_image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    _langName,
                    style: TextStyle(
                      fontSize: 25.3,
                      color: Colors.white,
                      fontFamily: "Quando",
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20.2),
                  child: Text(
                    _des,
                    style: TextStyle(
                      fontSize: 18.2,
                      color: Colors.white,
                      fontFamily: "Alike",
                    ),
                    maxLines: 5,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Quize",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        automaticallyImplyLeading: false,

        actions: [
          IconButton(
            icon: Icon(
              Icons.info,
            ),
            onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) => About(),
            )),
          ),
        ],
      ),
      backgroundColor: Colors.brown.shade800,
      body: ListView(
        children: [
          subjectCard(proImages[0], langName[0], des[0], cardColor[0], allJsonFiles[0]),
          subjectCard(proImages[1], langName[1], des[1], cardColor[1], allJsonFiles[1]),
          subjectCard(proImages[2], langName[2], des[2], cardColor[2], allJsonFiles[2]),
          subjectCard(proImages[3], langName[3], des[3], cardColor[3], allJsonFiles[3]),
          subjectCard(proImages[4], langName[4], des[4], cardColor[4], allJsonFiles[3]),
        ],
      ),
    );
  }
}
