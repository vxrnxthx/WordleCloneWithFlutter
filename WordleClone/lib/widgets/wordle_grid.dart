import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/providers/game_settings_provider.dart';
import 'package:untitled/providers/game_state_provider.dart';
//import 'package:untitled/widgets/wordle_letterbox.dart';
import 'package:untitled/widgets/wordle_row.dart';
//const wordsize = 5;
//const rows=6;
class WordleGrid extends ConsumerWidget {
  const WordleGrid({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref){
    final gameSettings = ref.watch(gameSettingsProvider);
    final gameState = ref.watch(gameStateProvider);
    final wordsize = gameSettings.wordsize;
    final List<WordleRow> rows = List.empty(growable: true);
    for(int i=0;i<gameSettings.attempts;i++){
      var word="";
      if(gameState.attempts.length > i){
        word=gameState.attempts[i];
      }
      var attempted = false;
      if(gameState.attempted > i){
        attempted = true;
      }
      rows.add(WordleRow(wordsize: wordsize, word: word, attempted: attempted, correctWord: gameState.correctWord,));
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: rows,
      ),
    );
  }
}