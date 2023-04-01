import 'package:flutter/material.dart';
import 'package:note_names/model/name.dart';
import 'package:note_names/widgets/alphabet_letter.dart';

class NameLabels extends StatelessWidget {
  final Name name;

  const NameLabels({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: WrapAlignment.center,
        runSpacing: 8,
        crossAxisAlignment: WrapCrossAlignment.end,
        children: [
          for (final character in name.name.characters)
            if (character == ' ')
              const SizedBox(width: 24)
            else
              AlphabetLetter(
                letter: character,
                value: name.alphabet.valueOfLetter(character),
                isDimmed: !name.alphabet.containsLetter(character),
              ),
        ],
      ),
    );
  }
}
