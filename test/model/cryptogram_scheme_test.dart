import 'package:flutter_test/flutter_test.dart';
import 'package:music_notes/music_notes.dart';
import 'package:note_names/model/cryptogram_scheme.dart';

void main() {
  group('CryptogramScheme', () {
    group('.schemes', () {
      test('should be a list of CryptogramSchemes', () {
        expect(
          CryptogramScheme.schemes,
          const TypeMatcher<List<CryptogramScheme>>(),
        );
      });
    });

    group('.cryptogramOf()', () {
      test('should return the musical cryptogram of name', () {
        final herculesDuxFerrarie = const CryptogramScheme.solmization()
            .cryptogramOf('Hercules Dux Ferrarie');
        expect(
          herculesDuxFerrarie,
          [Note.d, Note.c, Note.d, Note.c, Note.d, Note.f, Note.e, Note.d],
        );

        final arnoldSchonberg =
            const CryptogramScheme.german().cryptogramOf('A. SCHBEG');
        expect(
          arnoldSchonberg,
          [Note.a, Note.e.flat, Note.c, Note.b, Note.b.flat, Note.e, Note.g],
        );

        final belaBartok =
            const CryptogramScheme.french().cryptogramOf('BE BA');
        expect(belaBartok, [Note.b, Note.e, Note.b, Note.a]);

        final carlPhilipEmmanuelBach =
            const CryptogramScheme.german().cryptogramOf('CFE BACH');
        expect(
          carlPhilipEmmanuelBach,
          [Note.c, Note.f, Note.e, Note.b.flat, Note.a, Note.c, Note.b],
        );

        final dimitriSchostakowitsch =
            const CryptogramScheme.german().cryptogramOf('D. SCH');
        expect(dimitriSchostakowitsch, [Note.d, Note.e.flat, Note.c, Note.b]);

        final edvardGried = const CryptogramScheme.french().cryptogramOf('EBG');
        expect(edvardGried, [Note.e, Note.b, Note.g]);

        final franzSchubert =
            const CryptogramScheme.german().cryptogramOf('F. SCH');
        expect(franzSchubert, [Note.f, Note.e.flat, Note.c, Note.b]);

        final gustavHolst =
            const CryptogramScheme.german().cryptogramOf('GSAH');
        expect(gustavHolst, [Note.g, Note.e.flat, Note.a, Note.b]);

        final jehanAlain =
            const CryptogramScheme.frenchVariant().cryptogramOf('ALAIN');
        expect(jehanAlain, [Note.a, Note.d, Note.a, Note.a, Note.f]);

        final johannesBrahms =
            const CryptogramScheme.german().cryptogramOf('BAHS');
        expect(johannesBrahms, [Note.b.flat, Note.a, Note.b, Note.e.flat]);

        final johannSebastianBach =
            const CryptogramScheme.german().cryptogramOf('BACH');
        expect(johannSebastianBach, [Note.b.flat, Note.a, Note.c, Note.b]);

        final johnCage = const CryptogramScheme.german().cryptogramOf('CAGE');
        expect(johnCage, [Note.c, Note.a, Note.g, Note.e]);

        final josephHaydn =
            const CryptogramScheme.german().cryptogramOf('HAYDN');
        expect(josephHaydn, [Note.b, Note.a, Note.d, Note.d, Note.g]);

        final metaAbegg = const CryptogramScheme.german().cryptogramOf('ABEGG');
        expect(metaAbegg, [Note.a, Note.b.flat, Note.e, Note.g, Note.g]);

        final nielsGade = const CryptogramScheme.german().cryptogramOf('GADE');
        expect(nielsGade, [Note.g, Note.a, Note.d, Note.e]);

        final paulSacher =
            const CryptogramScheme.german().cryptogramOf('SACHER');
        expect(
          paulSacher,
          [Note.e.flat, Note.a, Note.c, Note.b, Note.e, Note.d],
        );

        final robertSchumann =
            const CryptogramScheme.german().cryptogramOf('SCHA');
        expect(robertSchumann, [Note.e.flat, Note.c, Note.b, Note.a]);

        final asch1 = const CryptogramScheme.german().cryptogramOf('ASCH');
        expect(asch1, [Note.a.flat, Note.c, Note.b]);

        final asch2 = const CryptogramScheme.german().cryptogramOf('A SCH');
        expect(asch2, [Note.a, Note.e.flat, Note.c, Note.b]);
      });
    });

    group('.hashCode', () {
      test('should remove duplicates in a Set', () {
        final collection = {
          // ignore: prefer_const_constructors
          CryptogramScheme.french(),
          // ignore: prefer_const_constructors
          CryptogramScheme.frenchVariant(),
          // ignore: prefer_const_constructors
          CryptogramScheme.french(),
        };
        expect(collection.length, 2);
      });
    });
  });
}
