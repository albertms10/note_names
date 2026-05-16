import 'package:flutter/material.dart';
import 'package:note_names/model/cryptogram_scheme.dart';
import 'package:note_names/model/name.dart';

class CryptogramSchemeDropdown extends StatelessWidget {
  final Name name;
  final void Function(CryptogramScheme?)? onSchemeChanged;

  const CryptogramSchemeDropdown({
    super.key,
    required this.name,
    this.onSchemeChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const .only(top: 16),
      child: Align(
        alignment: AlignmentDirectional.topStart,
        child: DropdownButtonFormField<CryptogramScheme>(
          items: [
            for (final scheme in CryptogramScheme.schemes)
              DropdownMenuItem(
                key: ValueKey(scheme.name),
                value: scheme,
                child: _CryptogramSchemeDropdownMenuItem(
                  name: name,
                  scheme: scheme,
                ),
              ),
          ],
          initialValue: const .german(),
          onChanged: onSchemeChanged,
          decoration: const .collapsed(hintText: 'Scheme'),
        ),
      ),
    );
  }
}

class _CryptogramSchemeDropdownMenuItem extends StatelessWidget {
  final Name name;
  final CryptogramScheme scheme;

  const _CryptogramSchemeDropdownMenuItem({
    super.key,
    required this.name,
    required this.scheme,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DropdownMenuItem(
      value: scheme,
      child: Row(
        mainAxisSize: .min,
        children: [
          Text(
            scheme.name,
            style: TextStyle(color: theme.colorScheme.primary, fontSize: 14),
          ),
          const SizedBox(width: 14),
          Text(
            scheme
                .cryptogramOf(name.name)
                .map((note) => note.format(scheme.notationSystem))
                .join('–'),
            style: TextStyle(
              color: theme.colorScheme.primary.withValues(alpha: 0.6),
              fontSize: 14,
              fontWeight: .w400,
            ),
          ),
        ],
      ),
    );
  }
}
