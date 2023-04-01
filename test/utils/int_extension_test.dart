import 'package:flutter_test/flutter_test.dart';
import 'package:note_names/utils/int_extension.dart';

void main() {
  group('IntExtension', () {
    group('isPrime', () {
      test('should return true if this int is prime', () {
        for (final n in const [2, 3, 5, 7, 11, 109, 845683]) {
          expect(n.isPrime, isTrue);
        }
      });

      test('should return false if this int is not prime', () {
        for (final n in const [-11, -1, 0, 1, 110, 500]) {
          expect(n.isPrime, isFalse);
        }
      });
    });
  });
}
