import 'package:flutter/material.dart';

class AlphabetLetter extends StatelessWidget {
  final String letter;
  final int? value;

  const AlphabetLetter({super.key, required this.letter, this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      child: Material(
        elevation: 1.5,
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 18,
          ),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.4),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                letter.toUpperCase(),
                style: theme.textTheme.displayLarge
                    ?.copyWith(fontWeight: FontWeight.w300),
              ),
              Text(value != null ? '$value' : ''),
            ],
          ),
        ),
      ),
    );
  }
}
