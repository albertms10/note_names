import 'package:flutter/material.dart';
import 'package:music_notes/music_notes.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onPrimary = theme.colorScheme.primary.withOpacity(0.8);

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
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '$note',
                style: theme.textTheme.displayLarge?.copyWith(
                  fontWeight: FontWeight.w300,
                  color: onPrimary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
