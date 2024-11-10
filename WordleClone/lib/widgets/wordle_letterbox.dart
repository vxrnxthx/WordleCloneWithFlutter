import 'package:flutter/material.dart';

class WordleLetterbox extends StatelessWidget {
  const WordleLetterbox ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      alignment: Alignment.center,
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(

        border: Border.all(
          color: Colors.grey, width: 2
        ),
      ),
      child: Text(" "),
    );
  }
}
