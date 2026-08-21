import 'package:flutter/material.dart';
import 'package:my_app/dataHandler/diary_data.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/diaryImage/diary_image.dart';

class DiaryDetailScreen extends StatefulWidget {
  final DiaryEntry entry;

  const DiaryDetailScreen({super.key, required this.entry});

  @override
  State<DiaryDetailScreen> createState() => _DiaryDetailScreenState();
}

class _DiaryDetailScreenState extends State<DiaryDetailScreen> {
  late TextEditingController _titleController;
  late TextEditingController _contentController;
  bool _isEditingTitle = false;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.entry.title);
    _contentController = TextEditingController(text: widget.entry.preview);

    // Safety check: ensure both lists are initialized from our updated model defaults
    widget.entry.image ??= [];
    widget.entry.imageNames ??= [];
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
  }

  // --- NEW: Helper for Image Name Updates ---
  void _updateImageName(int index, String newName) {
    setState(() {
      // Ensure the name list matches the image list length to prevent range errors
      while (widget.entry.imageNames.length < widget.entry.image.length) {
        widget.entry.imageNames.add("");
      }
      widget.entry.imageNames[index] = newName;
    });
    // Hive persistence is usually handled in _saveDiary,
    // but you can call widget.entry.save() here if you want instant updates.
  }

  void _saveDiary() async {
    try {
      // 1. Sync data from controllers to the object
      widget.entry.title = _titleController.text.trim().isEmpty
          ? "Untitled Entry"
          : _titleController.text;

      widget.entry.preview = _contentController.text;
      widget.entry.isChecklist = false;

      // 2. The Fail-Safe Save
      final box = Hive.box<DiaryEntry>('entries');
      
      // If it's an existing entry, save() works. 
      // If it's new, we put it in the box manually.
      if (widget.entry.isInBox) {
        await widget.entry.save();
      } else {
        await box.put(widget.entry.id, widget.entry);
      }

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Entry Saved Successfully!'), backgroundColor: Colors.redAccent),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      // This will tell you EXACTLY why the button "isn't working"
      print("SAVE ERROR: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error saving: $e'), backgroundColor: Colors.black),
      );
    }
  }

  void _deleteDiary() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Entry?"),
        content: const Text(
          "Are you sure you want to delete this diary entry?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              final box = Hive.box<DiaryEntry>('entries');
              box.delete(widget.entry.id);
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.shade50,
        child: Column(
          children: [
            // ---------------- Header ----------------
            Container(
              padding: const EdgeInsets.fromLTRB(24, 48, 24, 16),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.redAccent, Color.fromARGB(255, 219, 7, 7)],
                ),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.save, color: Colors.white),
                            onPressed: _saveDiary,
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.white),
                            onPressed: _deleteDiary,
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(22),
                          ),
                          child: const Icon(Icons.close, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  GestureDetector(
                    onTap: () => setState(() => _isEditingTitle = true),
                    child: _isEditingTitle
                        ? TextField(
                            controller: _titleController,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                            autofocus: true,
                            onSubmitted: (_) =>
                                setState(() => _isEditingTitle = false),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Enter title...',
                              hintStyle: TextStyle(color: Colors.white70),
                            ),
                          )
                        : Text(
                            widget.entry.title.isNotEmpty
                                ? widget.entry.title
                                : 'Diary Title',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${widget.entry.date} • ${widget.entry.time}',
                    style: const TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                ],
              ),
            ),

            // ---------------- Content Area ----------------
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    _buildCategoryHeader(
                      title: "Add Photos",
                      onEdit: () {},
                      onDelete: () => setState(() {
                        widget.entry.image!.clear();
                        widget.entry.imageNames.clear();
                      }),
                    ),

                    // --- Integrated Photo Logic with "Kick" features ---
                    DiaryImageHandler(
                      images: widget.entry.image!,
                      imageNames: widget.entry.imageNames,
                      onImageAdded: (path) {
                        setState(() {
                          widget.entry.image!.add(path);
                          widget.entry.imageNames.add(""); // Keep list parity
                        });
                      },
                      onImageRemoved: (index) {
                        setState(() {
                          widget.entry.image!.removeAt(index);
                          widget.entry.imageNames.removeAt(index);
                        });
                      },
                      onImageNameUpdated: _updateImageName,
                    ),

                    const SizedBox(height: 16),

                    _buildCategoryHeader(
                      title: "Diary Entry",
                      onEdit: () {},
                      onDelete: () => _contentController.clear(),
                    ),

                    TextField(
                      controller: _contentController,
                      maxLines: null,
                      onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        hintText: 'Write your diary entry here...',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        '${_contentController.text.length} characters',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryHeader({
    required String title,
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.white),
                onPressed: onDelete,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
