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
            for(var i in "QWERTYUIOP".split(""))
              WordleKey(i)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for(var i in "ASDFGHJKL".split(""))
              WordleKey(i)
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            for(var i in "_ZXCVBNM<".split(""))
              WordleKey(i)

          ],
        )
      ],
    );
  }
}
