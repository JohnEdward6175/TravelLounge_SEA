import 'package:flutter/material.dart';

class AirportPanel extends StatelessWidget {
  final Map<String, Map<String, List<Map<String, String>>>> data;

  const AirportPanel({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // Convert the Map keys (Countries) into a list for the builder
    final countries = data.keys.toList();

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      itemCount: countries.length,
      itemBuilder: (context, index) {
        final countryName = countries[index];
        final categories = data[countryName]!;

        return Container(
          margin: const EdgeInsets.only(bottom: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 🌏 Country Header
              Row(
                children: [
                  const Icon(Icons.public, color: Color(0xFF0D47A1), size: 24),
                  const SizedBox(width: 8),
                  Text(
                    countryName.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w900, // This replaces .black
                      color: Color(0xFF0D47A1),
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              const Divider(thickness: 2, color: Color(0xFFBBDEFB)),
              const SizedBox(height: 12),

              /// ✈️ International Section
              if (categories.containsKey('International'))
                _buildCategorySection(
                  context,
                  "International Hubs",
                  categories['International']!,
                  const Color(0xFF1976D2), // Deeper Blue
                  Icons.flight_takeoff,
                ),

              const SizedBox(height: 16),

              /// 🛫 Local Section
              if (categories.containsKey('Local'))
                _buildCategorySection(
                  context,
                  "Regional & Local",
                  categories['Local']!,
                  const Color(0xFF455A64), // Steel Grey
                  Icons.local_airport,
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildCategorySection(
    BuildContext context,
    String title,
    List<Map<String, String>> airports,
    Color themeColor,
    IconData icon,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            children: [
              Icon(icon, size: 16, color: themeColor),
              const SizedBox(width: 6),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: themeColor,
                ),
              ),
            ],
          ),
        ),
        ...airports
            .map((airport) => _buildAirportCard(airport, themeColor))
            .toList(),
      ],
    );
  }

  Widget _buildAirportCard(Map<String, String> airport, Color accentColor) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: accentColor.withOpacity(0.2)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            airport['name'] ?? 'Unknown Airport',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: accentColor,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            airport['description'] ?? '',
            style: const TextStyle(
              fontSize: 13,
              height: 1.5,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
