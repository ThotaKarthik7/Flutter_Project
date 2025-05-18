import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import 'Note_model.dart';

class NoteProvider extends ChangeNotifier {
  List<Note> _notes = [];
  List<Note> get notes => _searchQuery.isEmpty
      ? _notes
      : _notes
      .where((note) =>
      note.title.toLowerCase().contains(_searchQuery.toLowerCase()))
      .toList();

  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  void addNote(String title) {
    _notes.add(Note(title: title));
    saveNotesToPrefs();
    notifyListeners();
  }

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  Future<void> loadNotesFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = prefs.getStringList('notes') ?? [];
    _notes = data
        .map((noteStr) => Note.fromMap(json.decode(noteStr)))
        .toList();
    notifyListeners();
  }

  Future<void> saveNotesToPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final data = _notes.map((note) => json.encode(note.toMap())).toList();
    await prefs.setStringList('notes', data);
  }
}
