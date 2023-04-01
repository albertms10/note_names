import 'package:flutter/material.dart';
import 'package:note_names/model/alphabet.dart';
import 'package:note_names/model/name.dart';
import 'package:note_names/widgets/name_section.dart';

class AlphabetDropdown extends StatelessWidget {
  final Name name;
  final void Function(Alphabet?)? onAlphabetChanged;

  const AlphabetDropdown({
    super.key,
    required this.name,
    this.onAlphabetChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(top: 16),
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: DropdownButtonFormField(
          items: [
            for (final alphabet in Alphabet.alphabets)
              DropdownMenuItem(
                key: ValueKey(alphabet.name),
                value: alphabet,
                child: _AlphabetDropdownMenuItem(
                  name: name.name,
                  alphabet: alphabet,
                ),
              ),
          ],
          value: name.alphabet,
          onChanged: onAlphabetChanged,
          decoration: const InputDecoration.collapsed(hintText: 'Alphabet'),
        ),
      ),
    );
  }
}

class _AlphabetDropdownMenuItem extends StatelessWidget {
  final String name;
  final Alphabet alphabet;

  const _AlphabetDropdownMenuItem({
    super.key,
    required this.name,
    required this.alphabet,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DropdownMenuItem(
      value: alphabet,
      child: Theme(
        data: theme.copyWith(
          colorScheme: ColorScheme.fromSeed(
            seedColor: NameSection.colorFromValue(
              alphabet.valueOfName(name),
            ),
          ),
        ),
        child: Builder(
          builder: (context) {
            final theme = Theme.of(context);

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  alphabet.name,
                  style: TextStyle(
                    color: theme.colorScheme.primary,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(width: 14),
                Text(
                  '${alphabet.valueOfName(name)}',
                  style: TextStyle(
                    color: theme.colorScheme.primary.withOpacity(0.6),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
