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
        expect(herculesDuxFerrarie, <Note>[.d, .c, .d, .c, .d, .f, .e, .d]);

        final arnoldSchonberg = const CryptogramScheme.german().cryptogramOf(
          'A. SCHBEG',
        );
        expect(arnoldSchonberg, <Note>[.a, .e.flat, .c, .b, .b.flat, .e, .g]);

        final belaBartok = const CryptogramScheme.french().cryptogramOf(
          'BE BA',
        );
        expect(belaBartok, const <Note>[.b, .e, .b, .a]);

        final carlPhilipEmmanuelBach = const CryptogramScheme.german()
            .cryptogramOf('CFE BACH');
        expect(carlPhilipEmmanuelBach, <Note>[.c, .f, .e, .b.flat, .a, .c, .b]);

        final dmitriSchostakowitsch = const CryptogramScheme.german()
            .cryptogramOf('D. SCH');
        expect(dmitriSchostakowitsch, <Note>[.d, .e.flat, .c, .b]);

        final edvardGrieg = const CryptogramScheme.french().cryptogramOf('EBG');
        expect(edvardGrieg, <Note>[.e, .b, .g]);

        final franzSchubert = const CryptogramScheme.german().cryptogramOf(
          'F. SCH',
        );
        expect(franzSchubert, <Note>[.f, .e.flat, .c, .b]);

        final gustavHolst = const CryptogramScheme.german().cryptogramOf(
          'GSAH',
        );
        expect(gustavHolst, <Note>[.g, .e.flat, .a, .b]);

        final jehanAlain = const CryptogramScheme.frenchVariant().cryptogramOf(
          'ALAIN',
        );
        expect(jehanAlain, <Note>[.a, .d, .a, .a, .f]);

        final johannesBrahms = const CryptogramScheme.german().cryptogramOf(
          'BAHS',
        );
        expect(johannesBrahms, <Note>[.b.flat, .a, .b, .e.flat]);

        final johannSebastianBach = const CryptogramScheme.german()
            .cryptogramOf('BACH');
        expect(johannSebastianBach, <Note>[.b.flat, .a, .c, .b]);

        final johnCage = const CryptogramScheme.german().cryptogramOf('CAGE');
        expect(johnCage, <Note>[.c, .a, .g, .e]);

        final josephHaydn = const CryptogramScheme.german().cryptogramOf(
          'HAYDN',
        );
        expect(josephHaydn, <Note>[.b, .a, .d, .d, .g]);

        final metaAbegg = const CryptogramScheme.german().cryptogramOf('ABEGG');
        expect(metaAbegg, <Note>[.a, .b.flat, .e, .g, .g]);

        final nielsGade = const CryptogramScheme.german().cryptogramOf('GADE');
        expect(nielsGade, <Note>[.g, .a, .d, .e]);

        final paulSacher = const CryptogramScheme.german().cryptogramOf(
          'SACHER',
        );
        expect(paulSacher, <Note>[.e.flat, .a, .c, .b, .e, .d]);

        final robertSchumann = const CryptogramScheme.german().cryptogramOf(
          'SCHA',
        );
        expect(robertSchumann, <Note>[.e.flat, .c, .b, .a]);

        final asch1 = const CryptogramScheme.german().cryptogramOf('ASCH');
        expect(asch1, <Note>[.a.flat, .c, .b]);

        final asch2 = const CryptogramScheme.german().cryptogramOf('A SCH');
        expect(asch2, <Note>[.a, .e.flat, .c, .b]);
      });
    });

    group('.hashCode', () {
      test('should remove duplicates in a Set', () {
        final collection = <CryptogramScheme>{
          // ignore: prefer_const_constructors for testing
          .french(),
          // ignore: prefer_const_constructors for testing
          CryptogramScheme(name: 'A', patterns: {'a': .c}),
          // ignore: prefer_const_constructors for testing
          .frenchVariant(),
          // ignore: prefer_const_constructors for testing
          .french(),
          // ignore: prefer_const_constructors for testing
          CryptogramScheme(name: 'A', patterns: {'a': .c}),
        };
        expect(collection.length, 3);
      });
    });
  });
}
