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
        children: [
          for (final letter in name.name.characters)
            if (name.alphabet.containsLetter(letter))
              AlphabetLetter(
                letter: letter,
                value: name.alphabet.valueOfLetter(letter),
              )
            else
              const SizedBox(width: 24),
        ],
      ),
    );
  }
}
