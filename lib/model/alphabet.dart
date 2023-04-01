import 'package:diacritic/diacritic.dart';
import 'package:flutter/material.dart';

class Alphabet {
  final String name;
  final Map<String, int> _letterToNumber;

  const Alphabet({required this.name, required Map<String, int> letterToNumber})
      : _letterToNumber = letterToNumber;

  const Alphabet.latinNaturalOrder()
      : name = 'Latin Natural Order',
        _letterToNumber = const {
          'A': 1,
          'B': 2,
          'C': 3,
          'D': 4,
          'E': 5,
          'F': 6,
          'G': 7,
          'H': 8,
          'I': 9,
          'J': 9,
          'K': 10,
          'L': 11,
          'M': 12,
          'N': 13,
          'O': 14,
          'P': 15,
          'Q': 16,
          'R': 17,
          'S': 18,
          'T': 19,
          'U': 20,
          'V': 20,
          'W': 0,
          'X': 21,
          'Y': 22,
          'Z': 23,
        };

  const Alphabet.latinNaturalOrder1()
      : name = 'Latin Natural Order #1',
        _letterToNumber = const {
          'A': 1,
          'B': 2,
          'C': 3,
          'D': 4,
          'E': 5,
          'F': 6,
          'G': 7,
          'H': 8,
          'I': 9,
          'J': 9,
          'K': 10,
          'L': 11,
          'M': 12,
          'N': 13,
          'O': 14,
          'P': 15,
          'Q': 16,
          'R': 17,
          'S': 18,
          'T': 19,
          'U': 20,
          'V': 20,
          'W': 21,
          'X': 22,
          'Y': 23,
          'Z': 24,
        };

  const Alphabet.latinNaturalOrder2()
      : name = 'Latin Natural Order #2',
        _letterToNumber = const {
          'A': 1,
          'B': 2,
          'C': 3,
          'D': 4,
          'E': 5,
          'F': 6,
          'G': 7,
          'H': 8,
          'I': 9,
          'J': 9,
          'K': 10,
          'L': 11,
          'M': 12,
          'N': 13,
          'O': 0,
          'P': 14,
          'Q': 15,
          'R': 16,
          'S': 17,
          'T': 18,
          'U': 19,
          'V': 20,
          'W': 20,
          'X': 21,
          'Y': 22,
          'Z': 23,
        };

  const Alphabet.latinNaturalOrder3()
      : name = 'Latin Natural Order #3',
        _letterToNumber = const {
          'A': 1,
          'B': 2,
          'C': 3,
          'D': 4,
          'E': 5,
          'F': 6,
          'G': 7,
          'H': 8,
          'I': 9,
          'J': 9,
          'K': 0,
          'L': 10,
          'M': 11,
          'N': 12,
          'O': 13,
          'P': 14,
          'Q': 15,
          'R': 16,
          'S': 17,
          'T': 18,
          'U': 19,
          'V': 20,
          'W': 0,
          'X': 20,
          'Y': 21,
          'Z': 22,
        };

  static const List<Alphabet> alphabets = [
    Alphabet.latinNaturalOrder(),
    Alphabet.latinNaturalOrder1(),
    Alphabet.latinNaturalOrder2(),
    Alphabet.latinNaturalOrder3(),
  ];

  int? numericValueOfLetter(String letter) =>
      _letterToNumber[removeDiacritics(letter).toUpperCase()];

  bool containsLetter(String letter) => numericValueOfLetter(letter) != null;

  int numericValueOfName(String name) => name.characters.fold(
        0,
        (previousValue, letter) =>
            previousValue + (numericValueOfLetter(letter) ?? 0),
      );
}
