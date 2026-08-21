import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import '../dataHandler/user_model.dart'; // Ensure this matches your path

import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class AccountSettingsScreen extends StatefulWidget {
  const AccountSettingsScreen({super.key});

  @override
  State<AccountSettingsScreen> createState() => _AccountSettingsScreenState();
}

class _AccountSettingsScreenState extends State<AccountSettingsScreen> {
  final _fullNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();

  String _displayName = 'App User';
  String? _imagePath;
  final Box<UserProfile> _userBox = Hive.box<UserProfile>('userBox');

  @override
  void initState() {
    super.initState();
    // Load existing data
    final user = _userBox.get('profile');
    if (user != null) {
      _fullNameController.text = user.fullName;
      _usernameController.text = user.username;
      _emailController.text = user.email;
      _displayName = user.fullName;
      _imagePath = user.photoPath;
    }

    _fullNameController.addListener(() {
      setState(
        () => _displayName = _fullNameController.text.isEmpty
            ? 'App User'
            : _fullNameController.text,
      );
    });
  }

  Future<void> _pickImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);

  if (image == null) return;

  if (kIsWeb) {
    // WEB: Just use the temporary web path directly
    setState(() {
      _imagePath = image.path; 
    });
  } else {
    // ANDROID/IOS: Copy to permanent storage
    final appDir = await getApplicationDocumentsDirectory();
    final savedImage = await File(image.path).copy('${appDir.path}/${image.name}');
    
    setState(() {
      _imagePath = savedImage.path;
    });
  }
}

  void _saveProfile() {
    final updatedUser = UserProfile(
      fullName: _fullNameController.text,
      username: _usernameController.text,
      email: _emailController.text,
      photoPath: _imagePath,
    );
    _userBox.put('profile', updatedUser);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/loginSpace.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 48),
                      GestureDetector(
                        onTap: _pickImage,
                        child: CircleAvatar(
                          key: ValueKey(_imagePath), // <--- ADD THIS LINE
                          radius: 60,
                          backgroundColor: Colors.white24,

                          // Inside your build method:
                          backgroundImage: _imagePath == null
                              ? null
                              : (kIsWeb
                                    ? NetworkImage(_imagePath!) as ImageProvider
                                    : FileImage(File(_imagePath!))),
                          child: _imagePath == null
                              ? const Icon(
                                  Icons.person,
                                  size: 60,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        _displayName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  _buildTextField(
                    _fullNameController,
                    'Full Name',
                    Icons.person,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    _usernameController,
                    'Username',
                    Icons.account_circle,
                  ),
                  const SizedBox(height: 16),
                  _buildTextField(
                    _emailController,
                    'Email Address',
                    Icons.email,
                    TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: _saveProfile,
                    child: const Text('Save Changes'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String label,
    IconData icon, [
    TextInputType type = TextInputType.text,
  ]) {
    return TextField(
      controller: controller,
      keyboardType: type,
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }
}
