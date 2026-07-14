import 'package:flutter/material.dart';
import '../../domain/models/note_model.dart';

class NotesProvider extends ChangeNotifier {
  final List<NoteModel> _notes = [];

  List<NoteModel> get notes => _notes;

  void addNote(NoteModel note) {
    _notes.add(note);
    notifyListeners();
  }

  void deleteNote(int index) {
    _notes.removeAt(index);
    notifyListeners();
  }

  void updateNote(int index, NoteModel note) {
    _notes[index] = note;
    notifyListeners();
  }
}