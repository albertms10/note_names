import 'package:flutter/material.dart';
import 'package:note_names/model/name.dart';
import 'package:note_names/widgets/name_shelf.dart';

class NoteNamesApp extends StatelessWidget {
  const NoteNamesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const Scaffold(
        body: NameShelf(
          names: [
            Name('Bach'),
            Name('S.D.G.'),
            Name('J.S. Bach'),
            Name('Johann Sebastian'),
          ],
        ),
      ),
      title: 'Note Names',
      theme: ThemeData(useMaterial3: true),
      debugShowCheckedModeBanner: false,
    );
  }
}
