import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/services/encryption_service.dart';
import '../../domain/models/note_model.dart';
import '../../logic/providers/notes_provider.dart';

class EditNoteScreen extends StatefulWidget {
  final int index;
  final NoteModel note;

  const EditNoteScreen({
    super.key,
    required this.index,
    required this.note,
  });

  @override
  State<EditNoteScreen> createState() => _EditNoteScreenState();
}

class _EditNoteScreenState extends State<EditNoteScreen> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  @override
  void initState() {
    super.initState();

    String title;
    String content;

    try {
      title = EncryptionService.decryptText(widget.note.title);
    } catch (_) {
      title = widget.note.title;
    }

    try {
      content = EncryptionService.decryptText(widget.note.content);
    } catch (_) {
      content = widget.note.content;
    }

    titleController = TextEditingController(text: title);
    contentController = TextEditingController(text: content);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesProvider>(
      context,
      listen: false,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: "Title",
              ),
            ),

            const SizedBox(height: 16),

            TextField(
              controller: contentController,
              maxLines: 6,
              decoration: const InputDecoration(
                labelText: "Content",
              ),
            ),

            const SizedBox(height: 24),

            ElevatedButton(
              onPressed: () async {
                await provider.updateNote(
                  widget.index,
                  NoteModel(
                    title: EncryptionService.encryptText(
                      titleController.text,
                    ),
                    content: EncryptionService.encryptText(
                      contentController.text,
                    ),
                  ),
                );

                if (context.mounted) {
                  Navigator.pop(context);
                }
              },
              child: const Text("Update Note"),
            ),
          ],
        ),
      ),
    );
  }
}