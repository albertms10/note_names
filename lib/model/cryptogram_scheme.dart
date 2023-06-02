import 'dart:collection' show SplayTreeMap;

import 'package:music_notes/music_notes.dart';

class CryptogramScheme {
  final String name;
  final Map<Pattern, Note> patterns;

  /// Creates a new [CryptogramScheme] from [name] and [patterns].
  const CryptogramScheme(this.name, {required this.patterns});

  /// Under this scheme the vowel sounds in the text are matched to the vowel
  /// sounds of the solmization syllables of Guido of Arezzo (where 'ut' is the
  /// root, which we now call 'do', [Note.c]).
  ///
  /// See [Musical cryptogram](https://en.wikipedia.org/wiki/Musical_cryptogram#Syllables_to_solmization_names).
  CryptogramScheme.solmization()
      : name = 'Solmization',
        patterns = {
          RegExp('do|ut', caseSensitive: false): Note.c,
          RegExp('re', caseSensitive: false): Note.d,
          RegExp('mi', caseSensitive: false): Note.e,
          RegExp('fa', caseSensitive: false): Note.f,
          RegExp('sol?', caseSensitive: false): Note.g,
          RegExp('la', caseSensitive: false): Note.a,
          RegExp('(t|s)i', caseSensitive: false): Note.b,
          RegExp('a', caseSensitive: false): Note.f,
          RegExp('e', caseSensitive: false): Note.d,
          RegExp('i', caseSensitive: false): Note.e,
          RegExp('u', caseSensitive: false): Note.c,
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
  CryptogramScheme.french()
      : name = 'French',
        patterns = {
          RegExp('A', caseSensitive: false): Note.a,
          RegExp('B', caseSensitive: false): Note.b,
          RegExp('C', caseSensitive: false): Note.c,
          RegExp('D', caseSensitive: false): Note.d,
          RegExp('E', caseSensitive: false): Note.e,
          RegExp('F', caseSensitive: false): Note.f,
          RegExp('G', caseSensitive: false): Note.g,
          RegExp('H', caseSensitive: false): Note.a,
          RegExp('I', caseSensitive: false): Note.b,
          RegExp('J', caseSensitive: false): Note.c,
          RegExp('K', caseSensitive: false): Note.d,
          RegExp('L', caseSensitive: false): Note.e,
          RegExp('M', caseSensitive: false): Note.f,
          RegExp('N', caseSensitive: false): Note.g,
          RegExp('O', caseSensitive: false): Note.a,
          RegExp('P', caseSensitive: false): Note.b,
          RegExp('Q', caseSensitive: false): Note.c,
          RegExp('R', caseSensitive: false): Note.d,
          RegExp('S', caseSensitive: false): Note.e,
          RegExp('T', caseSensitive: false): Note.f,
          RegExp('U', caseSensitive: false): Note.g,
          RegExp('V', caseSensitive: false): Note.a,
          RegExp('W', caseSensitive: false): Note.b,
          RegExp('X', caseSensitive: false): Note.c,
          RegExp('Y', caseSensitive: false): Note.d,
          RegExp('Z', caseSensitive: false): Note.e,
        };

  /// Derived on the [CryptogramScheme.french] but leaving H = [Note.b] and
  /// starting the second line with 'I'.
  ///
  /// See [Musical cryptogram](https://en.wikipedia.org/wiki/Musical_cryptogram#Summary_of_signature_motifs)
  /// (Alain).
  CryptogramScheme.frenchVariant()
      : name = 'French variant',
        patterns = {
          RegExp('A', caseSensitive: false): Note.a,
          RegExp('B', caseSensitive: false): Note.b,
          RegExp('C', caseSensitive: false): Note.c,
          RegExp('D', caseSensitive: false): Note.d,
          RegExp('E', caseSensitive: false): Note.e,
          RegExp('F', caseSensitive: false): Note.f,
          RegExp('G', caseSensitive: false): Note.g,
          RegExp('H', caseSensitive: false): Note.b,
          RegExp('I', caseSensitive: false): Note.a,
          RegExp('J', caseSensitive: false): Note.b,
          RegExp('K', caseSensitive: false): Note.c,
          RegExp('L', caseSensitive: false): Note.d,
          RegExp('M', caseSensitive: false): Note.e,
          RegExp('N', caseSensitive: false): Note.f,
          RegExp('O', caseSensitive: false): Note.g,
          RegExp('P', caseSensitive: false): Note.a,
          RegExp('Q', caseSensitive: false): Note.b,
          RegExp('R', caseSensitive: false): Note.c,
          RegExp('S', caseSensitive: false): Note.d,
          RegExp('T', caseSensitive: false): Note.e,
          RegExp('U', caseSensitive: false): Note.f,
          RegExp('V', caseSensitive: false): Note.g,
          RegExp('W', caseSensitive: false): Note.a,
          RegExp('X', caseSensitive: false): Note.b,
          RegExp('Y', caseSensitive: false): Note.c,
          RegExp('Z', caseSensitive: false): Note.d,
        };

  /// Because the development of note names took place within the framework of
  /// [Mode]s, in the German-speaking world [Note.b.flat] was named 'B' and
  /// [Note.b] (natural) was named 'H'.
  ///
  /// Similarly, other note names were derived by sound, e.g., [Note.e.flat],
  /// 'Es' in German, could represent 'S' and [Note.a.flat] the digraph 'As'.
  ///
  /// See [Musical cryptogram](https://en.wikipedia.org/wiki/Musical_cryptogram#German).
  CryptogramScheme.german()
      : name = 'German',
        patterns = {
          RegExp('As', caseSensitive: false): Note.a.flat,
          RegExp('Ais', caseSensitive: false): Note.a.sharp,
          RegExp('A', caseSensitive: false): Note.a,
          RegExp('B', caseSensitive: false): Note.b.flat,
          RegExp('Ces', caseSensitive: false): Note.c.flat,
          RegExp('Cis', caseSensitive: false): Note.c.sharp,
          RegExp('C', caseSensitive: false): Note.c,
          RegExp('Des', caseSensitive: false): Note.d.flat,
          RegExp('Dis', caseSensitive: false): Note.d.sharp,
          RegExp('D', caseSensitive: false): Note.d,
          RegExp('Es', caseSensitive: false): Note.e.flat,
          RegExp('Eis', caseSensitive: false): Note.e.sharp,
          RegExp('Fes', caseSensitive: false): Note.f.flat,
          RegExp('Fis', caseSensitive: false): Note.f.sharp,
          RegExp('F', caseSensitive: false): Note.f,
          RegExp('Ges', caseSensitive: false): Note.g.flat,
          RegExp('Gis', caseSensitive: false): Note.g.sharp,
          RegExp('G', caseSensitive: false): Note.g,
          RegExp('E', caseSensitive: false): Note.e,
          RegExp('H', caseSensitive: false): Note.b,
          RegExp('I', caseSensitive: false): Note.b,
          RegExp('J', caseSensitive: false): Note.c,
          RegExp('K', caseSensitive: false): Note.d,
          RegExp('L', caseSensitive: false): Note.e,
          RegExp('M', caseSensitive: false): Note.f,
          RegExp('N', caseSensitive: false): Note.g,
          RegExp('O', caseSensitive: false): Note.a,
          RegExp('P', caseSensitive: false): Note.b,
          RegExp('Q', caseSensitive: false): Note.c,
          RegExp('R', caseSensitive: false): Note.d,
          RegExp('S', caseSensitive: false): Note.e.flat,
          RegExp('T', caseSensitive: false): Note.f,
          RegExp('U', caseSensitive: false): Note.g,
          RegExp('V', caseSensitive: false): Note.a,
          RegExp('W', caseSensitive: false): Note.b,
          RegExp('X', caseSensitive: false): Note.c,
          RegExp('Y', caseSensitive: false): Note.d,
          RegExp('Z', caseSensitive: false): Note.e,
        };
}

extension CryptogramStringExtension on String {
  /// Returns the cryptogrammatic sequence of [Note]s, a sequence which can be
  /// taken to refer to an extra-musical text by some 'logical' relationship,
  /// usually between note names and letters.
  ///
  /// Example:
  /// ```dart
  /// 'Bach'.toCryptogram(CryptogramScheme.german())
  ///   == [Note.b.flat, Note.a, Note.c, Note.b]
  ///
  /// 'Alain'.toCryptogram(CryptogramScheme.frenchVariant())
  ///   == [Note.a, Note.d, Note.a, Note.a, Note.f]
  /// ```
  List<Note> toCryptogram(CryptogramScheme scheme) {
    final seenMatches = <Match>[];
    final notes = SplayTreeMap<int, Note>();

    for (final pattern in scheme.patterns.keys) {
      for (final match in pattern.allMatches(this)) {
        final isMatchSeen = seenMatches.any(
          (element) => match.start >= element.start && match.end <= element.end,
        );
        if (!isMatchSeen) {
          seenMatches.add(match);
          notes[match.start] = scheme.patterns[pattern]!;
        }
      }
    }

    return notes.values.toList();
  }
}
