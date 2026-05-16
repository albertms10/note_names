import 'package:flutter_test/flutter_test.dart';
import 'package:music_notes/music_notes.dart';
import 'package:note_names/model/note_name.dart';

void main() {
  group('FrenchNoteNameNotation', () {
    group('.parse()', () {
      const chain = [FrenchNoteNameNotation()];

      test('throws a FormatException when source is invalid', () {
        expect(
          () => NoteName.parse('X', chain: chain),
          throwsFormatException,
        );
        expect(() => NoteName.parse('', chain: chain), throwsFormatException);
        expect(
          () => NoteName.parse('A', chain: chain),
          throwsFormatException,
        );
        expect(
          () => NoteName.parse('Re', chain: chain),
          throwsFormatException,
        );
        expect(
          () => NoteName.parse('DoRé', chain: chain),
          throwsFormatException,
        );
        expect(
          () => const FrenchNoteNameNotation().parse('x'),
          throwsFormatException,
        );
      });

      test('parses source as a NoteName', () {
        expect(NoteName.parse('Do', chain: chain), NoteName.c);
        expect(NoteName.parse('Ré', chain: chain), NoteName.d);
        expect(NoteName.parse('Mi', chain: chain), NoteName.e);
        expect(NoteName.parse('Fa', chain: chain), NoteName.f);
        expect(NoteName.parse('Sol', chain: chain), NoteName.g);
        expect(NoteName.parse('La', chain: chain), NoteName.a);
        expect(NoteName.parse('Si', chain: chain), NoteName.b);

        expect(NoteName.parse('do', chain: chain), NoteName.c);
        expect(NoteName.parse('DO', chain: chain), NoteName.c);
        expect(NoteName.parse('ré', chain: chain), NoteName.d);
        expect(NoteName.parse('mi', chain: chain), NoteName.e);
        expect(NoteName.parse('fa', chain: chain), NoteName.f);
        expect(NoteName.parse('sol', chain: chain), NoteName.g);
        expect(NoteName.parse('la', chain: chain), NoteName.a);
        expect(NoteName.parse('si', chain: chain), NoteName.b);
      });

      test('.format() and .parse() are inverses', () {
        for (final noteName in NoteName.values) {
          expect(
            noteName,
            NoteName.parse(
              noteName.format(const FrenchNoteNameNotation()),
              chain: chain,
            ),
          );
        }
      });
    });
  });
}
