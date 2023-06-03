import 'package:music_notes/music_notes.dart';
import 'package:note_names/model/alphabet.dart';
import 'package:note_names/model/cryptogram_scheme.dart';

class Name {
  final String name;
  final Alphabet alphabet;
  final CryptogramScheme scheme;

  const Name(
    this.name, {
    this.alphabet = const Alphabet.latinNaturalOrder1(),
    this.scheme = const CryptogramScheme.german(),
  });

  int get numericValue => alphabet.numericValueOfName(name);

  List<Note> get musicalCryptogram => scheme.cryptogramOf(name);

  Name copyWith({String? name, Alphabet? alphabet, CryptogramScheme? scheme}) =>
      Name(
        name ?? this.name,
        alphabet: alphabet ?? this.alphabet,
        scheme: scheme ?? this.scheme,
      );

  @override
  bool operator ==(Object other) =>
      other is Name && name == other.name && alphabet == other.alphabet;

  @override
  int get hashCode => Object.hash(name, alphabet.hashCode);
}
