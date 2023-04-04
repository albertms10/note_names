final Map<int, bool> primes = {
  1: false,
  2: true,
};

extension IntExtension on int {
  bool get isPrime {
    final cachedPrime = primes[this];
    if (cachedPrime != null) return cachedPrime;

    if (this <= 1 || isEven) return primes[this] = false;

    for (var i = 3;
        // Do not excede the square root of num.
        i * i <= this;
        // All prime numbers are 1 or 5 modulo 6.
        // Since we start with 3, this will do:
        // 3 -> 5 -> 7 -> 11 ... +2 -> +4 -> +2 -> +4 ...
        i = i % 6 == 1 ? i + 4 : i + 2) {
      if (this % i == 0) {
        return primes[this] = false;
      }
    }

    return primes[this] = true;
  }
}
