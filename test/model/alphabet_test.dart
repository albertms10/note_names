import 'package:flutter_test/flutter_test.dart';
import 'package:note_names/model/alphabet.dart';

void main() {
  group('Alphabet', () {
    group('constructor', () {
      test('should create an instance of an Alphabet', () {
        const alphabet = Alphabet(
          name: 'Alphabet 1',
          letterToNumber: {'A': 1, 'B': 2, 'C': 3},
        );
        expect(alphabet.name, 'Alphabet 1');
        expect(alphabet.numericValueOfLetter('C'), 3);
        expect(alphabet.numericValueOfName('ABC'), 6);
      });
    });

    group('.latinNaturalOrder()', () {
      const alphabet = Alphabet.latinNaturalOrder();

      test('should contain the expected letters', () {
        expect(alphabet.containsLetter('A'), isTrue);
        expect(alphabet.containsLetter('K'), isTrue);
        expect(alphabet.containsLetter('O'), isTrue);
        expect(alphabet.containsLetter('W'), isTrue);
        expect(alphabet.containsLetter('Z'), isTrue);

        expect(alphabet.containsLetter(' '), isFalse);
        expect(alphabet.containsLetter('.'), isFalse);
      });

      test('should return the correct numeric value of a letter', () {
        expect(alphabet.numericValueOfLetter('A'), 1);
        expect(alphabet.numericValueOfLetter('B'), 2);
        expect(alphabet.numericValueOfLetter('K'), 10);
        expect(alphabet.numericValueOfLetter('O'), 14);
        expect(alphabet.numericValueOfLetter('W'), 0);
        expect(alphabet.numericValueOfLetter('Z'), 23);

        expect(alphabet.numericValueOfLetter(' '), null);
        expect(alphabet.numericValueOfLetter('.'), null);
      });

      test('should return the correct numeric value of a name', () {
        expect(alphabet.numericValueOfName('Bach'), 14);
        expect(alphabet.numericValueOfName('S.D.G.'), 29);
        expect(alphabet.numericValueOfName('JSB'), 29);
        expect(alphabet.numericValueOfName('J.S. BACH'), 41);
        expect(alphabet.numericValueOfName('Johann Sebastian'), 144);
        expect(alphabet.numericValueOfName('Johann Sebastian Bach'), 158);
      });
    });

    group('.latinNaturalOrder1()', () {
      const alphabet = Alphabet.latinNaturalOrder1();

      test('should contain the expected letters', () {
        expect(alphabet.containsLetter('A'), isTrue);
        expect(alphabet.containsLetter('K'), isTrue);
        expect(alphabet.containsLetter('O'), isTrue);
        expect(alphabet.containsLetter('W'), isTrue);
        expect(alphabet.containsLetter('Z'), isTrue);

        expect(alphabet.containsLetter(' '), isFalse);
        expect(alphabet.containsLetter('.'), isFalse);
      });

      test('should return the correct numeric value of a letter', () {
        expect(alphabet.numericValueOfLetter('A'), 1);
        expect(alphabet.numericValueOfLetter('B'), 2);
        expect(alphabet.numericValueOfLetter('K'), 10);
        expect(alphabet.numericValueOfLetter('O'), 14);
        expect(alphabet.numericValueOfLetter('W'), 21);
        expect(alphabet.numericValueOfLetter('Z'), 24);

        expect(alphabet.numericValueOfLetter(' '), null);
        expect(alphabet.numericValueOfLetter('.'), null);
      });

      test('should return the correct numeric value of a name', () {
        expect(alphabet.numericValueOfName('Bach'), 14);
        expect(alphabet.numericValueOfName('S.D.G.'), 29);
        expect(alphabet.numericValueOfName('JSB'), 29);
        expect(alphabet.numericValueOfName('J.S. BACH'), 41);
        expect(alphabet.numericValueOfName('Johann Sebastian'), 144);
        expect(alphabet.numericValueOfName('Johann Sebastian Bach'), 158);
      });
    });

    group('.latinNaturalOrder2()', () {
      const alphabet = Alphabet.latinNaturalOrder2();

      test('should contain the expected letters', () {
        expect(alphabet.containsLetter('A'), isTrue);
        expect(alphabet.containsLetter('K'), isTrue);
        expect(alphabet.containsLetter('O'), isTrue);
        expect(alphabet.containsLetter('W'), isTrue);
        expect(alphabet.containsLetter('Z'), isTrue);

        expect(alphabet.containsLetter(' '), isFalse);
        expect(alphabet.containsLetter('.'), isFalse);
      });

      test('should return the correct numeric value of a letter', () {
        expect(alphabet.numericValueOfLetter('A'), 1);
        expect(alphabet.numericValueOfLetter('B'), 2);
        expect(alphabet.numericValueOfLetter('K'), 10);
        expect(alphabet.numericValueOfLetter('O'), 0);
        expect(alphabet.numericValueOfLetter('W'), 20);
        expect(alphabet.numericValueOfLetter('Z'), 23);

        expect(alphabet.numericValueOfLetter(' '), null);
        expect(alphabet.numericValueOfLetter('.'), null);
      });

      test('should return the correct numeric value of a name', () {
        expect(alphabet.numericValueOfName('Bach'), 14);
        expect(alphabet.numericValueOfName('S.D.G.'), 28);
        expect(alphabet.numericValueOfName('JSB'), 28);
        expect(alphabet.numericValueOfName('J.S. BACH'), 40);
        expect(alphabet.numericValueOfName('Johann Sebastian'), 127);
        expect(alphabet.numericValueOfName('Johann Sebastian Bach'), 141);
      });
    });

    group('.latinNaturalOrder3()', () {
      const alphabet = Alphabet.latinNaturalOrder3();

      test('should contain the expected letters', () {
        expect(alphabet.containsLetter('A'), isTrue);
        expect(alphabet.containsLetter('K'), isTrue);
        expect(alphabet.containsLetter('O'), isTrue);
        expect(alphabet.containsLetter('W'), isTrue);
        expect(alphabet.containsLetter('Z'), isTrue);

        expect(alphabet.containsLetter(' '), isFalse);
        expect(alphabet.containsLetter('.'), isFalse);
      });

      test('should return the correct numeric value of a letter', () {
        expect(alphabet.numericValueOfLetter('A'), 1);
        expect(alphabet.numericValueOfLetter('B'), 2);
        expect(alphabet.numericValueOfLetter('K'), 0);
        expect(alphabet.numericValueOfLetter('O'), 13);
        expect(alphabet.numericValueOfLetter('W'), 0);
        expect(alphabet.numericValueOfLetter('Z'), 22);

        expect(alphabet.numericValueOfLetter(' '), null);
        expect(alphabet.numericValueOfLetter('.'), null);
      });

      test('should return the correct numeric value of a name', () {
        expect(alphabet.numericValueOfName('Bach'), 14);
        expect(alphabet.numericValueOfName('S.D.G.'), 28);
        expect(alphabet.numericValueOfName('JSB'), 28);
        expect(alphabet.numericValueOfName('J.S. BACH'), 40);
        expect(alphabet.numericValueOfName('Johann Sebastian'), 137);
        expect(alphabet.numericValueOfName('Johann Sebastian Bach'), 151);
      });
    });

    group('.alphabets', () {
      test('should be a list of Alphabets', () {
        expect(Alphabet.alphabets, const TypeMatcher<List<Alphabet>>());
      });
    });
  });
}
