import 'package:flutter/material.dart';
import 'package:note_names/model/name.dart';
import 'package:note_names/widgets/alphabet_dropdown.dart';
import 'package:note_names/widgets/name_labels.dart';

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
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: NameSection.colorFromValue(name.value),
        ),
      ),
      child: Builder(
        builder: (context) {
          final theme = Theme.of(context);
          final color = theme.colorScheme.primary;

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 36),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              border: Border(
                bottom: BorderSide(color: color.withOpacity(0.4), width: 2),
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                _NameSectionValue(value: name.value, color: color),
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                    top: 12,
                    end: 320,
                    bottom: 12,
                  ),
                  child: NameLabels(name: name),
                ),
                SizedBox(
                  width: 250,
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

class _NameSectionValue extends StatelessWidget {
  final int value;
  final Color color;

  const _NameSectionValue({
    super.key,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Text(
        '$value',
        style: theme.textTheme.displayLarge?.copyWith(
          fontSize: 156,
          fontWeight: FontWeight.w100,
          color: color.withOpacity(0.2),
          letterSpacing: -8,
        ),
      ),
    );
  }
}
