import 'package:flutter/material.dart';
import '../models/travel_models.dart'; // REQUIRED: Tells Flutter what 'Country' is
import 'package:my_app/features/documents.dart';

class MenuPanel extends StatelessWidget {
  final Country selectedCountry;

  const MenuPanel({
    super.key,
    required this.selectedCountry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        children: [
          /// 🟢 Banner
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(
              color: Color(0xFF1B5E20),
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: const Center(
              child: Text(
                "Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),

          /// 📜 Content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                StyledDropdown(
                  title: "About Country",
                  // Check: If 'history' is a String in your model, wrap it in a list [].
                  // If it's already a List<String>, keep it as is.
                  items: [selectedCountry.details], 
                ),

                const StyledDropdown(
                  title: "Airports",
                  items: ["Airport info placeholder..."],
                ),

                StyledDropdown(
                  title: "Landmarks",
                  items: selectedCountry.landmarks
                      .map((landmark) => landmark.name)
                      .toList(),
                ),

                StyledDropdown(
                  title: "Country Rules",
                  items: selectedCountry.rules,
                ),

                StyledDropdown(
                  title: "Local Dishes",
                  // FIX: Converts List<Dish> to List<String> by taking the names
                  items: selectedCountry.dishes
                      .map((dish) => dish.name)
                      .toList(),
                ),

                _TravelRequirementsButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///////////////////////////////////////////////////////////////////////////////
/// 🔽 Styled Dropdown
///////////////////////////////////////////////////////////////////////////////

class StyledDropdown extends StatelessWidget {
  final String title;
  final List<String> items;

  const StyledDropdown({
    super.key,
    required this.title,
    required this.items,
  });

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
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 16),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        title: Text(
          title,
          style: const TextStyle(
            color: Color(0xFF1B5E20),
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        iconColor: const Color(0xFF43A047),
        collapsedIconColor: Colors.grey,
        children: items.isNotEmpty
            ? items
                .map(
                  (e) => Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: SizedBox(
                        width: double.infinity,
                        child: Text(
                          e,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                .toList()
            : [
                const Card(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Padding(
                    padding: EdgeInsets.all(12),
                    child: Text(
                      "No data available.",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black45,
                      ),
                    ),
                  ),
                )
              ],
      ),
    );
  }
}

class _TravelRequirementsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.amber,
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
        leading: const Icon(
          Icons.description,
          color: Colors.white,
        ),
        title: const Text(
          "Travel Requirements",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.white,
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const DocumentsPage(),
            ),
          );
        },
      ),
    );
  }
}