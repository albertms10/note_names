import 'package:flutter_test/flutter_test.dart';
import 'package:music_notes/music_notes.dart';
import 'package:note_names/model/cryptogram_scheme.dart';

void main() {
  group('CryptogramStringExtension', () {
    group('.toCryptogram()', () {
      test('should return the musical cryptogram of this String', () {
        final herculesDuxFerrarie = 'Hercules Dux Ferrarie'.toCryptogram();
        expect(
          herculesDuxFerrarie,
          [Note.d, Note.c, Note.d, Note.c, Note.d, Note.f, Note.e, Note.d],
        );

        final arnoldSchonberg =
            'A. SCHBEG'.toCryptogram(const CryptogramScheme.german());
        expect(
          arnoldSchonberg,
          [Note.a, Note.e.flat, Note.c, Note.b, Note.b.flat, Note.e, Note.g],
        );

        final belaBartok =
            'BE BA'.toCryptogram(const CryptogramScheme.french());
        expect(belaBartok, [Note.b, Note.e, Note.b, Note.a]);

        final carlPhilipEmmanuelBach =
            'CFE BACH'.toCryptogram(const CryptogramScheme.german());
        expect(
          carlPhilipEmmanuelBach,
          [Note.c, Note.f, Note.e, Note.b.flat, Note.a, Note.c, Note.b],
        );

        final dimitriSchostakowitsch =
            'D. SCH'.toCryptogram(const CryptogramScheme.german());
        expect(dimitriSchostakowitsch, [Note.d, Note.e.flat, Note.c, Note.b]);

        final edvardGried = 'EBG'.toCryptogram(const CryptogramScheme.french());
        expect(edvardGried, [Note.e, Note.b, Note.g]);

        final franzSchubert =
            'F. SCH'.toCryptogram(const CryptogramScheme.german());
        expect(franzSchubert, [Note.f, Note.e.flat, Note.c, Note.b]);

        final gustavHolst =
            'GSAH'.toCryptogram(const CryptogramScheme.german());
        expect(gustavHolst, [Note.g, Note.e.flat, Note.a, Note.b]);

        final jehanAlain =
            'ALAIN'.toCryptogram(const CryptogramScheme.frenchVariant());
        expect(jehanAlain, [Note.a, Note.d, Note.a, Note.a, Note.f]);

        final johannesBrahms =
            'BAHS'.toCryptogram(const CryptogramScheme.german());
        expect(johannesBrahms, [Note.b.flat, Note.a, Note.b, Note.e.flat]);

        final johannSebastianBach =
            'BACH'.toCryptogram(const CryptogramScheme.german());
        expect(johannSebastianBach, [Note.b.flat, Note.a, Note.c, Note.b]);

        final johnCage = 'CAGE'.toCryptogram(const CryptogramScheme.german());
        expect(johnCage, [Note.c, Note.a, Note.g, Note.e]);

        final josephHaydn =
            'HAYDN'.toCryptogram(const CryptogramScheme.german());
        expect(josephHaydn, [Note.b, Note.a, Note.d, Note.d, Note.g]);

        final metaAbegg = 'ABEGG'.toCryptogram(const CryptogramScheme.german());
        expect(metaAbegg, [Note.a, Note.b.flat, Note.e, Note.g, Note.g]);

        final nielsGade = 'GADE'.toCryptogram(const CryptogramScheme.german());
        expect(nielsGade, [Note.g, Note.a, Note.d, Note.e]);

        final paulSacher =
            'SACHER'.toCryptogram(const CryptogramScheme.german());
        expect(
          paulSacher,
          [Note.e.flat, Note.a, Note.c, Note.b, Note.e, Note.d],
        );

        final robertSchumann =
            'SCHA'.toCryptogram(const CryptogramScheme.german());
        expect(robertSchumann, [Note.e.flat, Note.c, Note.b, Note.a]);

        final asch1 = 'ASCH'.toCryptogram(const CryptogramScheme.german());
        expect(asch1, [Note.a.flat, Note.c, Note.b]);

        final asch2 = 'A SCH'.toCryptogram(const CryptogramScheme.german());
        expect(asch2, [Note.a, Note.e.flat, Note.c, Note.b]);
      });
    });
  });
}
