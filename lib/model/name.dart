import 'package:note_names/model/alphabet.dart';

class Name {
  final String name;
  final Alphabet alphabet;

  const Name(
    this.name, {
    this.alphabet = const Alphabet.latinNaturalOrder1(),
  });

  int get numericValue => alphabet.numericValueOfName(name);

  Name copyWith({String? name, Alphabet? alphabet}) => Name(
        name ?? this.name,
        alphabet: alphabet ?? this.alphabet,
      );
}
