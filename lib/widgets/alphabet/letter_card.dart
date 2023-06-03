import 'package:flutter/material.dart';
import 'package:note_names/utils/int_extension.dart';

class LetterCard extends StatelessWidget {
  final String letter;
  final int? value;
  final bool isDimmed;

  const LetterCard({
    super.key,
    required this.letter,
    this.value,
    this.isDimmed = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onPrimary = theme.colorScheme.primary.withOpacity(0.8);
    final primaryBackground =
        theme.colorScheme.primary.withOpacity(isDimmed ? 0.2 : 0.35);

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
            color: primaryBackground,
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                letter.toUpperCase(),
                style: (isDimmed
                        ? theme.textTheme.displaySmall
                        : theme.textTheme.displayLarge)
                    ?.copyWith(
                  fontWeight: FontWeight.w300,
                  color: onPrimary,
                ),
              ),
              Text(
                value != null ? '$value' : '',
                style: TextStyle(
                  color: onPrimary,
                  fontWeight: value?.isPrime ?? false ? FontWeight.w800 : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
