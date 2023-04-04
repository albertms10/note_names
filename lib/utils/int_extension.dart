import 'dart:math';

extension IntExtension on int {
  bool get isPrime {
    if (this <= 1) return false;
    if (this == 2) return true;
    if (isEven) return false;

    final maxDivisor = sqrt(this).floor();
    for (var i = 3;
        i <= maxDivisor;
        // All prime numbers are 1 or 5 modulo 6.
        // Since we start with 3, this will do:
        // 3 -> 5 -> 7 -> 11 ... +2 -> +4 -> +2 -> +4 ...
        i = i % 6 == 1 ? i + 4 : i + 2) {
      if (this % i == 0) return false;
    }

    return true;
  }
}
