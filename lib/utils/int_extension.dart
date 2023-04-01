import 'dart:math';

extension IntExtension on int {
  bool get isPrime {
    if (this <= 1) return false;
    if (this == 2) return true;
    if (isEven) return false;

    final maxDivisor = sqrt(this).floor();
    for (var i = 3; i <= maxDivisor; i += 2) {
      if (this % i == 0) return false;
    }

    return true;
  }
}
