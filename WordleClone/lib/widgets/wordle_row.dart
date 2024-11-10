import 'package:flutter/cupertino.dart';
import 'package:untitled/widgets/wordle_letterbox.dart';
const wordsize=5;

class WordleRow extends StatelessWidget {
  const WordleRow({super.key});

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
