import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_app/dataHandler/diary_data.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/diaryImage/diary_image.dart';
import 'package:flutter/foundation.dart';

class ChecklistDetailScreen extends StatefulWidget {
  final DiaryEntry entry;

  const ChecklistDetailScreen({super.key, required this.entry});

  @override
  State<ChecklistDetailScreen> createState() => _ChecklistDetailScreenState();
}

class _ChecklistDetailScreenState extends State<ChecklistDetailScreen> {
  late List<String> checklistItems;
  late List<bool> checklistCompleted;

  late TextEditingController _titleController;
  bool _isEditingTitle = false;

  @override
  void initState() {
    super.initState();
    _initializeData();
    _titleController = TextEditingController(text: widget.entry.title);
  }

  void _initializeData() {
    String content = widget.entry.preview.trim();
    if (content.isEmpty) {
      checklistItems = [];
      checklistCompleted = [];
    } else {
      checklistItems = List<String>.from(content.split('\n'));
      checklistCompleted = List<bool>.filled(
        checklistItems.length,
        false,
        growable: true,
      );
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  // --- NEW: Helper for Image Name Updates ---
  void _updateImageName(int index, String newName) {
    setState(() {
      // Ensure the name list matches the image list length
      while (widget.entry.imageNames.length < widget.entry.image.length) {
        widget.entry.imageNames.add("");
      }
      widget.entry.imageNames[index] = newName;
    });
    // Hive save is handled in _saveChecklist or you can call widget.entry.save() here
  }

  void _addItem() {
    setState(() {
      checklistItems.add('New Item');
      checklistCompleted.add(false);
    });
  }

  void _editItem(int index) {
    final controller = TextEditingController(text: checklistItems[index]);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Edit Item"),
        content: TextField(
          controller: controller,
          autofocus: true,
          decoration: const InputDecoration(hintText: "Enter task..."),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                checklistItems[index] = controller.text;
              });
              Navigator.pop(context);
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  void _deleteItem(int index) {
    setState(() {
      checklistItems.removeAt(index);
      checklistCompleted.removeAt(index);
    });
  }

  void _saveChecklist() async {
  try {
    // 1. Prepare data
    widget.entry.preview = checklistItems.join('\n'); 
    
    widget.entry.title = _titleController.text.trim().isEmpty 
        ? "Untitled Checklist" 
        : _titleController.text;
        
    widget.entry.isChecklist = true;

    // 2. The "Persistence" Fix
    final box = Hive.box<DiaryEntry>('entries');

    if (widget.entry.isInBox) {
      // If editing an existing checklist
      await widget.entry.save(); 
    } else {
      // If this is a brand new checklist
      await box.put(widget.entry.id, widget.entry);
    }

    // 3. UI Feedback
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Checklist Saved Successfully!'),
          duration: Duration(seconds: 1),
          backgroundColor: Colors.redAccent,
        ),
      );
      Navigator.pop(context);
    }
  } catch (e) {
    // This will show you the error in the debug console if it fails
    debugPrint("Checklist Save Error: $e");
  }
}

  void _deleteChecklist() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Delete Checklist?"),
        content: const Text("Are you sure? This cannot be undone."),
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
                            onPressed: _saveChecklist,
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.white),
                            onPressed: _deleteChecklist,
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
                            onSubmitted: (value) =>
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
                                : 'Checklist Title',
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

            const SizedBox(height: 16),

            // ---------------- Content Area ----------------
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 8,
                ),
                child: Column(
                  children: [
                    // --- Photos Section ---
                    _buildCategoryHeader(
                      title: "Add Photos",
                      onEdit: () {},
                      onDelete: () => setState(() {
                        widget.entry.image.clear();
                        widget.entry.imageNames.clear();
                      }),
                    ),

                    // FIXED: Now passing imageNames and handling name updates
                    DiaryImageHandler(
                      images: widget.entry.image,
                      imageNames: widget.entry.imageNames,
                      onImageAdded: (path) {
                        setState(() {
                          widget.entry.image.add(path);
                          widget.entry.imageNames.add(""); // Placeholder name
                        });
                      },
                      onImageRemoved: (index) {
                        setState(() {
                          widget.entry.image.removeAt(index);
                          widget.entry.imageNames.removeAt(index);
                        });
                      },
                      onImageNameUpdated: _updateImageName,
                    ),

                    const SizedBox(height: 16),

                    // --- Checklist Section ---
                    _buildCategoryHeader(
                      title: "Check List",
                      onEdit: () {},
                      onDelete: () => setState(() {
                        checklistItems.clear();
                        checklistCompleted.clear();
                      }),
                    ),

                    ListView.builder(
                      key: ValueKey(checklistItems.length),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: checklistItems.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.grey.shade200),
                          ),
                          child: CheckboxListTile(
                            value: checklistCompleted[index],
                            onChanged: (val) {
                              setState(() => checklistCompleted[index] = val!);
                            },
                            title: Text(
                              checklistItems[index],
                              style: TextStyle(
                                decoration: checklistCompleted[index]
                                    ? TextDecoration.lineThrough
                                    : null,
                              ),
                            ),
                            secondary: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(
                                    Icons.edit,
                                    color: Colors.grey,
                                    size: 20,
                                  ),
                                  onPressed: () => _editItem(index),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.redAccent,
                                    size: 20,
                                  ),
                                  onPressed: () => _deleteItem(index),
                                ),
                              ],
                            ),
                            controlAffinity: ListTileControlAffinity.leading,
                            activeColor: Colors.redAccent,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        backgroundColor: Colors.pink,
        child: const Icon(Icons.add, color: Colors.white, size: 28),
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
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
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
                icon: const Icon(Icons.edit, color: Colors.white, size: 20),
                onPressed: onEdit,
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.white, size: 20),
                onPressed: onDelete,
                constraints: const BoxConstraints(),
                padding: const EdgeInsets.symmetric(horizontal: 8),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
