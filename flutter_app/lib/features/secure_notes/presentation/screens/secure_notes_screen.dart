import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/encryption_service.dart';
import '../../logic/providers/notes_provider.dart';
import 'add_note_screen.dart';
import 'edit_note_screen.dart';

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
                "No Notes Yet",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: provider.notes.length,
            itemBuilder: (context, index) {
              final note = provider.notes[index];

              String title;
              String content;

              try {
                title =
                    EncryptionService.decryptText(note.title);
              } catch (_) {
                title = note.title;
              }

              try {
                content =
                    EncryptionService.decryptText(note.content);
              } catch (_) {
                content = note.content;
              }

              return Card(
                elevation: 3,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => EditNoteScreen(
                          index: index,
                          note: note,
                        ),
                      ),
                    );
                  },
                  child: ListTile(
                    title: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      content,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      onPressed: () {
                        provider.deleteNote(index);
                      },
                    ),
                  ),
                ),
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