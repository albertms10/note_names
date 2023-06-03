import 'package:flutter_test/flutter_test.dart';
import 'package:music_notes/music_notes.dart';
import 'package:note_names/model/alphabet.dart';
import 'package:note_names/model/cryptogram_scheme.dart';
import 'package:note_names/model/name.dart';

void main() {
  group('Name', () {
    group('constructor', () {
      test('should create a new instance of Name', () {
        const alphabet = Alphabet(
          name: 'Alphabet 1',
          letterToNumber: {'A': 1, 'B': 2, 'C': 3},
        );
        const name = Name('ABC', alphabet: alphabet);
        expect(name.name, 'ABC');
        expect(name.alphabet, alphabet);
      });
    });

    group('.numericValue', () {
      test('should return the numeric value of this Name', () {
        expect(const Name('ABC').numericValue, 6);

        const alphabet = Alphabet(
          name: 'Alphabet 1',
          letterToNumber: {'A': 2, 'B': 4, 'C': 6},
        );
        expect(const Name('ABC', alphabet: alphabet).numericValue, 12);
      });
    });

    group('.musicalCryptogram', () {
      test('should return the musical cryptogram of this Name', () {
        expect(
          const Name('Bach', scheme: CryptogramScheme.german())
              .musicalCryptogram,
          [Note.b.flat, Note.a, Note.c, Note.b],
        );
      });
    });

    group('.copyWith', () {
      test('should return a new copy of this Name', () {
        const name = Name('ABC');
        expect(name, name.copyWith());
        expect(identical(name, name.copyWith()), isFalse);
        expect(identical(name.copyWith(), name.copyWith()), isFalse);
      });

      test(
        'should return a new copy of this Name with overridden properties',
        () {
          const alphabet =
              Alphabet(name: 'Alphabet 1', letterToNumber: {'Z': 24});
          const scheme = CryptogramScheme.french();
          const name = Name('ABC');
          final copiedName =
              name.copyWith(name: 'Z', alphabet: alphabet, scheme: scheme);
          expect(copiedName.name, 'Z');
          expect(copiedName.alphabet, alphabet);
          expect(copiedName.scheme, scheme);
        },
      );
    });

    group('.hashCode', () {
      test('should remove duplicates in a Set', () {
        final collection = {
          // ignore: prefer_const_constructors
          Name('ABC'),
          // ignore: prefer_const_constructors
          Name('XYZ'),
          // ignore: prefer_const_constructors
          Name('ABC'),
        };
        expect(collection.length, 2);
      });
    });
  });
}
