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
    const contentPadding = EdgeInsetsDirectional.only(
      start: 36,
      top: 12,
      end: 320,
      bottom: 12,
    );

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
                    child: _NameSectionValue(value: name.value),
                  ),
                ),
                Center(
                  child: FittedBox(
                    child: Padding(
                      padding: contentPadding,
                      child: NameLabels(name: name),
                    ),
                  ),
                ),
                _NameSectionTextField(
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

class _NameSectionValue extends StatelessWidget {
  final int value;

  const _NameSectionValue({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.primary;

    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: AlignmentDirectional.centerEnd,
      child: Text(
        '$value',
        style: theme.textTheme.displayLarge?.copyWith(
          fontSize: 200,
          fontWeight: FontWeight.w100,
          color: color.withOpacity(0.2),
          letterSpacing: -8,
        ),
      ),
    );
  }
}

class _NameSectionTextField extends StatefulWidget {
  final String? name;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String? value)? onChanged;

  const _NameSectionTextField({
    super.key,
    this.name,
    this.contentPadding,
    this.onChanged,
  });

  @override
  State<_NameSectionTextField> createState() => _NameSectionTextFieldState();
}

class _NameSectionTextFieldState extends State<_NameSectionTextField> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.name);

  late final FocusNode _focusNode = FocusNode()..addListener(_onFocusChange);
  final ValueNotifier<bool> _focusNotifier = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _focusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    _focusNotifier.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    _focusNotifier.value = _focusNode.hasFocus;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.primary;

    return ValueListenableBuilder(
      valueListenable: _focusNotifier,
      builder: (context, isFocused, child) {
        return TextField(
          controller: _controller,
          focusNode: _focusNode,
          decoration: InputDecoration(
            hintText: 'Type a name',
            contentPadding: widget.contentPadding,
            filled: true,
            fillColor: isFocused ? color.withOpacity(0.15) : Colors.transparent,
            hoverColor: color.withOpacity(0.05),
            border: InputBorder.none,
          ),
          style: const TextStyle(color: Colors.transparent),
          textAlign: TextAlign.center,
          textAlignVertical: TextAlignVertical.center,
          showCursor: false,
          autocorrect: false,
          maxLines: null,
          expands: true,
          onChanged: widget.onChanged,
          enableInteractiveSelection: false,
        );
      },
    );
  }
}
