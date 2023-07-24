import 'package:flutter/material.dart';
import 'package:note_names/model/name.dart';
import 'package:note_names/widgets/alphabet/alphabet_dropdown.dart';
import 'package:note_names/widgets/alphabet/letter_cards.dart';
import 'package:note_names/widgets/name_section_text_field.dart';
import 'package:note_names/widgets/name_section_value.dart';

class NameSection extends StatefulWidget {
  final Name name;

  const NameSection({super.key, required this.name});

  static Color colorFromValue(int value) =>
      Colors.primaries[value % Colors.primaries.length];

  @override
  State<NameSection> createState() => _NameSectionState();
}

class _NameSectionState extends State<NameSection> {
  late Name name = widget.name;

  @override
  Widget build(BuildContext context) {
    const contentPadding = EdgeInsetsDirectional.only(
      start: 36,
      top: 12,
      end: 320,
      bottom: 12,
    );

    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: NameSection.colorFromValue(name.numericValue),
        ),
      ),
      child: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          final color = theme.colorScheme.primary;

          return Container(
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              border: Border(
                bottom: BorderSide(color: color.withOpacity(0.4), width: 2),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Container(
                    padding: const EdgeInsetsDirectional.only(end: 36),
                    width: MediaQuery.of(context).size.width / 4,
                    child: NameSectionValue(value: name.numericValue),
                  ),
                ),
                Center(
                  child: FittedBox(
                    child: Padding(
                      padding: contentPadding,
                      child: LetterCards(name: name),
                    ),
                  ),
                ),
                NameSectionTextField(
                  name: name.name,
                  contentPadding: contentPadding,
                  onChanged: (value) {
                    setState(() {
                      name = name.copyWith(name: value);
                    });
                  },
                ),
                Container(
                  width: 250,
                  margin: const EdgeInsetsDirectional.only(start: 36),
                  child: AlphabetDropdown(
                    name: name,
                    onAlphabetChanged: (alphabet) {
                      setState(() {
                        name = name.copyWith(alphabet: alphabet);
                      });
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
