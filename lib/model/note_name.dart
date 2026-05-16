import 'package:music_notes/music_notes.dart';

/// The French notation system for [NoteName].
final class FrenchNoteNameNotation extends StringNotationSystem<NoteName> {
  /// Creates a new [FrenchNoteNameNotation].
  const FrenchNoteNameNotation();

  static final _noteNames = <NoteName, String>{
    .c: 'Do',
    .d: 'Ré',
    .e: 'Mi',
    .f: 'Fa',
    .g: 'Sol',
    .a: 'La',
    .b: 'Si',
  };

  static final _regExp = RegExp(
    '(?<noteName>${_noteNames.values.join('|')})',
    caseSensitive: false,
  );

  @override
  RegExp get regExp => _regExp;

  @override
  NoteName parseMatch(RegExpMatch match) {
    final name = match.namedGroup('noteName')!.toLowerCase();

    return _noteNames.entries
        .firstWhere((entry) => entry.value.toLowerCase() == name)
        .key;
  }

  @override
  String format(NoteName noteName) => _noteNames[noteName]!;
}
