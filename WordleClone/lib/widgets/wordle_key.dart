import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/providers/game_state_provider.dart';
class WordleKey extends ConsumerWidget {
  final String letter;
  const WordleKey (this.letter, {Key? key}) : super(key : key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget keyCap;
    double w=50;
    if(letter=="_")
      keyCap=Icon(Icons.keyboard_return_outlined, color: Colors.white, size: 18,);
    else if (letter=="<")
        keyCap=Icon(Icons.backspace_outlined, color: Colors.white, size: 18,);
    else {
      w=35;
      keyCap = Text(letter.toUpperCase(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w100,
          fontFamily: 'Roboto',
          color: Colors.white,
        ),);
    }

    return InkWell(
      onTap: (){
        ref.read(gameStateProvider.notifier).updateCurrentAttempt(letter);
      },
      child: Container(
        height: 40,
        width: w,
        alignment: Alignment.center,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4)),
          color: Colors.black87,
          border: Border.all(
              color: Colors.black54, width: 2
          ),
        ),
        child: keyCap,
      ),
    );

  }
}
