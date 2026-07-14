import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../logic/providers/notes_provider.dart';
import '../widgets/note_tile.dart';
import 'add_note_screen.dart';

class SecureNotesScreen extends StatelessWidget {
  const SecureNotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Secure Notes"),
        centerTitle: true,
      ),
      body: Consumer<NotesProvider>(
        builder: (context, provider, child) {
          if (provider.notes.isEmpty) {
            return const Center(
              child: Text(
                "No Notes Added Yet",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return ListView.builder(
            itemCount: provider.notes.length,
            itemBuilder: (context, index) {
              final note = provider.notes[index];

              return NoteTile(
                title: note.title,
                content: note.content,
                onDelete: () {
                  provider.deleteNote(index);
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const AddNoteScreen(),
            ),
          );
        },
      ),
    );
  }
}