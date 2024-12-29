import 'package:flutter/cupertino.dart';
import 'package:untitled/widgets/wordle_key.dart';

class WordleKeyboard extends StatelessWidget {
  const WordleKeyboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for(var i in "qwertyuiop".split(""))
              WordleKey(i)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for(var i in "asdfghjkl".split(""))
              WordleKey(i)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            for(var i in "_zxcvbnm<".split(""))
              WordleKey(i)

          ],
        )
      ],
    );
  }
}
