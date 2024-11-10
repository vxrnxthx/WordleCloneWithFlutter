
import 'package:flutter/material.dart';
import 'package:untitled/widgets/wordle_grid.dart';
import 'package:untitled/widgets/wordle_keyboard.dart';
import 'package:untitled/widgets/wordle_title_bar.dart';

class WordlePage extends StatelessWidget {
  const WordlePage({Key? key}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WordleTitleBar(),
            WordleGrid(),
            WordleKeyboard()
          ],
        ),
      ),
    );
  }
}
