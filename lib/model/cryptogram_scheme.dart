import 'dart:collection' show SplayTreeMap;

import 'package:collection/collection.dart' show MapEquality;
import 'package:music_notes/music_notes.dart';

import 'note_name.dart';

class CryptogramScheme {
  final String name;
  final Map<String, Note> patterns;
  final NoteNotation notationSystem;

  const CryptogramScheme({
    required this.name,
    required this.patterns,
    this.notationSystem = const EnglishNoteNotation.symbol(),
  });

  /// Under this scheme the vowel sounds in the text are matched to the vowel
  /// sounds of the solmization syllables of Guido of Arezzo (where 'ut' is the
  /// root, which we now call 'do', [Note.c]).
  ///
  /// See [Musical cryptogram](https://en.wikipedia.org/wiki/Musical_cryptogram#Syllables_to_solmization_names).
  const CryptogramScheme.solmization()
    : name = 'Solmization',
      notationSystem = const RomanceNoteNotation.symbol(),
      patterns = const {
        'do|ut': .c,
        're': .d,
        'mi': .e,
        'fa': .f,
        'sol?': .g,
        'la': .a,
        '(t|s)i': .b,
        'a': .f,
        'e': .d,
        'i': .e,
        'u': .c,
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
      notationSystem = const RomanceNoteNotation.symbol(
        noteNameNotation: FrenchNoteNameNotation(),
      ),
      patterns = const {
        'A': .a,
        'B': .b,
        'C': .c,
        'D': .d,
        'E': .e,
        'F': .f,
        'G': .g,
        'H': .a,
        'I': .b,
        'J': .c,
        'K': .d,
        'L': .e,
        'M': .f,
        'N': .g,
        'O': .a,
        'P': .b,
        'Q': .c,
        'R': .d,
        'S': .e,
        'T': .f,
        'U': .g,
        'V': .a,
        'W': .b,
        'X': .c,
        'Y': .d,
        'Z': .e,
      };

  /// Derived on the [CryptogramScheme.french] but leaving H = [Note.b] and
  /// starting the second line with 'I'.
  ///
  /// See [Musical cryptogram](https://en.wikipedia.org/wiki/Musical_cryptogram#Summary_of_signature_motifs)
  /// (Alain).
  const CryptogramScheme.frenchVariant()
    : name = 'French variant',
      notationSystem = const RomanceNoteNotation.symbol(
        noteNameNotation: FrenchNoteNameNotation(),
      ),
      patterns = const {
        'A': .a,
        'B': .b,
        'C': .c,
        'D': .d,
        'E': .e,
        'F': .f,
        'G': .g,
        'H': .b,
        'I': .a,
        'J': .b,
        'K': .c,
        'L': .d,
        'M': .e,
        'N': .f,
        'O': .g,
        'P': .a,
        'Q': .b,
        'R': .c,
        'S': .d,
        'T': .e,
        'U': .f,
        'V': .g,
        'W': .a,
        'X': .b,
        'Y': .c,
        'Z': .d,
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
      notationSystem = const GermanNoteNotation(),
      patterns = const {
        'As': Note(.a, .flat),
        'Ais': Note(.a, .sharp),
        'A': .a,
        'B': Note(.b, .flat),
        'Ces': Note(.c, .flat),
        'Cis': Note(.c, .sharp),
        'C': .c,
        'Des': Note(.d, .flat),
        'Dis': Note(.d, .sharp),
        'D': .d,
        'Es': Note(.e, .flat),
        'Eis': Note(.e, .sharp),
        'Fes': Note(.f, .flat),
        'Fis': Note(.f, .sharp),
        'F': .f,
        'Ges': Note(.g, .flat),
        'Gis': Note(.g, .sharp),
        'G': .g,
        'E': .e,
        'H': .b,
        'I': .b,
        'J': .c,
        'K': .d,
        'L': .e,
        'M': .f,
        'N': .g,
        'O': .a,
        'P': .b,
        'Q': .c,
        'R': .d,
        'S': Note(.e, .flat),
        'T': .f,
        'U': .g,
        'V': .a,
        'W': .b,
        'X': .c,
        'Y': .d,
        'Z': .e,
      };

  static const List<CryptogramScheme> schemes = [
    .solmization(),
    .french(),
    .frenchVariant(),
    .german(),
  ];

  /// Returns the cryptogrammatic sequence of [Note]s, a sequence which can be
  /// taken to refer to an extra-musical text by some 'logical' relationship,
  /// usually between note names and letters.
  ///
  /// Example:
  /// ```dart
  /// const CryptogramScheme.german().cryptogramOf('Bach')
  ///   == <Note>[.b.flat, .a, .c, .b]
  ///
  /// const CryptogramScheme.frenchVariant().cryptogramOf('Alain')
  ///   == <Note>[.a, .d, .a, .a, .f]
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
      const MapEquality<String, Note>().equals(patterns, other.patterns);

  @override
  int get hashCode => Object.hash(name, Object.hashAll(patterns.values));
}
