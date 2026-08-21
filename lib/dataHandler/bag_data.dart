import 'package:hive/hive.dart';

part 'bag_data.g.dart';

@HiveType(typeId: 2)
class BagItem extends HiveObject {
  @HiveField(0)
  String name;
  @HiveField(1)
  String? description;
  @HiveField(2)
  bool isChecked;

  BagItem({required this.name, this.description, this.isChecked = false});
}

@HiveType(typeId: 3)
class BagCategory extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String country;
  @HiveField(2)
  List<BagItem> items;

  BagCategory({required this.title, required this.country, required this.items});
}