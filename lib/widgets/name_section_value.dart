import 'package:flutter/material.dart';

class NameSectionValue extends StatelessWidget {
  final int value;

  const NameSectionValue({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.primary;

    return FittedBox(
      fit: .scaleDown,
      alignment: AlignmentDirectional.centerEnd,
      child: Text(
        '$value',
        style: theme.textTheme.displayLarge?.copyWith(
          fontSize: 200,
          fontWeight: .w100,
          color: color.withValues(alpha: 0.2),
          letterSpacing: -8,
        ),
      ),
    );
  }
}
