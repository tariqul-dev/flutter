import 'package:flutter/material.dart';

class About extends StatelessWidget {
  final String details =
      "Md. Tariqul Islam\nBSC in CSE\ntariqulislamkst96@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Developer Details",
        ),
      ),
      backgroundColor: Colors.teal.shade900,
      body: Container(
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
                    padding: const EdgeInsets.all(40.0),
                    child: Material(
                      elevation: 7.0,
                      color: Colors.teal.shade300,
                      child: Container(
                        width: 250.2,
                        height: 250.2,
                        child: ClipRect(
                              child: Image(
                                image: AssetImage(
                                  "assets/images/profile.jpg"
                                ),
                              ),
                            ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 10),
                      child: Text(
                        "Md. Tariqul Islam",
                        style: TextStyle(
                          fontFamily: "Quando",
                          fontSize: 24.0,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "BSE in Computer Science and Engineering\ntariqulislamkst96@gmail.com",
                        style: TextStyle(
                          fontFamily: "Alike",
                          fontSize: 18.0,
                          letterSpacing: 2,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
