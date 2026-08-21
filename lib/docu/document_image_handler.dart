import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class DocumentImageHandler extends StatelessWidget {
  final String? imagePath; // Changed from List to String
  final Function(String) onImagePicked;
  final Function() onImageRemoved;

  const DocumentImageHandler({
    super.key,
    required this.imagePath,
    required this.onImagePicked,
    required this.onImageRemoved,
  });

  Future<void> _pickImage() async {
    final XFile? file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file != null) {
      final dir = await getApplicationDocumentsDirectory();
      final newFile = await File(file.path).copy("${dir.path}/${p.basename(file.path)}");
      onImagePicked(newFile.path); // Return the path string
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (imagePath != null && File(imagePath!).existsSync())
          Stack(
            children: [
              Image.file(File(imagePath!), height: 150, fit: BoxFit.cover),
              IconButton(icon: const Icon(Icons.cancel, color: Colors.red), onPressed: onImageRemoved),
            ],
          )
        else
          ElevatedButton(onPressed: _pickImage, child: const Text("Add Image")),
      ],
    );
  }
}