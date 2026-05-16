import 'package:flutter/material.dart';
import 'package:note_names/model/name.dart';
import 'package:note_names/widgets/musical_cryptogram/note_card.dart';

class NoteCards extends StatelessWidget {
  final Name name;

  const NoteCards({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        alignment: .center,
        runSpacing: 8,
        crossAxisAlignment: .end,
        children: [
          for (final note in name.musicalCryptogram)
            NoteCard(label: note.format(name.scheme.notationSystem)),
        ],
      ),
    );
  }
}
