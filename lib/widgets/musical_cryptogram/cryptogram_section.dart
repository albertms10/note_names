import 'package:flutter/material.dart';
import 'package:note_names/model/name.dart';
import 'package:note_names/widgets/musical_cryptogram/cryptogram_scheme_dropdown.dart';
import 'package:note_names/widgets/musical_cryptogram/note_cards.dart';
import 'package:note_names/widgets/name_section_text_field.dart';
import 'package:note_names/widgets/name_section_value.dart';

class CryptogramSection extends StatefulWidget {
  final Name name;

  const CryptogramSection({super.key, required this.name});

  @override
  State<CryptogramSection> createState() => _CryptogramSectionState();
}

class _CryptogramSectionState extends State<CryptogramSection> {
  late Name _name = widget.name;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.primary;
    const contentPadding = EdgeInsetsDirectional.only(
      start: 36,
      top: 12,
      end: 320,
      bottom: 12,
    );

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
              child: NameSectionValue(value: _name.numericValue),
            ),
          ),
          Center(
            child: FittedBox(
              child: Padding(
                padding: contentPadding,
                child: NoteCards(name: _name),
              ),
            ),
          ),
          NameSectionTextField(
            name: _name.name,
            contentPadding: contentPadding,
            onChanged: (value) {
              setState(() {
                _name = _name.copyWith(name: value);
              });
            },
          ),
          Container(
            width: 250,
            margin: const EdgeInsetsDirectional.only(start: 36),
            child: CryptogramSchemeDropdown(
              name: _name,
              onSchemeChanged: (scheme) {
                setState(() {
                  _name = _name.copyWith(scheme: scheme);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
