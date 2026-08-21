import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'dataHandler/diary_data.dart';
import 'package:my_app/diary holder/diary_detail.dart';
import 'diary holder/checklist_detail.dart';
import 'diary holder/calendar.dart';

import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:my_app/globals.dart' as globals;

class DiaryScreen extends StatefulWidget {
  const DiaryScreen({super.key});

  @override
  State<DiaryScreen> createState() => _DiaryScreenState();
}

class _DiaryScreenState extends State<DiaryScreen> {
  final TextEditingController searchController = TextEditingController();
  String activeFilter = "All";
  final List<String> filters = ["All", "Diary", "Checklist"];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _setFilter(String filter) {
    setState(() {
      activeFilter = filter;
    });
  }

  // --- UNIVERSAL IMAGE LOADER (CRITICAL FIX) ---
  Widget _buildUniversalThumbnail(String path) {
    // Check if the string is likely a Base64 string
    bool isBase64 =
        path.length > 100 || (!path.contains('/') && !path.contains(':'));

    if (isBase64) {
      try {
        return Image.memory(
          base64Decode(path.contains(',') ? path.split(',').last : path),
          height: 160,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              _buildErrorPlaceholder(),
        );
      } catch (e) {
        return _buildErrorPlaceholder();
      }
    }

    // Handle Websecurity for old paths or network URLs
    if (kIsWeb) {
      return Image.network(
        path,
        height: 160,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _buildErrorPlaceholder(),
      );
    }

    // Handle Mobile/Desktop file paths
    return Image.file(
      File(path),
      height: 160,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) => _buildErrorPlaceholder(),
    );
  }

  Widget _buildErrorPlaceholder() {
    return Container(
      height: 160,
      width: double.infinity,
      color: Colors.grey.shade200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.broken_image, color: Colors.grey, size: 40),
          SizedBox(height: 4),
          Text(
            "Image Expired",
            style: TextStyle(color: Colors.grey, fontSize: 12),
          ),
        ],
      ),
    );
  }

  void _openCalendarDialog() {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        insetPadding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: SizedBox(
          width: double.infinity,
          height: 400,
          child: const CalendarScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,

      floatingActionButton: globals.isFromChat
          ? Padding(
              padding: const EdgeInsets.only(
                top: 30.0,
              ), // Moves it down from the very top edge
              child: FloatingActionButton(
                // Set to false or remove 'mini' to make it standard (bigger) size
                mini: false,
                // This shape makes it a perfect circle
                shape: const CircleBorder(),
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.white,
                onPressed: () {
                  globals.isFromChat = false;
                  Navigator.pop(context);
                },
                child: const Icon(Icons.chat, size: 28), // Increased icon size
              ),
            )
          : null,

      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          // Header with search
          Container(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 24),
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'My Diary',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Your personal journal',
                          style: TextStyle(color: Colors.white70, fontSize: 14),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: _openCalendarDialog,
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: const Icon(
                          Icons.calendar_today,
                          size: 24,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  height: 44,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: TextField(
                    controller: searchController,
                    onChanged: (value) => setState(() {}),
                    decoration: const InputDecoration(
                      hintText: 'Search entries...',
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Toggle-style Filter
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            color: Colors.white,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Row(
                children: filters.map((filter) {
                  final isActive = activeFilter == filter;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => _setFilter(filter),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isActive
                              ? Colors.redAccent
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Text(
                          filter,
                          style: TextStyle(
                            color: isActive
                                ? Colors.white
                                : Colors.grey.shade800,
                            fontWeight: isActive
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),

          // Main Content Area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              child: Stack(
                children: [
                  ValueListenableBuilder(
                    valueListenable: Hive.box<DiaryEntry>(
                      'entries',
                    ).listenable(),
                    builder: (context, Box<DiaryEntry> box, _) {
                      List<DiaryEntry> entries = box.values
                          .toList()
                          .cast<DiaryEntry>();

                      if (searchController.text.isNotEmpty) {
                        entries = entries
                            .where(
                              (e) => e.title.toLowerCase().contains(
                                searchController.text.toLowerCase(),
                              ),
                            )
                            .toList();
                      }

                      if (activeFilter == "Diary") {
                        entries = entries.where((e) => !e.isChecklist).toList();
                      } else if (activeFilter == "Checklist") {
                        entries = entries.where((e) => e.isChecklist).toList();
                      }

                      entries = entries.reversed.toList();

                      if (entries.isEmpty) {
                        return const Center(child: Text("No entries found."));
                      }

                      return ListView.builder(
                        itemCount: entries.length,
                        itemBuilder: (context, index) {
                          final entry = entries[index];

                          return Card(
                            margin: const EdgeInsets.only(bottom: 16),
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: InkWell(
                              onTap: () => _navigateToDetail(entry),
                              borderRadius: BorderRadius.circular(16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // --- UPDATED IMAGE SECTION ---
                                  if (entry.image != null &&
                                      entry.image!.isNotEmpty)
                                    ClipRRect(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(16),
                                      ),
                                      child: _buildUniversalThumbnail(
                                        entry.image![0],
                                      ),
                                    ),

                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              entry.isChecklist
                                                  ? Icons.check_box_outlined
                                                  : Icons.description_outlined,
                                              size: 20,
                                              color: Colors.redAccent,
                                            ),
                                            const SizedBox(width: 8),
                                            Expanded(
                                              child: Text(
                                                entry.title.isEmpty
                                                    ? "Untitled Entry"
                                                    : entry.title,
                                                style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 8),
                                        Text(
                                          entry.isChecklist
                                              ? entry.preview.replaceAll(
                                                  '\n',
                                                  ' • ',
                                                )
                                              : entry.preview,
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey.shade700,
                                          ),
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const Divider(
                                          height: 24,
                                          thickness: 0.5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                const Icon(
                                                  Icons.access_time,
                                                  size: 14,
                                                  color: Colors.grey,
                                                ),
                                                const SizedBox(width: 4),
                                                Text(
                                                  '${entry.date} at ${entry.time}',
                                                  style: const TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Icon(
                                              Icons.chevron_right,
                                              size: 18,
                                              color: Colors.redAccent,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),

                  // Floating Add Button
                  Positioned(
                    bottom: 2,
                    right: 2,
                    child: FloatingActionButton(
                      backgroundColor: Colors.red,
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 28,
                      ),
                      onPressed: () => _showAddModal(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToDetail(DiaryEntry entry) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => entry.isChecklist
            ? ChecklistDetailScreen(entry: entry)
            : DiaryDetailScreen(entry: entry),
      ),
    );
  }

  void _showAddModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Create New",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                ListTile(
                  leading: const Icon(Icons.edit, color: Colors.redAccent),
                  title: const Text("Diary Entry"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => DiaryDetailScreen(
                          entry: DiaryEntry.newDiaryEntry(),
                        ),
                      ),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.check_box, color: Colors.redAccent),
                  title: const Text("Checklist / List"),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChecklistDetailScreen(
                          entry: DiaryEntry.newChecklistEntry(),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
