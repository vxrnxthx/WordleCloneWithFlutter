import 'package:flutter/material.dart';

class WordleLetterbox extends StatelessWidget {
  final int pos;
  final String letter;
  final String correctWord;
  final bool attempted;
  const WordleLetterbox (
      {Key? key, required this.letter, required this.attempted, required this.correctWord, required this.pos}
      ) : super(key: key);
  Color? getBgColor() {
    print("$correctWord $letter $pos");
    if (!attempted) {
      return null;
    }
    // Create a list to track whether each letter in the correctWord has been matched
    List<bool> matched = List.filled(correctWord.length, false);
    // Check for an exact match (green)
    if (correctWord[pos] == letter && !matched[pos]) {
      matched[pos] = true;
      return Colors.green;
    }
    // Check for the presence of the letter (yellow)
    for (int i = 0; i < correctWord.length; i++) {
      if (correctWord[i] == letter && !matched[i]) {
        matched[i] = true;
        return Colors.yellowAccent;
      }
    }
    // If the letter is not in the correct word
    return Colors.grey;
  }

BoxBorder? getBorder(){
  if(!attempted){ return Border.all(
      color: Colors.grey, width: 2
  ); }
  return Border.all(color: Colors.transparent, width: 2);

}
Color? getTextColor(){
  if(!attempted){ return Colors.black87; }
  return Colors.white;
}
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      alignment: Alignment.center,
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(

        border: getBorder(),
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: getBgColor(),
      ),
      child: Text(
        letter.toUpperCase(),
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: getTextColor()), ),
    );
  }
}
