import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
    titleController = TextEditingController(text: widget.note.title);
    contentController = TextEditingController(text: widget.note.content);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NotesProvider>(context, listen: false);

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
              onPressed: () {
                provider.updateNote(
                  widget.index,
                  NoteModel(
                    title: titleController.text,
                    content: contentController.text,
                  ),
                );

                Navigator.pop(context);
              },
              child: const Text("Update Note"),
            ),
          ],
        ),
      ),
    );
  }
}