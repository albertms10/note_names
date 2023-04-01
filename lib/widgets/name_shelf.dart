import 'package:flutter/material.dart';
import 'package:note_names/model/name.dart';
import 'package:note_names/widgets/name_section.dart';

class NameShelf extends StatelessWidget {
  final List<Name> names;

  const NameShelf({super.key, required this.names});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (final name in names)
          Expanded(
            child: NameSection(name: name),
          ),
      ],
    );
  }
}
