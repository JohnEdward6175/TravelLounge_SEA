// lib/features/navbar.dart
import 'package:flutter/material.dart';
import 'documents.dart';
import 'myBag.dart';
import 'currency_converter.dart';

class FeaturesNavBar extends StatefulWidget {
  final int initialIndex;

  const FeaturesNavBar({super.key, this.initialIndex = 0});

  @override
  State<FeaturesNavBar> createState() => _FeaturesNavBarState();
}

class _FeaturesNavBarState extends State<FeaturesNavBar> {
  late int _selectedIndex;

  final List<Widget> _pages = [
    const DocumentsPage(),
    const MyBagPage(),
    const CurrencyConverterScreen(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.initialIndex;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.document_scanner),
            label: 'Documents',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'My Bag',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange),
            label: 'Currency',
          ),
        ],
      ),
    );
  }
}
