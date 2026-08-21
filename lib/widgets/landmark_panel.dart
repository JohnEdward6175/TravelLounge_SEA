import 'package:flutter/material.dart';
import '../models/travel_models.dart';

class LandmarkPanel extends StatelessWidget {
  final List<Landmark> landmarks;
  final Map<String, bool> bookmarkedLandmarks;
  final Function(String) onBookmarkToggle;

  const LandmarkPanel({
    super.key,
    required this.landmarks,
    required this.bookmarkedLandmarks,
    required this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: landmarks.length,
      itemBuilder: (context, index) {
        final landmark = landmarks[index];
        final isBookmarked = bookmarkedLandmarks[landmark.name] ?? false;

        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      landmark.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF1B5E20),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: isBookmarked ? Colors.green : Colors.grey,
                    ),
                    onPressed: () => onBookmarkToggle(landmark.name),
                  ),
                ],
              ),
              Text(
                landmark.description,
                style: TextStyle(color: Colors.grey.shade700, height: 1.4),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 100, // Reduced height for the 3-grid display
                child: landmark.images.isEmpty
                    ? _buildImagePlaceholder()
                    : _buildHorizontalGallery(landmark.images),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHorizontalGallery(List<String> images) {
    final displayImages = images.take(3).toList();

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        childAspectRatio: 1.0,
      ),
      itemCount: displayImages.length,
      itemBuilder: (context, i) {
        return GestureDetector(
          onTap: () => _showGalleryDialog(context, images, i),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(displayImages[i], fit: BoxFit.cover),
          ),
        );
      },
    );
  }

  // --- Updated Helper: Floating Dialog Gallery ---
  void _showGalleryDialog(BuildContext context, List<String> images, int initialIndex) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent, // Makes the box "float"
        insetPadding: const EdgeInsets.all(20),
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              PageView.builder(
                controller: PageController(initialPage: initialIndex),
                itemCount: images.length,
                itemBuilder: (context, i) => ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(images[i], fit: BoxFit.cover),
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  icon: const Icon(Icons.close, color: Colors.white, shadows: [
                    Shadow(blurRadius: 10, color: Colors.black)
                  ]),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImagePlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(child: Icon(Icons.image_not_supported_outlined, color: Colors.grey)),
    );
  }
}