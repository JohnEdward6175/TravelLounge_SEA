import 'package:flutter/material.dart';
import '../models/travel_models.dart'; // REQUIRED: This tells Flutter what 'Country' and 'Dish' are

class CountriesPage extends StatelessWidget {
  final Country country;

  const CountriesPage({
    super.key,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F5),
      appBar: AppBar(
        title: Text("${country.name} Dishes"), // Dynamic title based on country
        backgroundColor: const Color(0xFF1B5E20),
        foregroundColor: Colors.white,
      ),
      body: country.dishes.isEmpty
          ? const Center(child: Text("No dishes added yet."))
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: country.dishes.length,
              itemBuilder: (context, index) {
                final dish = country.dishes[index];
                return _DishCard(dish: dish);
              },
            ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
/// 🍽 Dish Card
///////////////////////////////////////////////////////////////////////////////

class _DishCard extends StatelessWidget {
  final Dish dish; // Changed from String to Dish to match your model

  const _DishCard({required this.dish});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: const CircleAvatar(
          backgroundColor: Color(0xFFE8F5E9),
          child: Icon(
            Icons.restaurant_menu,
            color: Color(0xFF1B5E20),
          ),
        ),
        title: Text(
          dish.name, // Accessing the .name property of the Dish object
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1B5E20),
          ),
        ),
        subtitle: Text(
          dish.description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 13, color: Colors.black54),
        ),
      ),
    );
  }
}