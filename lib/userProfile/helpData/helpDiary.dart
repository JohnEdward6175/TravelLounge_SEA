// lib/userProfile/helpData/helpDiary.dart
import 'package:flutter/material.dart';

class HelpDiaryPage extends StatelessWidget {
  const HelpDiaryPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Diary Help")),
      body: const Center(child: Text("Your Diary help content here")),
    );
  }
}

class HelpDiaryItem {
  final String title;
  final String description;
  final IconData icon;

  HelpDiaryItem({required this.title, required this.description, required this.icon});
}

final List<HelpDiaryItem> helpDiaryData = [
  HelpDiaryItem(
    title: 'Banner',
    icon: Icons.calendar_today,
    description: 'This banner will display the following:\n'
        '• Calendar Display: To help users track the date.\n'
        '• Search bar: To help users find their entries easier.',
  ),
  HelpDiaryItem(
    title: 'Filter',
    icon: Icons.filter_list,
    description: 'This feature allows users to view their entries in a much more organized manner:\n'
        '• All: Displays all entries.\n'
        '• Diary: Displays journals or diary entries.\n'
        '• Checklist: Displays all lists created by the user.',
  ),
  HelpDiaryItem(
    title: 'Entry List',
    icon: Icons.list_alt,
    description: 'Displays all entries created by the user.',
  ),
  HelpDiaryItem(
    title: 'Entry Display',
    icon: Icons.edit_note,
    description: 'This will be the appearance of created diary entries. Each one is clickable and can be edited:\n'
        '• Save: Confirms the changes of the entry.\n'
        '• Delete: Removes the entry from your list.\n'
        '• Title: By clicking the current title, the user can update it.\n'
        '• Add Photos: To make each entry look more customized, users can add images in PNG, JPG, and JPEG formats.\n'
        '• Diary Entry: Allows users to add text to their entry as a way to record their thoughts.',
  ),
  HelpDiaryItem(
    title: 'Add Entry',
    icon: Icons.add_circle_outline,
    description: 'A dedicated tool to initiate the creation of a new diary entry or checklist item.',
  ),
];