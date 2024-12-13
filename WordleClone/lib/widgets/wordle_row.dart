import 'package:flutter/cupertino.dart';
import 'package:untitled/widgets/wordle_letterbox.dart';

class WordleRow extends StatelessWidget {
  final int wordsize;
  const WordleRow({Key? key, required this.wordsize}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<WordleLetterbox> boxes = List.empty(growable: true);
    for(int j=0;j<wordsize;j++) {
      boxes.add(const WordleLetterbox());
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: boxes,
    );
  }
}
