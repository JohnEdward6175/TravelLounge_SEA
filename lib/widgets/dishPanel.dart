import 'package:flutter/material.dart';
import '../models/travel_models.dart';
import '../dataHandler/dishes_data.dart';

class DishPanel extends StatelessWidget {
  final String countryName;

  const DishPanel({super.key, required this.countryName});

  @override
  Widget build(BuildContext context) {
    final List<Dish> dishes = countryDishesData[countryName] ?? [];

    if (dishes.isEmpty) {
      return const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("No dishes available for this country."),
      );
    }

    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      itemCount: dishes.length,
      itemBuilder: (context, index) {
        final dish = dishes[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                dish.name.toUpperCase(),
                style: const TextStyle(
                  color: Color(0xFFE64A19),
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 0.5,
                ),
              ),
              Text(
                "Origin: ${dish.regionOrigin}",
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey,
                  fontSize: 12,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                dish.description,
                style: const TextStyle(fontSize: 14, height: 1.4, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              
              /// 📜 History Container
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.shade50,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.orange.shade100),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.history_edu, size: 18, color: Colors.brown),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        dish.history,
                        style: const TextStyle(fontSize: 12, color: Colors.brown, fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              /// 🖼️ Updated Clickable Gallery
              SizedBox(
                height: 100,
                child: dish.images.isEmpty
                    ? _buildFoodPlaceholder()
                    : _buildHorizontalGallery(context, dish.images),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHorizontalGallery(BuildContext context, List<String> images) {
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
            child: Image.asset(images[i], fit: BoxFit.cover),
          ),
        );
      },
    );
  }

  void _showGalleryDialog(BuildContext context, List<String> images, int initialIndex) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
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

  Widget _buildFoodPlaceholder() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(child: Icon(Icons.restaurant, color: Colors.orange)),
    );
  }
}