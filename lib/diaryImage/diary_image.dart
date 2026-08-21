import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart';

class DiaryImageHandler extends StatefulWidget {
  final List<String> images;
  final Function(String) onImageAdded;
  final Function(int) onImageRemoved;
  final List<String> imageNames; 
  final Function(int, String) onImageNameUpdated;

  const DiaryImageHandler({
    super.key,
    required this.images,
    required this.onImageAdded,
    required this.onImageRemoved,
    required this.imageNames,
    required this.onImageNameUpdated,
  });

  @override
  State<DiaryImageHandler> createState() => _DiaryImageHandlerState();
}

class _DiaryImageHandlerState extends State<DiaryImageHandler> {
  final Map<int, TextEditingController> _nameControllers = {};

  @override
  void dispose() {
    for (var controller in _nameControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    if (pickedFile != null) {
      final Uint8List imageBytes = await pickedFile.readAsBytes();
      final String base64String = base64Encode(imageBytes);
      widget.onImageAdded(base64String);
    }
  }

  void _openImageEditorPanel(BuildContext context, int index) {
  String currentPath = widget.images[index];
  
  if (!_nameControllers.containsKey(index)) {
    _nameControllers[index] = TextEditingController(text: widget.imageNames[index]);
  } else {
    _nameControllers[index]!.text = widget.imageNames[index];
  }
  TextEditingController nameController = _nameControllers[index]!;

  showDialog(
    context: context,
    barrierColor: Colors.black87,
    builder: (context) {
      return Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            child: Material( // Using Material ensures the frame renders correctly
              color: Colors.transparent,
              child: Container(
                // --- THE PINK FRAME ---
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEBEE), // A clear, soft Pink (Red 50)
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: Colors.pink.withOpacity(0.3), width: 2),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // --- Header Area ---
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 16, 12, 12),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: nameController,
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink),
                              decoration: InputDecoration(
                                hintText: "Add a description...",
                                hintStyle: TextStyle(color: Colors.pink.withOpacity(0.4)),
                                filled: true,
                                fillColor: Colors.white, // Plain white textbox
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // --- Close Button: White Circle, Pink Icon ---
                          GestureDetector(
                            onTap: () {
                              widget.onImageNameUpdated(index, nameController.text);
                              Navigator.pop(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(Icons.close, color: Colors.pink, size: 22),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // --- Image Section ---
                    Container(
                      constraints: BoxConstraints(
                        maxHeight: MediaQuery.of(context).size.height * 0.45,
                      ),
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: InteractiveViewer(
                          minScale: 1.0,
                          maxScale: 3.0,
                          child: _buildUniversalImage(currentPath, isThumbnail: false),
                        ),
                      ),
                    ),

                    // --- Footer Buttons ---
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          // --- Remove Button: White background, Pink text ---
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.pink,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(color: Colors.pink.withOpacity(0.5)),
                                ),
                              ),
                              onPressed: () => _confirmDelete(context, index),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.delete_outline, size: 18),
                                  SizedBox(width: 8),
                                  Text("Remove", style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          // --- Save Button: White background, Pink text ---
                          Expanded(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.pink,
                                elevation: 0,
                                padding: const EdgeInsets.symmetric(vertical: 15),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  side: BorderSide(color: Colors.pink),
                                ),
                              ),
                              onPressed: () {
                                widget.onImageNameUpdated(index, nameController.text);
                                Navigator.pop(context);
                              },
                              child: const Text("Save", style: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}

  void _confirmDelete(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (confirmContext) => AlertDialog(
        title: const Text("Delete Photo?"),
        content: const Text("This will permanently remove the image from this entry."),
        actions: [
          TextButton(onPressed: () => Navigator.pop(confirmContext), child: const Text("Cancel")),
          TextButton(
            onPressed: () {
              Navigator.pop(confirmContext); 
              Navigator.pop(context); 
              widget.onImageRemoved(index);
              _nameControllers.remove(index)?.dispose();
            },
            child: const Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }

  Widget _buildUniversalImage(String path, {bool isThumbnail = true}) {
    bool isBase64 = path.length > 100 || (!path.contains('/') && !path.contains(':'));
    BoxFit fit = isThumbnail ? BoxFit.cover : BoxFit.contain;

    if (isBase64) {
      return Image.memory(
        base64Decode(path.contains(',') ? path.split(',').last : path),
        fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildErrorWidget(isThumbnail),
      );
    }
    if (kIsWeb) {
      return Image.network(
        path, fit: fit,
        errorBuilder: (context, error, stackTrace) => _buildErrorWidget(isThumbnail),
      );
    }
    return Image.file(
      File(path), fit: fit,
      errorBuilder: (context, error, stackTrace) => _buildErrorWidget(isThumbnail),
    );
  }

  Widget _buildErrorWidget(bool isThumbnail) {
    return Container(
      color: Colors.grey.shade200,
      child: const Center(child: Icon(Icons.broken_image, color: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.images.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return GestureDetector(
              onTap: _pickImage,
              child: Container(
                width: 80,
                margin: const EdgeInsets.only(right: 12, top: 4, bottom: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.redAccent.withOpacity(0.3)),
                  boxShadow: [
                    BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 4, offset: const Offset(0, 2))
                  ],
                ),
                child: const Icon(Icons.add_a_photo_outlined, color: Colors.redAccent, size: 28),
              ),
            );
          }

          final String path = widget.images[index - 1];
          return Container(
            width: 160,
            margin: const EdgeInsets.only(right: 12, top: 4, bottom: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4, offset: const Offset(0, 2))
              ],
            ),
            child: GestureDetector(
              onTap: () => _openImageEditorPanel(context, index - 1),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: _buildUniversalImage(path),
              ),
            ),
          );
        },
      ),
    );
  }
}