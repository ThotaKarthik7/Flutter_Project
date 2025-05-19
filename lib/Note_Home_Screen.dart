import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Note_Provider.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController _controller = TextEditingController();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NoteProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes App"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: provider.setSearchQuery,
              decoration: const InputDecoration(
                hintText: 'Search notes...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      hintText: "Enter note title",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      provider.addNote(_controller.text.trim());
                      _controller.clear();
                    }
                  },
                  child: const Text("Add"),
                ),
              ],
            ),
          ),
          Expanded(
            child: provider.notes.isEmpty
                ? const Center(child: Text("No notes available."))
                : ListView.builder(
              itemCount: provider.notes.length,
              itemBuilder: (_, index) {
                return ListTile(
                  leading: const Icon(Icons.note),
                  title: Text(provider.notes[index].title),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
