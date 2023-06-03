import 'package:flutter/material.dart';

class NameSectionTextField extends StatefulWidget {
  final String? name;
  final EdgeInsetsGeometry? contentPadding;
  final void Function(String? value)? onChanged;

  const NameSectionTextField({
    super.key,
    this.name,
    this.contentPadding,
    this.onChanged,
  });

  @override
  State<NameSectionTextField> createState() => _NameSectionTextFieldState();
}

class _NameSectionTextFieldState extends State<NameSectionTextField> {
  late final TextEditingController _controller =
      TextEditingController(text: widget.name);

  late final FocusNode _focusNode = FocusNode()..addListener(_onFocusChange);
  final ValueNotifier<bool> _focusNotifier = ValueNotifier(false);

  @override
  void dispose() {
    _focusNode
      ..removeListener(_onFocusChange)
      ..dispose();
    _focusNotifier.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    if (_focusNode.hasFocus) _selectAll();
    _focusNotifier.value = _focusNode.hasFocus;
  }

  void _selectAll() {
    _controller.selection = TextSelection(
      baseOffset: 0,
      extentOffset: _controller.text.length,
    );
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
