import 'package:hive/hive.dart';

// This part tells Dart to generate the adapter code
part 'user_model.g.dart';

@HiveType(typeId: 1) // Ensure this typeId is unique (don't reuse 0 if you have other models)
class UserProfile extends HiveObject {
  @HiveField(0)
  String fullName;

  @HiveField(1)
  String username;

  @HiveField(2)
  String email;

  @HiveField(3)
  String? photoPath;

  UserProfile({
    required this.fullName,
    required this.username,
    required this.email,
    this.photoPath,
  });
}