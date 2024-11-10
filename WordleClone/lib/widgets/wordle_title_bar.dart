import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WordleTitleBar extends StatelessWidget {
  const WordleTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("WORDLE", style: TextStyle(
            fontSize: 35,
            fontFamily: 'Helvetica',
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
          ),
        ],
      ),
    );
  }
}