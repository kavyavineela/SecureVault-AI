import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../domain/models/note_model.dart';

class NotesProvider extends ChangeNotifier {
  final Box<NoteModel> _notesBox = Hive.box<NoteModel>('notes');

  List<NoteModel> get notes => _notesBox.values.toList();

  Future<void> addNote(NoteModel note) async {
    await _notesBox.add(note);
    notifyListeners();
  }

  Future<void> deleteNote(int index) async {
    await _notesBox.deleteAt(index);
    notifyListeners();
  }

  Future<void> updateNote(int index, NoteModel note) async {
    await _notesBox.putAt(index, note);
    notifyListeners();
  }
}