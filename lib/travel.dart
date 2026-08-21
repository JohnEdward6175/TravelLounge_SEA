import 'package:flutter/material.dart';
import 'map.dart'; // <-- make sure this exists

class TravelPage extends StatefulWidget {
  const TravelPage({super.key});

  @override
  State<TravelPage> createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  bool _showPopular = true;

  @override
  Widget build(BuildContext context) {
    final TransformationController _controller = TransformationController();
    _controller.value = Matrix4.identity()..scale(1.5);

    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          // Upper 1/3: Map
          Flexible(
            flex: 1,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ClipRect(
                  child: Stack(
                    children: [
                      InteractiveViewer(
                        transformationController: _controller,
                        minScale: 1.0,
                        maxScale: 4.0,
                        constrained: false,
                        child: Center(
                          child: Image.asset(
                            'images/ph.jpg',
                            width: constraints.maxWidth,
                            height: constraints.maxHeight,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // 🔹 Small Expand Map Button (ADDED)
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Container(
                          width: 36,
                          height: 36,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.9),
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.25),
                                blurRadius: 4,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            iconSize: 20,
                            icon: const Icon(Icons.open_in_full),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const TravelMapScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Lower 2/3
          Flexible(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Search Bar
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    color: Colors.green,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search for a country...',
                        prefixIcon: const Icon(Icons.search),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ),

                // Buttons Grid
                Expanded(
                  child: Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        children: [
                          _buildFeatureButton(context,
                              icon: Icons.flight,
                              label: 'Airports List',
                              color: Colors.blue,
                              onTap: () {}),
                          _buildFeatureButton(context,
                              icon: Icons.assignment,
                              label: 'Requirements',
                              color: Colors.green,
                              onTap: () {}),
                          _buildFeatureButton(context,
                              icon: Icons.rule,
                              label: 'Country Rules',
                              color: Colors.orange,
                              onTap: () {}),
                          _buildFeatureButton(context,
                              icon: Icons.hotel,
                              label: 'Hotels',
                              color: Colors.purple,
                              onTap: () {}),
                          _buildFeatureButton(context,
                              icon: Icons.restaurant,
                              label: 'Restaurants',
                              color: Colors.red,
                              onTap: () {}),
                          _buildFeatureButton(context,
                              icon: Icons.map,
                              label: 'Itinerary',
                              color: Colors.teal,
                              onTap: () {}),
                        ],
                      ),
                    ),
                  ),
                ),

                // Popular Destinations (Minimizable)
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                  child: Container(
                    color: Colors.green,
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Popular Destinations',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            IconButton(
                              icon: Icon(
                                _showPopular
                                    ? Icons.keyboard_arrow_down
                                    : Icons.keyboard_arrow_up,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                setState(() {
                                  _showPopular = !_showPopular;
                                });
                              },
                            ),
                          ],
                        ),

                        AnimatedCrossFade(
                          duration: const Duration(milliseconds: 250),
                          crossFadeState: _showPopular
                              ? CrossFadeState.showFirst
                              : CrossFadeState.showSecond,
                          firstChild: SizedBox(
                            height: 100,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: [
                                _buildDestinationCard('Bangkok', 'Thailand'),
                                _buildDestinationCard('Jakarta', 'Indonesia'),
                                _buildDestinationCard('Manila', 'Philippines'),
                                _buildDestinationCard(
                                    'Kuala Lumpur', 'Malaysia'),
                              ],
                            ),
                          ),
                          secondChild: const SizedBox.shrink(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureButton(BuildContext context,
      {required IconData icon,
      required String label,
      required Color color,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 8),
            Text(label,
                style: TextStyle(
                    color: color, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _buildDestinationCard(String city, String country) {
    return Container(
      width: 120,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.location_on, size: 30, color: Colors.blue),
          const SizedBox(height: 8),
          Text(city, style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(country, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
