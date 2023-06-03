import 'package:flutter/material.dart';
import 'package:note_names/model/name.dart';
import 'package:note_names/widgets/name_shelf.dart';

class NoteNamesApp extends StatefulWidget {
  const NoteNamesApp({super.key});

  @override
  State<NoteNamesApp> createState() => _NoteNamesAppState();
}

class _NoteNamesAppState extends State<NoteNamesApp> {
  final ValueNotifier<List<Name>> names = ValueNotifier([
    const Name('Bach'),
    const Name('S.D.G.'),
    const Name('Alain'),
    const Name('Gade'),
  ]);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: names,
          builder: (context, names, child) {
            return NameShelf(names: names);
          },
        ),
      ),
      title: 'Note Names',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    );
  }
}
