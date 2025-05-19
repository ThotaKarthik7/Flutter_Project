import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Note_Provider.dart';
import 'Note_Home_Screen.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        final provider = NoteProvider();
        provider.loadNotesFromPrefs();
        return provider;
      },
      child: MaterialApp(
        title: 'Notes App',
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
