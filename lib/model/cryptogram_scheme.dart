import 'dart:collection' show SplayTreeMap;

import 'package:music_notes/music_notes.dart';

class CryptogramScheme {
  final String name;
  final Map<String, Note> patterns;

  /// Under this scheme the vowel sounds in the text are matched to the vowel
  /// sounds of the solmization syllables of Guido of Arezzo (where 'ut' is the
  /// root, which we now call 'do', [Note.c]).
  ///
  /// See [Musical cryptogram](https://en.wikipedia.org/wiki/Musical_cryptogram#Syllables_to_solmization_names).
  const CryptogramScheme.solmization()
      : name = 'Solmization',
        patterns = const {
          'do|ut': Note.c,
          're': Note.d,
          'mi': Note.e,
          'fa': Note.f,
          'sol?': Note.g,
          'la': Note.a,
          '(t|s)i': Note.b,
          'a': Note.f,
          'e': Note.d,
          'i': Note.e,
          'u': Note.c,
        };

  /// Arisen late in the 19th century, it was more akin to normal encipherment.
  /// The most popular version involved writing out the letters H–N, O–U and
  /// V–Z in lines under the original diatonic notes A–G, as follows:
  ///
  /// | A | B | C | D | E | F | G |
  /// |:-:|:-:|:-:|:-:|:-:|:-:|:-:|
  /// | H | I | J | K | L | M | N |
  /// | O | P | Q | R | S | T | U |
  /// | V | W | X | Y | Z |   |   |
  ///
  /// See [Musical cryptogram](https://en.wikipedia.org/wiki/Musical_cryptogram#French).
  const CryptogramScheme.french()
      : name = 'French',
        patterns = const {
          'A': Note.a,
          'B': Note.b,
          'C': Note.c,
          'D': Note.d,
          'E': Note.e,
          'F': Note.f,
          'G': Note.g,
          'H': Note.a,
          'I': Note.b,
          'J': Note.c,
          'K': Note.d,
          'L': Note.e,
          'M': Note.f,
          'N': Note.g,
          'O': Note.a,
          'P': Note.b,
          'Q': Note.c,
          'R': Note.d,
          'S': Note.e,
          'T': Note.f,
          'U': Note.g,
          'V': Note.a,
          'W': Note.b,
          'X': Note.c,
          'Y': Note.d,
          'Z': Note.e,
        };

  /// Derived on the [CryptogramScheme.french] but leaving H = [Note.b] and
  /// starting the second line with 'I'.
  ///
  /// See [Musical cryptogram](https://en.wikipedia.org/wiki/Musical_cryptogram#Summary_of_signature_motifs)
  /// (Alain).
  const CryptogramScheme.frenchVariant()
      : name = 'French variant',
        patterns = const {
          'A': Note.a,
          'B': Note.b,
          'C': Note.c,
          'D': Note.d,
          'E': Note.e,
          'F': Note.f,
          'G': Note.g,
          'H': Note.b,
          'I': Note.a,
          'J': Note.b,
          'K': Note.c,
          'L': Note.d,
          'M': Note.e,
          'N': Note.f,
          'O': Note.g,
          'P': Note.a,
          'Q': Note.b,
          'R': Note.c,
          'S': Note.d,
          'T': Note.e,
          'U': Note.f,
          'V': Note.g,
          'W': Note.a,
          'X': Note.b,
          'Y': Note.c,
          'Z': Note.d,
        };

  /// Because the development of note names took place within the framework of
  /// [Mode]s, in the German-speaking world [Note.b.flat] was named 'B' and
  /// [Note.b] (natural) was named 'H'.
  ///
  /// Similarly, other note names were derived by sound, e.g., [Note.e.flat],
  /// 'Es' in German, could represent 'S' and [Note.a.flat] the digraph 'As'.
  ///
  /// See [Musical cryptogram](https://en.wikipedia.org/wiki/Musical_cryptogram#German).
  const CryptogramScheme.german()
      : name = 'German',
        patterns = const {
          'As': Note(BaseNote.a, Accidental.flat),
          'Ais': Note(BaseNote.a, Accidental.sharp),
          'A': Note.a,
          'B': Note(BaseNote.b, Accidental.flat),
          'Ces': Note(BaseNote.c, Accidental.flat),
          'Cis': Note(BaseNote.c, Accidental.sharp),
          'C': Note.c,
          'Des': Note(BaseNote.d, Accidental.flat),
          'Dis': Note(BaseNote.d, Accidental.sharp),
          'D': Note.d,
          'Es': Note(BaseNote.e, Accidental.flat),
          'Eis': Note(BaseNote.e, Accidental.sharp),
          'Fes': Note(BaseNote.f, Accidental.flat),
          'Fis': Note(BaseNote.f, Accidental.sharp),
          'F': Note.f,
          'Ges': Note(BaseNote.g, Accidental.flat),
          'Gis': Note(BaseNote.g, Accidental.sharp),
          'G': Note.g,
          'E': Note.e,
          'H': Note.b,
          'I': Note.b,
          'J': Note.c,
          'K': Note.d,
          'L': Note.e,
          'M': Note.f,
          'N': Note.g,
          'O': Note.a,
          'P': Note.b,
          'Q': Note.c,
          'R': Note.d,
          'S': Note(BaseNote.e, Accidental.flat),
          'T': Note.f,
          'U': Note.g,
          'V': Note.a,
          'W': Note.b,
          'X': Note.c,
          'Y': Note.d,
          'Z': Note.e,
        };

  static const List<CryptogramScheme> schemes = [
    CryptogramScheme.solmization(),
    CryptogramScheme.french(),
    CryptogramScheme.frenchVariant(),
    CryptogramScheme.german(),
  ];

  /// Returns the cryptogrammatic sequence of [Note]s, a sequence which can be
  /// taken to refer to an extra-musical text by some 'logical' relationship,
  /// usually between note names and letters.
  ///
  /// Example:
  /// ```dart
  /// const CryptogramScheme.german().cryptogramOf('Bach')
  ///   == [Note.b.flat, Note.a, Note.c, Note.b]
  ///
  /// const CryptogramScheme.frenchVariant().cryptogramOf('Alain')
  ///   == [Note.a, Note.d, Note.a, Note.a, Note.f]
  /// ```
  List<Note> cryptogramOf(String name) {
    final seenMatches = <Match>[];
    final notes = SplayTreeMap<int, Note>();

    for (final pattern in patterns.keys) {
      final matches = RegExp(pattern, caseSensitive: false).allMatches(name);
      for (final match in matches) {
        final isMatchSeen = seenMatches.any(
          (element) => match.start >= element.start && match.end <= element.end,
        );
        if (!isMatchSeen) {
          seenMatches.add(match);
          notes[match.start] = patterns[pattern]!;
        }
      }
    }

    return notes.values.toList();
  }

  @override
  bool operator ==(Object other) =>
      other is CryptogramScheme &&
      name == other.name &&
      patterns == other.patterns;

  @override
  int get hashCode => Object.hash(name, patterns);
}
