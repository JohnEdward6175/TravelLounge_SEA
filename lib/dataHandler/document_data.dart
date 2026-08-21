import 'package:hive/hive.dart';

part 'document_data.g.dart';

@HiveType(typeId: 5)
class DocumentItem extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String? description;
  @HiveField(2)
  bool isChecked;
  @HiveField(3)
  String? imagePath; // Changed from bool hasImage

  DocumentItem({
    required this.name,
    this.description,
    this.isChecked = false,
    this.imagePath,
  });
}

@HiveType(typeId: 6) // Change from 4 to 6
class DocumentList extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String country;
  @HiveField(2)
  List<DocumentItem> items;

  DocumentList({
    required this.title,
    required this.country,
    required this.items,
  });
}