import 'package:flutter/material.dart';
import 'package:music_notes/music_notes.dart';

class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final onPrimary = theme.colorScheme.primary.withValues(alpha: 0.8);

    return Container(
      margin: const .symmetric(horizontal: 4),
      child: Material(
        elevation: 1.5,
        color: Colors.white,
        borderRadius: const .all(.circular(12)),
        child: Container(
          padding: const .symmetric(vertical: 12, horizontal: 18),
          decoration: const BoxDecoration(borderRadius: .all(.circular(12))),
          child: Column(
            mainAxisSize: .min,
            children: [
              Text(
                '$note',
                style: theme.textTheme.displayLarge?.copyWith(
                  fontWeight: .w300,
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
