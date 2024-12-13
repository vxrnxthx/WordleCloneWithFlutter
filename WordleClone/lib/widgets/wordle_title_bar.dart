import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled/providers/game_settings_provider.dart';

class WordleTitleBar extends StatelessWidget {
  const WordleTitleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          WordAttemptsToggle(),
          Text("WORDLE", style: TextStyle(
            fontSize: 35,
            fontFamily: 'Helvetica',
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),
          ),
          WordSizeToggle(),
        ],
      ),
    );
  }
}

class WordSizeToggle extends ConsumerWidget{
  const WordSizeToggle({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    final gameSettings = ref.watch(gameSettingsProvider);
    final gameSettingsNotifier = ref.read(gameSettingsProvider.notifier);
    void updateWordSize(){
      var newWordSize =5;
      if(gameSettings.wordsize == 4) newWordSize=5;
      if(gameSettings.wordsize == 5) newWordSize=6;
      if(gameSettings.wordsize == 6) newWordSize=4;
      gameSettingsNotifier.updateWordsize(newWordSize);
    }
    return Container(
      margin: EdgeInsets.fromLTRB(40, 0, 0, 0),
      child: OutlinedButton(
          onPressed: updateWordSize,
          child: Text(gameSettings.wordsize.toString()),
      ),
    );
  }
}

class WordAttemptsToggle extends ConsumerWidget{
  const WordAttemptsToggle({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build
    final gameSettings = ref.watch(gameSettingsProvider);
    final gameSettingsNotifier = ref.read(gameSettingsProvider.notifier);
    void updateAttempts(){
      var newAttempts = 6;
      if(gameSettings.attempts == 4) newAttempts=5;
      if(gameSettings.attempts == 5) newAttempts=6;
      if(gameSettings.attempts == 6) newAttempts=4;
      gameSettingsNotifier.updateAttempts(newAttempts);
    }
    String text;
    switch(gameSettings.attempts){
      case 4: text = "H"; break;
      case 5: text = "M"; break;
      case 6:default: text = "L"; break;

    }
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 30, 0),
      child: OutlinedButton(
        onPressed: updateAttempts,
        child: Text(text),
      ),
    );
  }
}