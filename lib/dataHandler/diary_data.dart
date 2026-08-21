import 'package:hive/hive.dart';
import 'package:intl/intl.dart';

part 'diary_data.g.dart';

@HiveType(typeId: 0)
class DiaryEntry extends HiveObject {
  
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String date;

  @HiveField(3)
  String time;

  @HiveField(4)
  String preview;

  @HiveField(5)
  List<String> image; 

  @HiveField(6)
  bool isChecklist;

  @HiveField(7)
  List<String> checklistItems;

  @HiveField(8)
  List<bool> checklistStates;

  // --- NEW FIELD FOR IMAGE NAMES ---
  @HiveField(9)
  List<String> imageNames;

  DiaryEntry({
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    this.preview = "",
    this.image = const [],
    this.isChecklist = false,
    this.checklistItems = const [],
    this.checklistStates = const [],
    this.imageNames = const [], // Default empty list
  });

  // Factory constructor for new diary entry
  factory DiaryEntry.newDiaryEntry() {
    final now = DateTime.now();
    return DiaryEntry(
      id: now.millisecondsSinceEpoch.toString(),
      title: '',
      date: DateFormat('yyyy-MM-dd').format(now),
      time: DateFormat('hh:mm a').format(now),
      preview: '',
      image: [],
      imageNames: [], // Initialize empty
      isChecklist: false,
    );
  }

  // Factory constructor for new checklist entry
  factory DiaryEntry.newChecklistEntry() {
    final now = DateTime.now();
    return DiaryEntry(
      id: now.millisecondsSinceEpoch.toString(),
      title: '',
      date: DateFormat('yyyy-MM-dd').format(now),
      time: DateFormat('hh:mm a').format(now),
      preview: '',
      image: [],
      imageNames: [], // Initialize empty
      isChecklist: true,
    );
  }
}